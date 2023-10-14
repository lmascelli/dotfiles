if (-not (Get-Module -ListAvailable -Name PSReadLine))
{
  Install-Module PSReadLine -Scope CurrentUser -Force
}
Import-Module PSReadLine

if (-not (Get-Module -ListAvailable -Name ThreadJob))
{
  Install-Module ThreadJob -Scope CurrentUser -Force
}
Import-Module ThreadJob

$env:EDITOR = $env:VISUAL = 'nvim'

function script:CSI([string] $content)
{
  "$([char]0x1b)$content"
}

Set-PSReadLineOption -PredictionSource HistoryAndPlugin `
  -ExtraPromptLineCount 1 `
  -HistorySearchCursorMovesToEnd `
  -EditMode Vi `
  -ViModeIndicator Script `
  -ContinuationPrompt "⋯ " `
  -Colors @{ ContinuationPrompt = (CSI("[90m")) } `
  -ViModeChangeHandler {
  if ($args[0] -eq 'Command')
  {
    Write-Host -ErrorAction Ignore -NoNewLine (CSI("[2 q"))
    $script:PromptChar = "❮"
  } else
  {
    Write-Host -ErrorAction Ignore -NoNewLine (CSI("[6 q"))
    $script:PromptChar = "❯"
  }
  [Microsoft.PowerShell.PSConsoleReadLine]::InvokePrompt()
}
Set-PSReadLineKeyHandler -Key UpArrow -Function HistorySearchBackward
Set-PSReadLineKeyHandler –Key DownArrow -Function HistorySearchForward
Set-PSReadLineKeyHandler -Key k -Function HistorySearchBackward -ViMode Command
Set-PSReadLineKeyHandler -Key j -Function HistorySearchForward -ViMode Command
Set-PSReadLineKeyHandler -Key Tab -Function MenuComplete -ViMode Insert

if (Get-Command nvim -errorAction SilentlyContinue)
{
  Set-Alias -Name vim -Value nvim
  Set-Alias -Name vi -Value nvim
} elseif (Get-Command vim -errorAction SilentlyContinue)
{
  Set-Alias -Name vi -Value vim
}

$script:PromptChar = "❯"

function script:PromptPath
{
  $path = $pwd.ToString()
  if ($path.StartsWith($HOME))
  {
    "~" + $path.Substring($HOME.Length)
  } else
  {
    $path
  }
}

$script:InPSReadLine = $false
$script:LastErrorStatus = $true
$script:SlowCmd = ""
$script:PromptCharColor = CSI("[35m") # magenta
$script:CachedPath = "~"
$global:Jobs = @()

function script:UpdateStatus
{
  $null = Register-EngineEvent -SourceIdentifier PowerShell.OnIdle `
    -MaxTriggerCount 1 -Action $OnIdleCallback
}

$script:OnIdleCallback = {
  Set-PSReadLineOption -ExtraPromptLineCount 1 `
    -ContinuationPrompt "$(CSI("[90m"))⋯ $(CSI("[0m"))"
  [Microsoft.PowerShell.PSConsoleReadLine]::InvokePrompt()
}

function global:PSConsoleHostReadLine
{
  [Diagnostics.CodeAnalysis.SuppressMessageAttribute(
    "PSUseDeclaredVarsMoreThanAssignments", "", Scope="Function")]
  [System.Diagnostics.DebuggerHidden()]
  param()

  $lastRunStatus = $global:?
  $script:InPSReadLine = $true
  Microsoft.PowerShell.CoreSet-StrictMode -Off

  $res = [Microsoft.PowerShell.PSConsoleReadLine]::ReadLine(
    $host.Runspace, $ExecutionContext, $lastRunStatus)
  $runStatus = $global:?
  $exitCode = $glocal:LASTEXITCODE
  $script:InPSReadLine = $false

  try
  {
    if ($global:Jobs.Length -gt 0)
    {
      Stop-Job -Job $global:Jobs
      $null = &Receive-Job -Job $global:Jobs -Wait -AutoRemoveJob -WriteJobInResults
      $global:Jobs = @()
    }
  } catch
  {
    Write-Host -NoNewline "error: "
    Write-Host $_
  }

  $global:? = $runStatus
  $global:LASTEXITCODE = $exitCode
  return $res
}

function script:UpdateSlowCmd
{
  $script:SlowCmd = ""
  if (($lastCmd = Get-History -Count 1))
  {
    $diff = $lastCmd.EndExecutionTime - $lastCmd.StartExecutionTime
    if ($diff -ge ([timespan]::FromSeconds(6)))
    {
      if ($diff.Days -gt 0)
      {
        $script:SlowCmd = (" {0}d" -f $diff.Days)
      }
      if ($diff.Hours -gt 0)
      {
        $script:SlowCmd += (" {0}h" -f $diff.Hours)
      }
      if ($diff.Minutes -gt 0)
      {
        $script:SlowCmd += (" {0}m" -f $diff.Minutes)
      }
      if ($diff.Seconds -gt 0)
      {
        $script:SlowCmd += (" {0}s" -f $diff.Seconds)
      }
      $script:SlowCmd = "$(CSI("[33m"))$script:SlowCmd"
    }
  }
}

function global:prompt
{
  if (!$script:InPSReadLine)
  {
    $script:LastErrorStatus = $?

    &script:UpdateSlowCmd

    if (!$script:LastErrorStatus)
    {
      $script:promptCharColor = CSI("[31m") # red
    } else
    {
      $script:promptCharColor = CSI("[35m") # magenta
    }

    $script:CachedPath = &PromptPath
    # try
    # {
    #   $global:Jobs += &Start;-ThreadJob -ScriptBlock {
    #     Start-Sleep -Seconds 2
    #     $null = &script;:UpdateStatus
    #   } -StreamingHost $host
    # } catch
    # {
    #   Write-Host -NoNewline "error: "
    #   Write-Host $_
    # }
  }

  $host.UI.RawUI.WindowTitle = $script:CachedPath
  "$(CSI("[34m"))$script:CachedPath$script:SlowCmd`n$script:PromptCharColor$script:PromptChar$(CSI("[0m")) "
}

function Invoke-CmdScript
{
  param(
    [String] $scriptName
  )
  $cmdLine = """$scriptName"" $args & set"
  & $env:SystemRoot\system32\cmd.exe /c $cmdLine |
    Select-String '^([^=]*)=(.*)$' | ForEach-Object {
      $varName = $_.Matches[0].Groups[1].Value
      $varValue = $_.Matches[0].Groups[2].Value
      Set-Item Env:$varName $varValue
    }
}

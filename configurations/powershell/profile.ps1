if ($IsLinux)
{
  $env:PATH += ":~/.local/bin:~/.lm/bin"
} elseif ($IsWindows) {
  $env:PATH += ";$(Convert-Path -ErrorAction Ignore ~/.local/bin)"
  $env:PATH += ";$(Convert-Path -ErrorAction Ignore ~/.lm/bin)"
}







switch ($args[0]) {
	    "status" {
		gh auth status
	    }
	    "swap" {
		Copy-Item -Path $env:XDG_CONFIG_HOME/gh/hosts.yml -Destination $env:XDG_CONFIG_HOME/gh/_tmp_hosts.yml
		Copy-Item -Path $env:XDG_CONFIG_HOME/gh/other_hosts.yml -Destination $env:XDG_CONFIG_HOME/gh/hosts.yml
		Copy-Item -Path $env:XDG_CONFIG_HOME/gh/_tmp_hosts.yml -Destination $env:XDG_CONFIG_HOME/gh/other_hosts.yml
	    }
	    default {
		Write-Output "use [status] or [swap]"
	    }
	}

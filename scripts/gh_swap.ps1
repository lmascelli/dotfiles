switch ($args[0]) {
	    "status" {
		gh auth status
	    }
	    "swap" {
		Copy-Item -Path ~/.config/gh/hosts.yml -Destination ~/.config/gh/_tmp_hosts.yml
		Copy-Item -Path ~/.config/gh/other_hosts.yml -Destination ~/.config/gh/hosts.yml
		Copy-Item -Path ~/.config/gh/_tmp_hosts.yml -Destination ~/.config/gh/other_hosts.yml
	    }
	    default {
		Write-Output "use [status] or [swap]"
	    }
	}

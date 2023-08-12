$miniconda_version = "311_23.5.2-0"
$miniconda_url = "https://repo.anaconda.com/miniconda/Miniconda3-py$($miniconda_version)-Linux-x86_64.sh"

Invoke-WebRequest -Uri $miniconda_url -OutFile "~/.lm/tmp/miniconda.sh"

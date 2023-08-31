# This is a way to download a documentation file made by shurizzle that regards
# a way to write git commits. I don't like to keep it directly in my config
# because that way it won't be updated and, moreover, i've not any credit on it
# and this way it's clear that that work is shurizzle's.

New-Item -Path "~/.config/nvim/doc" -ItemType Directory -ErrorAction Ignore
Invoke-WebRequest -Uri "https://raw.githubusercontent.com/shurizzle/neovimmizzle/master/doc/semantic-commit.txt" -OutFile "~/.config/nvim/doc/semantic-commit.txt"
Invoke-Expression "nvim --headless +':helpt ~/.config/nvim/doc' +':quitall!'"

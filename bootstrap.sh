echo "--------------------------------------------------------------------------"
echo "---                                                                    ---"
echo "---                        LM BOOTSTRAP SCRIPT                         ---"
echo "---                                                                    ---"
echo "--------------------------------------------------------------------------"
echo 
echo "Installing pwsh ..."
bash "./scripts/installers/pwsh.sh"

echo "Installing neovim..."
pwsh -c "./scripts/installers/neovim.ps1"

echo "Installing start script"
cp "./scripts/start.sh" ~

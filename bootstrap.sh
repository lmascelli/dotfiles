echo "--------------------------------------------------------------------------"
echo "---                                                                    ---"
echo "---                        LM BOOTSTRAP SCRIPT                         ---"
echo "---                                                                    ---"
echo "--------------------------------------------------------------------------"
echo 
echo "Installing pwsh ..."
bash "./scripts/installers/pwsh.sh"

pwsh -c "./scripts/installers/neovim.ps1"

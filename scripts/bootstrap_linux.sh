echo "--------------------------------------------------------------------------"
echo "---                                                                    ---"
echo "---                        LM BOOTSTRAP SCRIPT                         ---"
echo "---                                                                    ---"
echo "---                           Linux version                            ---"
echo "--------------------------------------------------------------------------"
echo 
mkdir -p ~/.lm
mkdir -p ~/.lm/bin
mkdir -p ~/.lm/opt
mkdir -p ~/.lm/tmp
echo "Installing pwsh ..."
bash "./scripts/installers/pwsh.sh"
mkdir -p ~/.config
ln -s ~/.lm/dotfiles/configurations/powershell ~/.config/powershell
cp "./scripts/start.sh" ~

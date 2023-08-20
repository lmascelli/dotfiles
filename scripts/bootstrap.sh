echo "--------------------------------------------------------------------------"
echo "---                                                                    ---"
echo "---                        LM BOOTSTRAP SCRIPT                         ---"
echo "---                                                                    ---"
echo "--------------------------------------------------------------------------"
echo 
echo "Installing pwsh ..."
bash "./scripts/installers/pwsh.sh"
cp "./scripts/start.sh" ~
mkdir -p ~/.config

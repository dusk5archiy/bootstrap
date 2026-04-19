read -p "Name: " name_
read -p "Email: " email_

touch "$HOME/.gitconfig"
git config --global user.name "$name_"
git config --global user.email "$email_"
git config --global safe.directory '*'
git config --global init.defaultbranch main
git config --global credential.helperselector.selected "<no helper>"
git config --global --list

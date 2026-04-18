app_name="$1"
if [[ -z "$app_name" ]]; then
  read -p "Enter app name: " app_name
fi

pkg-config.sh $app_name
. "$S7SYS_DIR/get/$app_name.sh"

echo "Restart the shell to finish the installation."

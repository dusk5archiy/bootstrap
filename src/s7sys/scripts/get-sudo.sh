. /etc/os-release

if [[ "$ID" == "msys2" || "$HOME" == "/root" ]]; then
  echo ""
else
  echo "sudo"
fi

# Custom Install

## Install a new one

View available distros:

```bash
wsl --list --online
```

Install using an available online distro:

```bash
wsl --install -d "<|distro_name|>" --location "<|folder|>" --name "<|name_you_like|>"
```

or using a custom `.wsl` image:

```bash
wsl --import "<|distro_name_you_like|>" "<|installation_folder|>" "<|.wsl image file|>"
```

## Import an existing one

To import a vhdx file:

```bash
wsl --import-in-place "<|name_you_like|>" "<|path_to_vhdx_file|>"
```

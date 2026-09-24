# Linux Dotfiles

My Linux desktop configuration managed with chezmoi.

## Desktop

- niri
- DankMaterialShell
- Kitty
- Neovim / LazyVim
- Zsh
- Powerlevel10k
- Fastfetch
- Superfile
- btop
- lazygit

## Structure

```text
dot_zshrc
dot_p10k.zsh
dot_bashrc
dot_profile
dot_gitconfig

dot_config/
├── niri/
├── DankMaterialShell/
├── dms/
├── kitty/
├── nvim/
├── fastfetch/
├── superfile/
├── btop/
└── lazygit/

packages/
├── common.txt
├── debian.txt
├── fedora.txt
└── arch.txt

.chezmoiscripts/
├── run_once_install-debian.sh.tmpl
├── run_once_install-fedora.sh.tmpl
└── run_once_install-arch.sh.tmpl

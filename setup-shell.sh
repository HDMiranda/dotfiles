#! /bin/sh

# TODO: Check starship, zsh, tmux and gitmux installation

## Set referece for ZSH
if ! [ -f "${HOME}/.zshrc" ]
then
  echo "Linking .zshrc"
  ln -sr "./shell/zsh/.zshrc" "${HOME}/.zshrc"
else
  echo "ZSH config: File already exists!"
  ln -frsi "./shell/zsh/.zshrc" "${HOME}/.zshrc"
fi

## Set reference for starship
if ! [ -f "${HOME}/.config/starship.toml" ]
then
  echo "Linking starship.toml"
  ln -sr "./shell/starship/starship.toml" "${HOME}/.config/starship.toml"
else
  echo "Starship config: File already exists!"
  ln -frsi "./shell/starship/starship.toml" "${HOME}/.config/starship.toml"
fi

if ! [ -f "${HOME}/.tmux/plugins/tpm" ]
then
  echo "Installing Tmux Plugin Manager [TPM]"
  git clone "https://github.com/tmux-plugins/tpm" "${HOME}/.tmux/plugins/tpm"
fi

## Set reference for tmux
if ! [ -f "${HOME}/.tmux.conf" ]
then
  echo "Linking .tmux.conf"
  ln -sr "./shell/tmux/.tmux.conf" "${HOME}/.tmux.conf"
else
  echo "TMux config: File already exists!"
  ln -frsi "./shell/tmux/.tmux.conf" "${HOME}/.tmux.conf"
fi

## Set reference for gitmux
if ! [ -f "${HOME}/.gitmux.conf" ]
then
  echo "Linking .gitmux.conf"
  ln -sr "./shell/tmux/.gitmux.conf" "${HOME}/.gitmux.conf"
else
  echo "Gitmux config: File already exists!"
  ln -frsi "./shell/tmux/.gitmux.conf" "${HOME}/.gitmux.conf"
fi

#!/usr/bin/env bash

set -e


echo "Installing Oh-My-Posh"

curl -s https://ohmyposh.dev/install.sh | sudo bash -s

# curl -s https://raw.githubusercontent.com/JanDeDobbeleer/oh-my-posh/main/themes/cert.omp.json > ~/jandedobbeleer.omp.json
curl -s https://raw.githubusercontent.com/JanDeDobbeleer/oh-my-posh/main/themes/craver.omp.json > ~/jandedobbeleer.omp.json
grep -qF "oh-my-posh" ~/.bashrc || echo 'eval "$(oh-my-posh init bash --config ~/jandedobbeleer.omp.json)"' >> ~/.bashrc


# VSCode Integration
echo "Configuring VSCode Integration"
grep -qF "locate-shell-integration-path" ~/.bashrc || echo '[[ "$TERM_PROGRAM" == "vscode" ]] && . "$(code --locate-shell-integration-path bash)"' >> ~/.bashrc
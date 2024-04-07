#!/bin/bash

# checks system architecture
function checks_system_arch() {
    architecture_type="$(uname -m)"

    if [ "$architecture_type" == "arm64" ]; then
        echo "ARM64"
    else
        echo "INTEL"
    fi 
}

# installs specific software
function downloads_docker() {
    local system_architecture="$(checks_system_arch)"
    
    cd ~/Downloads
    
    if [ "$system_architecture" == "ARM64"]; then
        echo "Downloading docker.dmg..."
        curl -sOL https://desktop.docker.com/mac/main/arm64/Docker.dmg
        "Downloaded docker.dmg"
    else
        echo "Downloading docker.dmg..."
        curl -sOL https://desktop.docker.com/mac/main/amd64/Docker.dmg
        "Downloaded docker.dmg"
    fi
}
function installs_brew() {
    echo "Installing brew..."
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"
}

function installs_dbeaver() {
    echo "Installing dbeaver..."
    brew install --cask dbeaver-community
    echo "Dbeaver installation complete..."
}

function installs_docker() {
    downloads_docker
    cd ~/Downloads
    echo "Beginning Docker installation..."
    sudo hdutil attach Docker.dmg
    echo "This may take a few minutes..."
    sudo /Volumes/Docker/Docker.app/Contents/MacOS/install
    echo "Performing maintenance tasks..."
    sudo hdiutil detach /Volumes/Docker
    echo "Docker Installation complete..."
}

function installs_git() {
    echo "Installing git..."
    brew install git
}

function installs_mkcert() {
    echo "Installing mkcert..."
    brew install mkcert
}

function installs_nvm() {
    echo "Installing nvm..."
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/nvm-sh/nvm/master/install.sh)"
}

function installs_postgres() {
    echo "Installing postgres..."
    brew install postgresql
}

function installs_vscode() {
    echo "Installing vscode..."
    
}

function installs_yarn() {

}

# checks if specific software is installed

function is_brew_installed() {
    local brew_command="$(which brew)"

    if [ "$brew_command" ]; then
        echo "brew is installed"
    else
        echo "brew is not installed"
    fi
}

function is_dbeaver_installed() {
    local dbeaver_command="$(which dbeaver)"

    if [ "$dbeaver_command" ]; then
        echo "dbeaver is installed"
    else
        echo "dbeaver is not installed"
    fi
}

function is_docker_installed() {
    local docker_command="$(which docker-credential-desktop)"

    if [ "$docker_command" ]; then
        echo "docker desktop is installed"
    else
        echo "docker desktop is not installed"
    fi
}

function is_git_installed() {
    local git_command="$(which git)"

    if [ "$git_command" ]; then
        echo "git is installed"
    else 
        echo "git is not installed"
    fi
}

function is_mkcert_installed() {
    local mkcert_command="$(which mkcert)"

    if [ "$mkcert_command" ]; then
        echo "mkcert is installed"
    else
        echo "mkcert is not installed"
    fi
}

function is_nvm_installed() {
    local nvm_command="$(which nvm)"

    if [ "$nvm_command" ]; then
        echo "nvm is installed"
    else
        echo "nvm is not installed"
    fi
}

function is_postgres_installed() {
    local postgres_command="$(which psql)"

    if [ "$postgres_command" ]; then
        echo "postgresql is installed"
    else
        echo "postgresql in not installed"
    fi
}

function is_vscode_installed() {
    local vscode_command="$(which code)"

    if [ "$vscode_command" ]; then
        echo "vscode is installed"
    else
        echo "vscode is not installed"
    fi
}

function is_yarn_installed() {
    local yarn_command="$(which yarn)"

    if [ "$yarn_command" ]; then
        echo "yarn is installed"
    else
        echo "yarn is not installed"
    fi
}

function check_installation() {

    is_brew_installed
    is_dbeaver_installed
    is_docker_installed
    is_git_installed
    is_mkcert_installed
    is_nvm_installed
    is_postgres_installed
    is_vscode_installed
    is_yarn_installed

    echo "Please refer to README file to install software"
}
checks_system_arch
check_installation

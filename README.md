# Dotfiles Repository

This repository contains my configuration files and templates for setting up a development environment using [chezmoi](https://www.chezmoi.io/). Feel free to use it as a reference or as a starting point for your own dotfiles repository.

## Requirements

- [chezmoi](https://www.chezmoi.io/)
- [1Password CLI](https://support.1password.com/command-line-getting-started/)

## Setup

1. **Install chezmoi**:
  ```sh
  sh -c "$(curl -fsLS get.chezmoi.io/lb)"
  ```

2. **Install 1Password CLI**:
  ```sh
  curl -sS https://downloads.1password.com/linux/keys/1password.asc | sudo gpg --dearmor --output /usr/share/keyrings/1password-archive-keyring.gpg
  echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/1password-archive-keyring.gpg] https://downloads.1password.com/linux/debian/$(dpkg --print-architecture) stable main" | sudo tee /etc/apt/sources.list.d/1password.list
  sudo mkdir -p /etc/debsig/policies/AC2D62742012EA22/
  curl -sS https://downloads.1password.com/linux/debian/debsig/1password.pol | sudo tee /etc/debsig/policies/AC2D62742012EA22/1password.pol
  sudo mkdir -p /usr/share/debsig/keyrings/AC2D62742012EA22
  curl -sS https://downloads.1password.com/linux/keys/1password.asc | sudo gpg --dearmor --output /usr/share/debsig/keyrings/AC2D62742012EA22/debsig.gpg
  ``` 

3. **Install zsh**:
  ```sh
  sudo apt install zsh
  ```

4. **Install starship.sh**:
  ```sh
  curl -sS https://starship.rs/install.sh | sudo sh
  ```

5. **Apply the configuration**:
  ```sh
  chezmoi init https://github.com/nqngo/dotfiles.git
  chezmoi apply
  ```

## Usage

- `chezmoi cd` to change to the root of the chezmoi repository.
- Customise the templates in the repository to fit your needs.
- Use `chezmoi diff` to see what changes would be made.
- Use `chezmoi apply` to apply changes to your environment.

## My Workflow

Instead of manually installing software as shown in the setup section, I use `cloud-init` to bootstrap the environment. Here is an example of a `cloud-init` configuration that installs the required software and applies the dotfiles:

https://github.com/nqngo/wsl-cloud-init

Then I simply run the final command to apply the configuration:
  ```sh
  chezmoi init https://github.com/nqngo/dotfiles.git
  chezmoi apply
  ```

## License

This project is licensed under the MIT License. See the [LICENSE](./LICENSE) file for details.

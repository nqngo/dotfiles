# Dotfiles Repository

This repository contains my configuration files and templates for setting up a development environment using [chezmoi](https://www.chezmoi.io/). Feel free to use it as a reference or as a starting point for your own dotfiles repository.

## Setup

1. **Install chezmoi**:
  ```sh
  sh -c "$(curl -fsLS get.chezmoi.io/lb)"
  ```

2. **Apply the configuration**:
  ```sh
  chezmoi init nqngo
  chezmoi apply
  ```

## License

This project is licensed under the MIT License. See the [LICENSE](./LICENSE) file for details.

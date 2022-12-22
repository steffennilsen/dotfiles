# Dotfiles

* Any files and shallow depth directories in `home` gets symlinked to `$HOME`
  * Will **DELETE** any existing files
* Two phases of installation, `light` and `heavy` in a sense of how much is downloaded
  * `light` is intended for github codespaces for fast startup and relying on image containing tools
  * `heavy` is intended for a unified dev env and must be installed with a seperate script

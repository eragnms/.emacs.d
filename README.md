# Installation

## Clone this Emacs config

Assuming emacs is installed, do:

```console
cd
mv .emacs .emacs_bkp
mv .emacs.d .emacs.d_bkp
git clone https://github.com/eragnms/.emacs.d
```

## C++ mode

- In the root of your project create a file .dir-local.el
- Install GNU globals
- Install clang (On Arch Linux: # pacman -S clang)
- In the root of your project run:

```console
gtags
```

## Spell checking

```console
sudo pacman -S aspell aspell-en
```
## Copilot

Add the files gptel.el and emacs_command_generator.el to the folder
custom. Make sure they are ignored by git (they should already be in
.gitignore). Then do:

```console
sudo pacman -S nodejs npm
sudo npm install -g @github/copilot-language-server
cd projects
git clone https://github.com/zerolfx/copilot.el
```

Then in Emacs do:

```console
M-x copilot-install-server
M-x copilot-login
```

Then check the status by M-x copilot-diagnose (NotAuthorized means you don't
have a valid subscription).

## LSP

Install the below packages:

```console
sudo pacman -S clang
sudo pacman -S python-lsp-server
```

## TODO

# setup-files
Maintain setup files across work environments.

# Software
* [git](https://git-scm.com/)
* [vim](http://www.vim.org/)
* [AutoHotKey](https://autohotkey.com/)

# Setup
Follow these steps to set up a work environment.

## git

#### Credentials
Store GitHub credentials in the home directory.

```
git config --global credential.helper store
```

#### tmux
Windowed terminal

1. Install msys2 from https://www.msys2.org/.
2. In msys2 install tmux: `pacman -S tmux`
3. Navigate to msys2 folder: C:\msys64/usr/bin.
4. Copy these files to C:\Program Files\Git\usr\bin:
  - msys-event-\_-\_-\_.dll
  - msys-event\_core-\_-\_-\_.dll
  - tmux.exe

## vim

#### Define settings.
Establish vim settings by creating a symlink in `C:/Users/$USERNAME` to the \_vimrc file in this repo and initializing all plugins.

```
cd ~
git clone http://github.com/samussiah/setup-files.git ~/vimfiles
ln -s ~/vimfiles/_vimrc ~/_vimrc
cd ~/vimfiles
```

Then in vim run `:PlugInstall`.

#### Update environment variable PATH with location of gvim.exe.

1. \> Control Panel
2. \> System
3. \> Advanced System Settings
4. \> Environment Variables
5. Under User Variables \> Path
6. \> Edit
7. \> New
8. \> Browse
9. Browse to folder that contains executable.

#### Editing the \_vimrc
1. Open `~/_vimrc` or in vim type `,ev`.
2. Edit the file.
3. Copy the file into `~/vimfiles`.
4. In `~/vimfiles` run these commands from the command line:
  1. `git add -A`
  2. `git commit -a -m 'description of the update'`
  3. `git push`

#### Plugins

* adding
  1. Open ~/\_vimrc.
  2. Add a line under the _" declare plugins_ comment like so: `Plug 'user/repo`.
  3. Save the updated \_vimrc file.
  4. Reload the updated \_vimrc file or restart vim.
  5. In vim run `:PlugInstall`.
* updating
  1. In vim run `:PlugUpdate`.
* removing
  1. Open ~/\_vimrc.
  2. Remove the line of the plugin to be removed.
  3. Reload the updated \_vimrc file or restart vim.
  4. In vim run `:PlugClean`.

## local server
Start up a local local server.

1. Install http-sever: `npm i -G http-server`.
2. In top-level development folder, create package.json: `touch package.json`.
3. Add command to package.json: `echo '{ "scripts": { "local": "http-server ." } }' > package.json`.
4. Start local server: `npm run local`.

## AutoHotKey
Add a batch file that starts AutoHotKey, a keyboard macro program, to the Windows desktop.

```
cd C:/Users/$USERNAME/vimfiles
cp autoHotKey.bat ../Desktop
```

* Run AutoHotKey initially by double clicking the batch file on the Windows desktop.
* Edit AutoHotKey: CTRL + ALT + [
* Run AutoHotKey after editing: CTRL + ALT + ]

**Be sure to commit and push changes to setup files.**

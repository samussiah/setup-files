# setup-files
Maintain setup files across work environments.

# software
* [git](https://git-scm.com/)
* [vim](http://www.vim.org/)
* [development server](http://www.easyphp.org/)
* [AutoHotKey](https://autohotkey.com/)

# setup
Follow these steps to set up a work environment.

## git
Store GitHub credentials in the home directory.

```
git config --global credential.helper store
```

## vim
Establish vim settings by creating a symlink in `C:/Users/$USERNAME` to the \_vimrc file in this repo and initializing all plugins.

```
C:
cd Users/$USERNAME
git clone http://github.com/samussiah/setup-files.git C:/Users/$USERNAME/vimfiles
ln -s C:/Users/$USERNAME/vimfiles/_vimrc C:/Users/$USERNAME/_vimrc
cd C:/Users/$USERNAME/vimfiles
```

Then in vim run `:PlugInstall`.

### editing the \_vimrc
1. Open `C:/Users/$USERNAME/_vimrc` or in vim type `,ev`.
2. Edit the file.
3. Copy the file into `C:/Users/$USERNAME/vimfiles`.
4. In `C:/Users/$USERNAME/vimfiles` run these commands from the command line:
  1. `git add -A`
  2. `git commit -a -m 'description of the update'`
  3. `git push`

### plugins

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

## development server
Start up a local development server.

1. http://127.0.0.1:1111/
2. Under _WORKING DIRECTORIES_ click _+ add directory_.
3. Set _Working directory name_ to an appropriate name, e.g. _GitHub_ for GitHub projects.
4. Set _Path to the working directory_ to `C:/Users/$USERNAME/<directory name>`.
5. Click _save_.
6. Development server will be accessible at `127.0.0.1/edsa-<directory name>`.

## AutoHotKey
Add a batch file that starts AutoHotKey, a keyboard macro program, to the Windows desktop.

```
cd C:/Users/$USERNAME/vimfiles
cp autoHotKey.bat ../Desktop
```

* Run AutoHotKey initially by double clicking the batch file on the Windows desktop.
* Edit AutoHotKey: CTRL + ALT + [
* Run AutoHotKey after editing: CTRL + ALT + ]

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
git submodule init
git submodule update
```

### add plugin
Add additional plugins from GitHub.

```
git submodule add http://github.com/<repo> bundle/<repo>
git add .
git commit -m "Install <repo> bundle as a submodule."
```

### update all plugins
Update plugins by pulling the latest version from GitHub.

```
git submodule init
git submodule update
git submodule foreach git pull origin master
```

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

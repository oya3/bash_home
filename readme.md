# 設置方法

## C:\bash_home に本環境一式を設置する

## chocolatey で必要なツールをインストール
管理者権限でcmd起動
```rb
# chocolatey インストール
$ @powershell -NoProfile -ExecutionPolicy Bypass -Command "iex ((new-object net.webclient).DownloadString('https://chocolatey.org/install.ps1'))" && SET PATH=%PATH%;%ALLUSERSPROFILE%\chocolatey\bin
# chocolatey を使用して、packages.config の内容に従いツールをインストールする。
# 必須ツール
# * conemu, git, tortosegit
$ cd c:\bash_home\tools
$ choco install packages.config
```

## 環境変数を登録  
管理者権限で set_environment_variables.bat を実行する。
> $ c:\bash_home\set_environment_variables.bat

実行される内容は以下の通り。
> $ setx /M ALTERNATE_EDITOR "C:\bash_home\tools\emacs\bin\runemacs.exe"  
> $ setx /M EMACS_SERVER_FILE "C:\bash_home\.emacs.d\server\main_server"  
> $ setx /M HOME "C:\bash_home"  

## proxy 設定が必要な場合
基本的にwindows ネットワーク設定で問題ないはず。
以下の設定は参考例。必要に応じて設定すること。

### windows system 全体に proxy 例外を設定する方法
管理者権限でcmdを起動を以下を実施
> $ setx /M NO_PROXY "192.168.10.13"

### bash_profile に proxy 例外を設定する方法
```rb
$ emacs C:\bash_home\.bash_profile
...
# proxy 例外  
export no_proxy=192.168.10.13
export NO_PROXY=192.168.10.13
```

### emacs proxy 設定
```rb
$ emacs C:\bash_home\.emacs.d\init.el
...
(setq url-proxy-services '(("http" . "192.168.1.200:8080")))
```

## .gitconfig を編集
user.name, user.email を変更する
C:\Program Files (x86)\Git\Git Bash.vbs 起動
```rb
$ cd ~
$ git config --global user.name "名前"
$ git config --global user.email "メール"
```

## conemu を設定
conemu起動後、setting プロパティを表示し以下の設定を行う。

### tasks 設定
Startup/Tasks から以下の必要なものを設定する

- git bash 1.9.5 の場合(git_bash)
  task parameters: /icon "C:\Program Files (x86)\Git\etc\git.ico"
  commands: "C:\Program Files (x86)\Git\bin\sh.exe" --login -i -cur_console:d:C:\bash_home
- vc2008 の場合(Shells::vc2008)
  commands: %comspec% /k "C:\Program Files (x86)\Microsoft Visual Studio 9.0\VC\vcvarsall.bat" x86
- commandline の場合(Shells::command)
commands: %windir%\system32\cmd.exe

### 半透明設定
Features/Transparency の Active window transparency をチェックしスライダーを自分好みに変更する

### テーマ設定  
Features/Colors の Schemes を自分好みに変更する(xtermがおすすめ)

### 不用なショートカットを削除
Key & Macro の Ctrl + @ (Minimize / Resotre(Quake-style hotkey also)) を None に変更する。

### 起動時コンソールを設定
Startup の Specified named task を git_bash

# git動作変更
- commit ログ記載ツールが vim から emacs(clinet) に変更。※runemacsサーバが起動していなければいけない。
- commit ログ入力完了後は、C-c C-c で完了、C-c C-k でキャンセル

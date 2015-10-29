[toc]

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

```rb
# 管理者権限で set_environment_variables.bat を実行する。
$ c:\bash_home\set_environment_variables.bat
# setx /M ALTERNATE_EDITOR "C:\bash_home\tools\emacs\bin\runemacs.exe"
# setx /M EMACS_SERVER_FILE "C:\bash_home\.emacs.d\server\main_server"
# setx /M HOME "C:\bash_home"
```

## proxy 設定が必要な場合

```rb
# 基本的にはwindows ネットワーク設定で問題ないはず。
# つながらない場合には以下を参考に設定すること。
$ emacs C:\bash_home\.bash_profile
...
# proxy例外
export no_proxy=192.168.10.13
export NO_PROXY=192.168.10.13
$ emacs C:\bash_home\.emacs.d\init.el
...
;; proxy が必要な場合に設定
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

TABエリアでマウス右ボタンで"setup tasks..."を選択  
- tasks 設定  
  Startup/Tasks から以下の必要なものを設定する
  - git bash 1.9.5 の場合(git_bash)  
    task parameters: /icon "C:\Program Files (x86)\Git\etc\git.ico"  
    commands: "C:\Program Files (x86)\Git\bin\sh.exe" --login -i -cur_console:d:C:\bash_home  
  - vc2008 の場合(Shells::vc2008)  
    commands: %comspec% /k "C:\Program Files (x86)\Microsoft Visual Studio 9.0\VC\vcvarsall.bat" x86  
  - commandline の場合(Shells::command)  
    commands: %windir%\system32\cmd.exe  
- 半透明設定  
  Features/Transparency の Active window transparency をチェックしスライダーを自分好みに変更する  
- テーマ設定  
  Features/Colors の Schemes を自分好みに変更する(xtermがおすすめ)  
- 不用なショートカットを削除  
  Key & Macro の Ctrl + @ (Minimize / Resotre(Quake-style hotkey also)) を None に変更する。  
- 起動時コンソールを設定  
  Startup の Specified named task を git_bash  

## 作業エリアを作成する

```rb
# このwork,wwwがプロジェクト開発環境となる(.gitignoreに登録済み)
$ mkdir c:\bash_home\work
$ mkdir c:\bash_home\www
```

## runemacs をスタートアップに登録(任意)

bash から emacs コマンドで起動した場合は、サーバとクライアントが自動判別される。  
しかし gui ではダメっぽいのでサーバ起動が必須となる。  

# git動作変更

* commit ログ記載ツールが vim から emacs(clinet) に変更。※runemacsサーバが起動していなければいけない。
* commit ログ入力完了後は、C-c C-c で完了、C-c C-k でキャンセル


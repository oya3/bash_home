
(1) インストールの操作

 (a) xyzzy\glo577wb\bin の各exe をパスの通ったところに保存する。（か、パスを通す）

 (b).xyzzy に以下を追加

;;; Emacs Lisp 移植キット
(require "elisp")   ← この下あたりに gtags-mode を記載したらいい感じのはず。

;#-----------------------------------------------------
;; gtags-mode
(autoload 'gtags-mode "gtags/gtags" t)
;(require "gtags/gtags-menu")
(setq *gtags-mode-hook*
	  #'(lambda ()
		  (local-set-key #\M-t 'gtags-find-tag)
		  (local-set-key #\M-r 'gtags-find-rtag)
		  (local-set-key #\M-s 'gtags-find-symbol)
		  (local-set-key #\C-t 'gtags-pop-stack)
		  ;(local-set-key #\M-j 'gtags-find-with-grep)
		  ))

(add-hook 'ed::*c-mode-hook*
		  #'(lambda ()
			  (gtags-mode 1)
			  ;(gtags-make-complete-list)
			  ))

(add-hook '*c++-mode-hook*
          #'(lambda ()
              (gtags-mode 1)))

(2) キー操作 
  M-t : タグジャンプ
  M-r : 参照元タグジャンプ
  M-s : 定義ジャンプ
  C-t : 元に戻る

(3) タグを作る
 コマンドラインから
 $gtags -v 
 を実施か
 xyzzy から
 C + x &
 & gtags -v
 更新したファイルだけを反映させたい場合は、
  global -u
 らしい。


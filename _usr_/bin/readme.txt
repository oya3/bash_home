
(1) �C���X�g�[���̑���

 (a) xyzzy\glo577wb\bin �̊eexe ���p�X�̒ʂ����Ƃ���ɕۑ�����B�i���A�p�X��ʂ��j

 (b).xyzzy �Ɉȉ���ǉ�

;;; Emacs Lisp �ڐA�L�b�g
(require "elisp")   �� ���̉�������� gtags-mode ���L�ڂ����炢�������̂͂��B

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

(2) �L�[���� 
  M-t : �^�O�W�����v
  M-r : �Q�ƌ��^�O�W�����v
  M-s : ��`�W�����v
  C-t : ���ɖ߂�

(3) �^�O�����
 �R�}���h���C������
 $gtags -v 
 �����{��
 xyzzy ����
 C + x &
 & gtags -v
 �X�V�����t�@�C�������𔽉f���������ꍇ�́A
  global -u
 �炵���B


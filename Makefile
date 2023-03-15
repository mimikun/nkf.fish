today   = $(shell date "+%Y%m%d")
product_name = nkf-fish

.PHONY : patch
patch : clean diff-patch patch-copy2win

.PHONY : diff-patch
diff-patch :
	git diff origin/master > $(product_name).$(today).patch

.PHONY : patch-branch
patch-branch :
	git switch -c patch-$(today)

.PHONY : switch-master
switch-master :
	git switch master

.PHONY : delete-branch
delete-branch : switch-master
	git branch --list "patch*" | xargs -n 1 git branch -D

.PHONY : patch-copy2win
patch-copy2win :
	cp *.patch $$WIN_HOME/Downloads/

.PHONY : clean
clean :
	rm *.zip
	rm *.patch

EMACS ?= emacs
CASK  ?= cask
MAKE  ?= make

.PHONY: clean compile

clean:
	${CASK} clean-elc

compile:
	${CASK} exec ${EMACS} -Q -batch -L . -eval \
	"(progn \
	   (when (version<= \"24.3\" emacs-version) \
	     (setq byte-compile-error-on-warn t)) \
	   (batch-byte-compile))" el-init-viewer.el

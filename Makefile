OUT_DIR=pdf
IN_DIR=cv_md
TEX_DIR=_tex
STYLE=cv-template

all: pdf 

pdf: tex-sect
	xelatex -halt-on-error -output-directory $(OUT_DIR) \
	         --jobname=cv \
	          $(TEX_DIR)/template.tex

pdflatex: tex-sect
	pdflatex -halt-on-error -output-directory $(OUT_DIR) \
	         --jobname=cv \
	          $(TEX_DIR)/template-pdflatex.tex

tex-sect: init
	for f in $(IN_DIR)/*.md; do \
		FILE_NAME=`basename $$f | sed 's/.md//g'`; \
		echo $$FILE_NAME.md; \
		pandoc --latex-engine=xelatex -o $(TEX_DIR)/$$FILE_NAME.tex $$f > /dev/null; \
	done

init: dir 

dir:
	mkdir -p $(OUT_DIR)

version:
	PANDOC_VERSION=`pandoc --version | head -1 | cut -d' ' -f2 | cut -d'.' -f1`; \
	if [ $$PANDOC_VERSION -eq 2 ]; then \
		SMART=-smart; \
	else \
		SMART=--smart; \
	fi \

clean:
	rm -f $(OUT_DIR)/*


.PHONY : clean deploy

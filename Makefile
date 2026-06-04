SOURCE = main.tex references.bib Makefile

main.pdf: $(SOURCE)
	latexmk -pdf main.tex

watch:
	latexmk -pdf -pvc main.tex

clean:
	rm -f *.aux *.log *.out *.bbl *.blg *.fls *.fdb_latexmk \
	      *.synctex.gz *.run.xml *-blx.bib main.pdf

.PHONY: watch clean

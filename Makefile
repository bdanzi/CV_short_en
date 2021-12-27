tex: cv_danzi_brunella_ext cv_danzi_brunella publist_biobib PersonalStatement2021

cv_danzi_brunella:
	pdflatex -interaction=nonstopmode -synctex=-1 cv_danzi_brunella
	biber cv_danzi_brunella
	pdflatex -interaction=nonstopmode -synctex=-1 cv_danzi_brunella
	pdflatex -interaction=nonstopmode -synctex=-1 cv_danzi_brunella
	pdflatex -interaction=nonstopmode -synctex=-1 cv_danzi_brunella

cv_danzi_brunella_ext:
	sed -e 's/extfalse/exttrue/g' cv_danzi_brunella.tex > cv_danzi_brunella_ext.tex
	pdflatex -interaction=nonstopmode -synctex=-1 cv_danzi_brunella_ext
	biber cv_danzi_brunella_ext
	pdflatex -interaction=nonstopmode -synctex=-1 cv_danzi_brunella_ext
	pdflatex -interaction=nonstopmode -synctex=-1 cv_danzi_brunella_ext
	pdflatex -interaction=nonstopmode -synctex=-1 cv_danzi_brunella_ext
	rm cv_danzi_brunella_ext.tex

publist_biobib:
	pdflatex -interaction=nonstopmode -synctex=-1 publist_biobib
	biber publist_biobib
	pdflatex -interaction=nonstopmode -synctex=-1 publist_biobib
	pdflatex -interaction=nonstopmode -synctex=-1 publist_biobib
	pdflatex -interaction=nonstopmode -synctex=-1 publist_biobib

PersonalStatement2021:
	pdflatex -interaction=nonstopmode -synctex=-1 PersonalStatement2021
	biber PersonalStatement2021
	pdflatex -interaction=nonstopmode -synctex=-1 PersonalStatement2021
	pdflatex -interaction=nonstopmode -synctex=-1 PersonalStatement2021
	pdflatex -interaction=nonstopmode -synctex=-1 PersonalStatement2021

VerbiageChair2021:
		pdflatex -interaction=nonstopmode -synctex=-1 VerbiageChair2021

clip:
	cpdf -i PersonalStatement2021.pdf -o PersonalStatement2021.pdf

lint:
	grep -E --color=always -r -i --include=\*.tex --include=\*.bib "(\b[a-zA-Z]+) \1\b" || true

clean:
	rm -f *.aux *.bbl *.blg *.dvi *.idx *.lof *.log *.lot *.toc \
	*.xdy *.nav *.out *.snm *.vrb *.mp \
	*.synctex.gz *.brf *.fls *.fdb_latexmk \
	*.glg *.gls *.glo *.ist *.alg *.acr *.acn *.bcf *.xml
	find . -type f -name '*.aux' -delete

realclean: clean
	rm -f cv_danzi_brunella*.ps cv_danzi_brunella*.pdf publist_biobib*.ps publist_biobib*.pdf PersonalStatement2021*.ps PersonalStatement2021*.pdf

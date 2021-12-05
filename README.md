# CV

CV for Brunella D'Anzi

[![GitHub Actions Status: CI](https://github.com/bdanzi/CV/workflows/Deploy%20build/badge.svg)](https://github.com/bdanzi/CV/actions?query=workflow%3A"Deploy+build"+branch%3Amaster)
[![GitHub view](https://img.shields.io/badge/GitHub-render-green.svg)](https://github.com/bdanzi/CV/blob/gh-pages/cv_duarte_javier.pdf)
[![download](https://img.shields.io/badge/Download-build-blue.svg)](https://github.com/bdanzi/CV/raw/gh-pages/cv_duarte_javier.pdf)
[![download](https://img.shields.io/badge/Download-build-blue.svg)](https://github.com/bdanzi/CV/raw/gh-pages/publist_biobib.pdf)

## Instructions

Download BibTeX file from INSPIRE named `INSPIRE-CiteAll.bib`.
If there are additional entries put them in a file called `NOT_ON_INSPIRE.bib`.
To add month information plus some general formatting:
```
python parse_bib_from_inspire.py
```

Manually edit and create 4 BibTeX files: `bib_other.bib`, `bib_proceedings.bib`, `bib_publications.bib`, `bib_refproceedings.bib`, `bib_workinprogress.bib`.
Compile `publist_biobib.tex`:
```
make publist_biobib
```

Download pdfs and stamp them (based on `bib_publications.bib` and `publist_biobib.aux`:
```
python download_stamp_pdfs.py
```




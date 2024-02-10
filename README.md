# CV

CV for Brunella D'Anzi

[![GitHub Actions Status: CI](https://github.com/bdanzi/CV_short_en/workflows/Deploy%20build/badge.svg)](https://github.com/bdanzi/CV_short_en/actions?query=workflow%3A"Deploy+build"+branch%3Amaster)
[![GitHub view](https://img.shields.io/static/v1?label=Download&message=Preview&color=yellow)](https://github.com/bdanzi/CV_short_en/blob/gh-pages/cv_danzi_brunella.pdf)
[![download](https://img.shields.io/static/v1?label=Download&message=CV_short_en&color=blue)](https://github.com/bdanzi/CV_short_en/raw/gh-pages/cv_danzi_brunella.pdf)
[![download](https://img.shields.io/static/v1?label=Download&message=publist&color=red)](https://github.com/bdanzi/CV_short_en/raw/gh-pages/publist_biobib.pdf)
[![download](https://img.shields.io/static/v1?label=Download&message=PersonalStatement&color=violet)](https://github.com/bdanzi/CV_short_en/raw/gh-pages/PersonalStatement2021.pdf)
[![download](https://img.shields.io/static/v1?label=Download&message=CV_ext&color=orange)](https://github.com/bdanzi/CV_short_en/raw/gh-pages/cv_danzi_brunella_ext.pdf)

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




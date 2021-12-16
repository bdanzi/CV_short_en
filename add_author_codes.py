import bibtexparser
import os
from crossref.restful import Works
import requests
import tqdm
import copy

# author codes:
# https://docs.google.com/spreadsheets/d/1JEj7V-RBv4JBM_ApefYaV5nyz52qea8EabgtSa3vECA/edit#gid=0
#1	Conceptualization
#2	Data curation
#3	Formal Analysis
#4	Funding Acquisition
#5	Investigation
#6	Methodology
#7	Project Administration
#8	Resources
#9	Software
#10	Supervision
#11	Validation
#12	Visualization
#13	Writing-Original Draft
#14	Writing-Reviewing and Editing
#15	Other
author_codes = {
                }
with open('bib_publications.bib') as bibtex_file:
    bib_database = bibtexparser.load(bibtex_file)

# loop over main database entries
t = tqdm.tqdm(bib_database.entries, total=len(bib_database.entries))
for l in t:
    t.set_description('Processing key {}'.format(l['ID']))
    t.refresh() # to show immediately the update

    is_recent = (int(l['year']) >= 2020) or (int(l['year']) == 2019 and 'month' in l and int(l['month']) >= 7)
    if not is_recent:
        continue

    if l['ID'] in author_codes:
        codes = [str(c) for c in author_codes[l['ID']]]
    elif 'collaboration' in l and 'CMS' in l['collaboration'] or ('usera' in l and 'CMS' in l['usera']):
        codes = [str(c) for c in author_codes['CMS']]

    l['contributioncodes'] = ', '.join(codes)

    if 'note' in l and 'Author Contribution Code(s)' in l['note']:
        if 'Accepted by' in l['note'] or 'Erratum' in l['note']:
            # remove author contribution codes from note
            former_note = l['note'].split('\\textbf{Author Contribution Code(s)}')[0]
            l['note'] = former_note
        else:
            # just remove note
            del l['note']

# export 3 bib files (publications, proceedings, other)
with open('bib_publications.bib', 'w') as bibtex_file:
    bibtexparser.dump(bib_database, bibtex_file)

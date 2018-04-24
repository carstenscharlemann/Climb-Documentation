rm mdpdf/*.*
echo Building PDFs...
cd md
pandoc --latex-engine=xelatex *.md --output ../mdpdf/test1.pdf


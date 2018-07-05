rm mdpdf/*.*
echo Building PDFs...
cd md
pandoc --latex-engine=xelatex *.md --output ../mdpdf/test1.pdf
cd ..
#pandoc --latex-engine=xelatex md/CLI_ADD_RKS_001/*.md -f markdown_github --output mdpdf/CLI_ADD_RKS_001.pdf
pandoc -s -r html https://github.com/carstenscharlemann/Climb-Documentation/blob/master/md/CLI_ADD_RKS_001/overview.md --latex-engine=xelatex -o mdpdf/test2.pdf


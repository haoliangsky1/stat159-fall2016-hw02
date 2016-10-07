# Declare a phone target
.PHONY: all clean

# Variables
out = data/Advertising.csv data/eda-output.txt images/*.png images/*.pdf data/regression.rData report/report.pdf report/report.html


all: $(out)

# The markdown pdf files compiled from rMarkdown:
report/report.pdf:
	Rscript -e 'library(rmarkdown); render("report/report.Rmd")'

report/report.html:
	Rscript -e 'library(rmarkdown); render("report/report.Rmd")'

# The regression object and images
data/regression.rData:
	Rscript code/regression-script.R data/Advertising.csv

images/*.pdf:
	Rscript code/regression-script.R data/Advertising.csv

images/*.png:
	Rscript code/regression-script.R data/Advertising.csv


# The summary statistics file and images
data/eda-output.txt:
	Rscript code/eda-script.R data/Advertising.csv

images/*.pdf:
	Rscript code/eda-script.R data/Advertising.csv

images/*.png:
	Rscript code/eda-script.R data/Advertising.csv

# The raw data file
data/Advertising.csv:
	curl -O http://www-bcf.usc.edu/~gareth/ISL/Advertising.csv 
	mv Advertising.csv data/Advertising.csv


# Create phony clean commands
clean:
	# rm -f data/Advertising.csv
	# rm -f data/eda-output.txt
	# rm -f data/regression.rData
	# rm -f images/*.png
	# rm -f images/*.pdf
	rm -f report/report.pdf
	rm -f report/report.html


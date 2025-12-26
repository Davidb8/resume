# Resume Makefile
# Builds resume.pdf from resume.tex

.PHONY: all clean watch

# Default target
all: resume.pdf

# Build PDF
resume.pdf: resume.tex
	pdflatex -interaction=nonstopmode resume.tex
	pdflatex -interaction=nonstopmode resume.tex
	@echo "Resume built successfully: resume.pdf"

# Clean auxiliary files
clean:
	rm -f *.aux *.log *.out *.fls *.fdb_latexmk *.synctex.gz

# Clean everything including PDF
cleanall: clean
	rm -f resume.pdf

# Watch for changes and rebuild (requires fswatch on macOS)
watch:
	fswatch -o resume.tex | xargs -n1 -I{} make all

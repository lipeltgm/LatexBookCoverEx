all: cover.jpg bc0.pdf bc1.pdf bc2.pdf

%.pdf: %.tex spineWidth.tex
	${SH} pdflatex -interaction=nonstopmode $< || true
	${SH} pdflatex $<
	${SH} open $@

cover.jpg: images/image01.jpg
#	${SH} convert -size 800x600 xc:tan $@
	${SH} convert $^ -crop 640x1024+160+0 $@

spineWidth.tex:
	${SH} echo "\def\TheSpineWidth{0.5in}" > $@



clean:
	${RM} *.aux  *.log  *.pdf  
	${RM} cover.jpg
	${RM} spineWidth.tex


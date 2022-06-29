# Compress a PDF on Linux

To compress or make a PDF file smaller on linux we can simply use `postscript`.
The following command should give you a reasonable sized `PDF`.

```
gs -sDEVICE=pdfwrite -dCompatibilityLevel=1.4 -dPDFSETTINGS=/prepress -dNOPAUSE -dQUIET -dBATCH -sOutputFile=compressed_PDF_file.pdf input_PDF_file.pdf
```

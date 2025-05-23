% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/pdf_crop.R
\name{pdf_crop}
\alias{pdf_crop}
\title{Remove whitespace margins from a PDF file (and maybe embed fonts)}
\usage{
pdf_crop(
  filename,
  mustWork = FALSE,
  pdfcrop = Sys.which("pdfcrop"),
  embed_fonts = FALSE
)
}
\arguments{
\item{filename}{(\code{character(1)})\cr Filename of a PDF file to crop. The file will be overwritten.}

\item{mustWork}{(\code{logical1})\cr If \code{TRUE}, then give an error if the file cannot be cropped.}

\item{pdfcrop}{(\code{character(1)})\cr Path to the \code{pdfcrop} utility.}

\item{embed_fonts}{(\code{logical(1)})\cr If \code{TRUE}, use \code{\link[grDevices:embedFonts]{grDevices::embedFonts()}} to embed fonts.}
}
\value{
No return value, called for side effects
}
\description{
Remove whitespace margins using \url{https://ctan.org/pkg/pdfcrop} and
optionally embed fonts using \code{\link[grDevices:embedFonts]{grDevices::embedFonts()}}. You may install
\code{pdfcrop} using TinyTeX (\url{https://cran.r-project.org/package=tinytex}) with
\code{tinytex::tlmgr_install('pdfcrop')}.
}
\details{
You may also wish to consider \code{\link[extrafont:embed_fonts]{extrafont::embed_fonts()}}
(\url{https://cran.r-project.org/package=extrafont}).

\if{html}{\out{<div class="sourceCode">}}\preformatted{library(extrafont)
# If you need to specify the path to Ghostscript (probably not needed in Linux)
Sys.setenv(R_GSCMD = "C:/Program Files/gs/gs9.56.1/bin/gswin64c.exe")
embed_fonts("original.pdf", outfile = "new.pdf")
}\if{html}{\out{</div>}}

As an alternative, saving the PDF with \code{\link[grDevices:cairo]{grDevices::cairo_pdf()}} should
already embed the fonts.
}
\examples{
extdata_path <- system.file(package = "moocore", "extdata")
A1 <- read_datasets(file.path(extdata_path, "wrots_l100w10_dat"))
A2 <- read_datasets(file.path(extdata_path, "wrots_l10w100_dat"))
filename <- tempfile("eafplot", fileext=".pdf")
pdf(file = filename, onefile = TRUE, width = 5, height = 4)
eafplot(list(A1 = A1, A2 = A2), percentiles = 50, sci.notation = TRUE)
dev.off()
try(pdf_crop(filename)) # This may fail if pdfcrop is not installed.

}
\seealso{
\code{\link[grDevices:embedFonts]{grDevices::embedFonts()}} \code{\link[extrafont:embed_fonts]{extrafont::embed_fonts()}} \code{\link[grDevices:cairo]{grDevices::cairo_pdf()}}
}

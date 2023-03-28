setwd("~/Dropbox/hsf/23-ss/ds")

file.copy(from = "/home/sthu/Dropbox/LIT/LIT_full.bib",
          to = "/home/sthu/Dropbox/hsf/23-ss/ds/book.bib",
          overwrite = TRUE)

dir_path <- "/home/sthu/Dropbox/hsf/23-ss/ds/"
prefix <- "_main"

# Get list of files that start with prefix
files_to_delete <- list.files(dir_path, pattern = paste0("^", prefix), full.names = TRUE)

if (length(files_to_delete) > 0) {
  # Loop through the files and delete them
  for (file in files_to_delete) {
    unlink(file)
  }
}

bookdown::render_book("index.Rmd", "bookdown::gitbook")
bookdown::render_book("index.Rmd", "bookdown::pdf_book")


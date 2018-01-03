" epub files are zip files
autocmd BufReadCmd *.epub call zip#Browse(expand("<amatch>"))

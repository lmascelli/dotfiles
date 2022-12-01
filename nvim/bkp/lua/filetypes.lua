-- NASM FILETYPE --

-- set filetype = nasm for *.nasm files
vim.cmd 'au BufNewFile,BufRead *.nasm   setf nasm'

-- insert a comment block
-- ;----------------------------------
-- ; COMMENT
-- ;----------------------------------
-- with @D macro
local comment_section_macro = 'i;35a-o;\n;35a-ka '
vim.fn.setreg('D', comment_section_macro)

-- insert a comment at column 37 with @C macro
local comment_line_macro = '0$36a 36|d$a;'
vim.fn.setreg('C', comment_line_macro)


-- GMSH FILETYPE --
vim.cmd 'au BufNewFile,BufRead *.geo   setf gmsh'

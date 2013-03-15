set grepprg=grep\ -nH\ $* "vim-latex post-install recommendation
let g:tex_flavor = "latex" "vim-latex post-install recommendation
"Enables writing of the „é“
imap <buffer> <leader>it <Plug>Tex_InsertItemOnThisLine
"Typing Alt-<key> takes focus to the menu bar if a menu with the hotkey <key>
"exists:
set winaltkeys=no
let g:Tex_Folding=1 "I like folding.
let g:tex_fold_enabled=1
setlocal foldmethod=syntax
"set iskeyword+=:   "learn how to put there fig, tab, eqn...

let g:Tex_DefaultTargetFormat='pdf'
let g:Tex_MultipleCompileFormats='pdf, aux'
let g:Tex_ViewRule_pdf = 'zathura'
"Recompile LaTeX document on save just with „:w“
"nnoremap <Leader>lw :up!<cr>:call RunLaTeX()<cr>

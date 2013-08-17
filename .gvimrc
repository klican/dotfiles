set guioptions-=T "m  "remove toolbar and menu list in gvim, r removes right-hand scroll bar
set guioptions-=r  "r removes right-hand scroll bar
set guioptions-=m  
set guioptions+=ac  
"set gfn=DejaVu\ Sans\ Mono\ Bold\ 10
set guifont=Envy\ Code\ R\ for\ Powerline\ 10
"colorscheme solarized

"Smooth scrolling
"If you like the scrolling to go a bit smoother, you can use these mappings:
":map <C-U> <C-Y><C-Y><C-Y><C-Y><C-Y><C-Y><C-Y><C-Y><C-Y><C-Y><C-Y><C-Y><C-Y><C-Y><C-Y><C-Y>
":map <C-D> <C-E><C-E><C-E><C-E><C-E><C-E><C-E><C-E><C-E><C-E><C-E><C-E><C-E><C-E><C-E><C-E>

set grepprg=grep\ -nH\ $* "vim-latex post-install recommendation
let g:tex_flavor = "latex" "vim-latex post-install recommendation
let g:TeX_Menus = 1
let g:Tex_MathMenus = 1
let g:Tex_NestElementMenus = 1
let g:Tex_NestElementMenu = 1
let g:Tex_PackagesMenu = 1 
let g:Tex_UseUtfMenus = 1

"au BufWritePost *.tex silent call Tex_CompileLatex() "compile once on :w

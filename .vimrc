runtime bundle/vim-pathogen/autoload/pathogen.vim
execute pathogen#infect()

syntax enable
set t_Co=256
if &t_Co < 256
    colorscheme miro8   " colourscheme for the 8 colour linux term
else
    colorscheme darkburn
endif
" Toggle background modes for solarized colorscheme
call togglebg#map("<Leader>bg")


"Getting root permissions on a file inside of Vim:
cmap w!! w !sudo tee >/dev/null %
set nocompatible   " Disable vi-compatibility
set laststatus=2   " Always show the statusline
filetype plugin on
filetype plugin indent on "Turn on file type detection
set nocompatible "turn off backward compatibility with the historic vi editor
set encoding=utf-8 " Necessary to show unicode glyphs
autocmd Filetype tex setlocal nofoldenable
set nobackup "Don't save previous copy of file as file~
set hidden "Handle multiple buffers better
set linebreak
set ruler "Show cursor position
set number "Show line numbers
set noshowmode
set relativenumber "Line numbers relative to cursor actual position
set ignorecase "Ignore case when searching
set smartcase  "but case-sensitive if expression contais a capital letter
set hlsearch "Highlight search things
set incsearch "Highlight searched string as it's typed
set backspace=indent,eol,start "bez tohto bs maže znaky iba z aktuálne napísaného textu
set scrolloff=2
" Get rid of annoying pause on terminal
set timeout timeoutlen=1500 ttimeoutlen=0
set wildmenu "Enhanced command line completion
"set wildmode=list:longest "Complete files like a shell
set mouse=a    "Enable the use of the mouse
" Easier micro-navigation in insert mode
imap <C-b> <Left>
imap <C-f> <Right>
" zobrazuje priebezne zadavany prikaz
" prinosne hl. pri viacznakovych prikazoch ako napr qg}
set showcmd
set textwidth=74

"doesn't need to type "* (like in "*p), when using clipboard
set clipboard=unnamed
" Automatically retab before saving, converts tabs to spaces.
au BufWritePre * :retab
set expandtab      " enter spaces when tab is pressed
set tabstop=4      " use 4 spaces to represent tab
set softtabstop=4
set shiftwidth =4  " The '>>' and '<<' command will indent by 4 spaces
set autoindent     " copy indent from current line when starting a new line

" Use ranger as vim file manager:
"When <leader>r is pressed, ranger is launched with RANGER_RETURN_FILE
"environment variable set to a temporary file name. After ranger quits, the
"selected filename is read from the temporary file, and vim opens it.
function! Ranger()
    " Get a temp file name without creating it
    let tmpfile = substitute(system('mktemp -u'), '\n', '', '')
    " Launch ranger, passing it the temp file name
    silent exec '!RANGER_RETURN_FILE='.tmpfile.' ranger'
    " If the temp file has been written by ranger
    if filereadable(tmpfile)
        " Get the selected file name from the temp file
        let filetoedit = system('cat '.tmpfile)
        exec 'edit '.filetoedit
        call delete(tmpfile)
    endif
    redraw!
endfunction
nmap <leader>r :call Ranger()<cr>

" Add the virtualenv's site-packages to vim path
py << EOF
import os.path
import sys
import vim
if 'VIRTUAL_ENV' in os.environ:
    project_base_dir = os.environ['VIRTUAL_ENV']
    sys.path.insert(0, project_base_dir)
    activate_this = os.path.join(project_base_dir, 'bin/activate_this.py')
    execfile(activate_this, dict(__file__=activate_this))
EOF


""""""""""""""""""""""""
" Plugin configuration "
""""""""""""""""""""""""

"vim-powerline
"set rtp+=~/.powerline/powerline/bindings/vim
let g:Powerline_symbols = 'fancy'

" vim-fugitive
nmap <Leader>gs :Gstatus<CR>
nmap <Leader>gd :Gdiff<CR>
nmap <Leader>gl :Glog<CR>
nmap <Leader>gb :Gblame<CR>
nmap <Leader>gc :Gcommit<CR>
nmap <Leader>gp :Git push<CR>

" UndoTree
map <leader>g :GundoToggle<CR>

" NerdTree"
map <leader>nt :NERDTreeToggle<CR>

"Tagbar
nmap <Leader>tg :TagbarToggle<CR>
let g:tagbar_sort = 0

" delimitMate
set <BS>=\<C-H>

" Ultisnips
let g:UltiSnipsExpandTrigger = '<c-j>'
let g:UltiSnipsJumpForwardTrigger = '<c-j>'
let g:UltiSnipsJumpBackwardTrigger = '<c-k>'
let g:UltiSnipsListSnippets = '<c-l>'

" YouCompleteMe
let g:ycm_add_preview_to_completeopt = 0
let g:ycm_autoclose_preview_window_after_completion = 0
let g:ycm_autoclose_preview_window_after_insertion = 1
let g:ycm_seed_identifiers_with_syntax = 1

" CtrlP.vim
let g:ctrlp_cmd = 'CtrlPBuffer'
let g:ctrlp_match_window_bottom = 1
let g:ctrlp_match_window_reversed = 0
let g:ctrlp_custom_ignore = '\v\~$|\.(o|swp|pyc|wav|mp3|ogg|blend)$|(^|[/\\])\.(hg|git|bzr)($|[/\\])|__init__\.py'
let g:ctrlp_working_path_mode = 0
let g:ctrlp_dotfiles = 0
let g:ctrlp_switch_buffer = 0

"initialize the repeat.vim
silent! call repeat#set("\<Plug>MyWonderfulMap", v:count)

" Syntastic
let g:syntastic_mode_map = {'active_filetypes': ['python'] }
let g:syntastic_python_checkers = ['flake8', 'pylint']
let syntastic_python_flake8_args = '--ignore=E501'
let g:syntastic_auto_jump = 1
let g:syntastic_always_populate_loc_list=1
let g:syntastic_auto_loc_list = 2
let g:syntastic_loc_list_height = 4
let g:syntastic_enable_highlighting = 1

" ListToggle
let g:lt_location_list_toggle_map = '<leader>se'
let g:lt_quickfix_list_toggle_map = '<leader>sf'
let g:lt_height = 4

" vim-python-pep8-indent
let g:pymode_indent = 0

" Vimux
" Height of vimux split pane
let g:VimuxHeight = "30"
" Run the current file in bpython2 shell
autocmd FileType python map <LocalLeader>ll :call VimuxRunCommand(" clear; bpython2 -i " . bufname("%"))<CR>
" Open python shell
autocmd FileType python map <LocalLeader>ls :call VimuxRunCommand(" clear; bpython2 -i ")<CR>
" If text is selected, save it in the v buffer and send that buffer it to tmux
autocmd FileType python vmap <LocalLeader>lv "vy :call VimuxRunCommand(@v . "\n", 0)<CR>
" Select current paragraph and send it to tmux
autocmd FileType python nmap <LocalLeader>lv vip<LocalLeader>vs<CR>
" Close vim tmux runner opened by VimuxRunCommand
autocmd FileType python map <LocalLeader>lc :VimuxCloseRunner<CR>

" Vim-R-plugin
let vimrplugin_screenplugin = 0
let vimrplugin_tmux = 1
let vimrplugin_notmuxconf = 1
"let vimrplugin_only_in_tmux = 1
let vimrplugin_term = "urxvtc"
let vimrplugin_routmorecolors = 1
   if $DISPLAY != "" "only if X are running
       let vimrplugin_openpdf = 1
   endif
let vimrplugin_openpdf_quietly = 1
set modifiable


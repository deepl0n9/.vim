"""""""""""""""""""""""""""""""""""""

"""""""""""""""""""""""""""""""""""""
" jika ingin agar .vimrx ada di folder.vim "sudo ln -s ~/dotfiles/.vimrc ~/.vimrc"
set nocompatible
set encoding=utf-8
let mapleader = ","

"""" START Vundle Configuration 

" Disable file type for vundle
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

" Utility
Plugin 'junegunn/goyo.vim'
Plugin 'jistr/vim-nerdtree-tabs'
Plugin 'ervandew/supertab'
Plugin 'SilVer/ultisnips'
Plugin 'benmills/vimux'
Plugin 'Shougo/neocomplete.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'terryma/vim-multiple-cursors'

" ncm2 completion


" Generic Programming Support 
Plugin 'ycm-core/YouCompleteMe'
Plugin 'boeckmann/vim-freepascal'
Plugin 'Townk/vim-autoclose'
Plugin 'tomtom/tcomment_vim'
Plugin 'vim-syntastic/syntastic'
Plugin 'neomake/neomake'

"git
Plugin 'tpope/vim-fugitive'
Plugin 'Xuyuanp/nerdtree-git-plugin'
"----------git-plugin-----
map <leader>g :Git  





" Theme / Interface


" Plugin 'tiagofumo/vim-nerdtree-syntax-highlight'

call vundle#end()            " required
filetype plugin indent on    " required
"""" END Vundle Configuration 
"""""""""""""""""""""""""""""""""""""
"tagbar
"g:tagbar_ctags_bin

" Configuration Section
"""""""""""""""""""""""""""""""""""""
"ctags

" OSX stupid backspace fix
set backspace=indent,eol,start
" map ",q" to quit not saving, ",w" quit with saving
map <leader>q :q!<CR>
map <leader>w :wq<CR>
" ",s" to save without quit "

""set ESC to jj
inoremap jj <ESC>
" map to switch window with ", and hjkl" instead of <C-w>
nnoremap <leader>m <C-w>

" Show linenumbers
set number
set nowrap
"no wrap text
" Set Proper Tabs
set tabstop=4
set shiftwidth=4
set smarttab
set title
set statusline+=%=%l:%c
set statusline=[%n]\ [%t]

set expandtab

" Always display the status line
set laststatus=2

" Enable Elite mode, No ARRRROWWS!!!!
let g:elite_mode=1
"no arrow setting



" Enable highlighting of the current line
set cursorline

" Theme and Styling 
syntax on
set t_Co=256
set background=light

" if (has("termguicolors"))
"   set termguicolors
" endif



"let base16colorspace=256  " Access colors present in 256 colorspace
colorscheme spacegray 
let g:spacegray_low_contrast = 1
 

" Syntastic Configuration
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

map <F8> :SyntasticCheck<CR>
nmap <F9> :lnext<CR>
nmap <F7> :lprev<CR>


let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_java_checkers = []
" let g:syntastic_check_on_wq = 0
" let g:syntastic_enable_elixir_checker = 1
" let g:syntastic_elixir_checkers = ["elixir"]

" YouCompleteMe setting
let g:ycm_python_interpreter_path = ''
let g:ycm_python_sys_path = []
let g:ycm_extra_conf_vim_data = [
  \  'g:ycm_python_interpreter_path',
  \  'g:ycm_python_sys_path'
  \]
let g:ycm_global_ycm_extra_conf = '~/global_extra_conf.py'

" Neomake settings
autocmd! BufWritePost * Neomake
let g:neomake_elixir_enabled_makers = ['mix', 'credo', 'dogma']

" Vim-PDV Configuration 
let g:pdv_template_dir = $HOME ."/.vim/bundle/pdv/templates_snip"

" Markdown Syntax Support
augroup markdown
    au!
    au BufNewFile,BufRead *.md,*.markdown setlocal filetype=ghmarkdown
augroup END


" Vim-Supertab Configuration
let g:SuperTabDefaultCompletionType = "<C-x><C-o>"

"ncm2
" Vim-UtilSnips Configuration
" Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
map <leader>u :UltiSnipsAddFiletypes 
map <leader>e :UltiSnipsEdit 

let g:UltiSnipsExpandTrigger="<C-j>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"
let g:UltiSnipsEditSplit="vertical" " If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsSnippetsDir = "~/.vim/bundle/ultisnips/Ultisnips"

" Vim-Test Configuration
let test#strategy = "vimux"

" Neocomplete Settings
let g:acp_enableAtStartup = 0
let g:neocomplete#enable_at_startup = 1
let g:neocomplete#enable_smart_case = 1
let g:neocomplete#sources#syntax#min_keyword_length = 3

" Define dictionary.
let g:neocomplete#sources#dictionary#dictionaries = {
    \ 'default' : '',
    \ 'vimshell' : $HOME.'/.vimshell_hist',
    \ 'scheme' : $HOME.'/.gosh_completions'
        \ }

" Define keyword.
if !exists('g:neocomplete#keyword_patterns')
    let g:neocomplete#keyword_patterns = {}
endif
let g:neocomplete#keyword_patterns['default'] = '\h\w*'

function! s:my_cr_function()
  return (pumvisible() ? "\<C-y>" : "" ) . "\<CR>"
  " For no inserting <CR> key.
  "return pumvisible() ? "\<C-y>" : "\<CR>"
endfunction

" Close popup by <Space>.
"inoremap <expr><Space> pumvisible() ? "\<C-y>" : "\<Space>"

" vim-mix-format
" let g:mix_format_on_save = 1

" AutoComplPop like behavior.
"let g:neocomplete#enable_auto_select = 1


" Enable omni completion.
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags

" Enable heavy omni completion.
if !exists('g:neocomplete#sources#omni#input_patterns')
  let g:neocomplete#sources#omni#input_patterns = {}
endif
let g:neocomplete#sources#omni#input_patterns.php = '[^. \t]->\h\w*\|\h\w*::'
"let g:neocomplete#sources#omni#input_patterns.c = '[^.[:digit:] *\t]\%(\.\|->\)'
"let g:neocomplete#sources#omni#input_patterns.cpp = '[^.[:digit:] *\t]\%(\.\|->\)\|\h\w*::'

" For perlomni.vim setting.
" https://github.com/c9s/perlomni.vim
let g:neocomplete#sources#omni#input_patterns.perl = '\h\w*->\h\w*\|\h\w*::'




"""""""""""""""""""""""""""""""""""""
" Mappings configurationn
"""""""""""""""""""""""""""""""""""""
map <C-i> :NERDTreeToggle<CR>
"map <C-m> :TagbarToggle<CR>

" NERDTree
let NERDTreeShowHidden = 1
let NERDTreeShowBookmarks = 1
let NERDTreeMinimalUI = 1
let NERDTreeeDirArrows = 1
" Omnicomplete Better Nav
"inoremap <expr> <c-j> ("\<C-n>")
"inoremap <expr> <c-k> ("\<C-p>")

" Neocomplete Plugin mappins
inoremap <expr><C-g>     neocomplete#undo_completion()
inoremap <expr><C-l>     neocomplete#complete_common_string()

" Recommended key-mappings.
" <CR>: close popup and save indent.
inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>

" <TAB>: completion.
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"

" <C-h>, <BS>: close popup and delete backword char.
inoremap <expr><C-h> neocomplete#smart_close_popup()."\<C-h>"
inoremap <expr><BS> neocomplete#smart_close_popup()."\<C-h>"


" Shortcuts
nnoremap <Leader>o :Files<CR> 
nnoremap <Leader>O :CtrlP<CR>
nnoremap <Leader>w :w<CR>


" Disable arrow movement, resize splits instead.
if get(g:, 'elite_mode')
	nnoremap <Up>    :resize +2<CR>
	nnoremap <Down>  :resize -2<CR>
	nnoremap <Left>  :vertical resize +2<CR>
	nnoremap <Right> :vertical resize -2<CR>
endif

"map <silent> <LocalLeader>ws :highlight clear ExtraWhitespace<CR>




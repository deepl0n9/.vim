"""""""""""""""""""""""""""""""""""""

"""""""""""""""""""""""""""""""""""""
" jika ingin agar .vimrx ada di folder.vim "sudo ln -s ~/dotfiles/.vimrc ~/.vimrc"
" lalu buat folder "git/dotfiles/ pindahkan .vim folder kesitu lalu symlink "
" "dengan cara 'sudo ln -s ~/git/dotfiles/.vim <spasi> ~/.vim' ""
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
"=========================
"
" * goyo default : ketik :Goyo
Plugin 'junegunn/goyo.vim'
Plugin 'tiagofumo/vim-nerdtree-syntax-highlight'
Plugin 'jistr/vim-nerdtree-tabs'
Plugin 'ervandew/supertab'
Plugin 'SilVer/ultisnips'
Plugin 'benmills/vimux'
Plugin 'Shougo/neocomplete.vim'
Plugin 'scrooloose/nerdtree'
" command nya " cs'(untuktambah karakter) cs(untukganti karakter)' "
" command delete ds
Plugin 'tpope/vim-surround'
" *  multiple cursors default : masuk visual mode, select teks -> C-n dan lompat kesama
" teks juga C-n, kembali C-p skip teks C-x
Plugin 'terryma/vim-multiple-cursors'



" ======== Generic Programming Support 
"=========================
Plugin 'ycm-core/YouCompleteMe'
Plugin 'boeckmann/vim-freepascal'
Plugin 'Townk/vim-autoclose'
" * tcomment default : pilih teks/code yg ingin di jadikan komen (vice versa)
" lalu ketik :gc
Plugin 'tomtom/tcomment_vim'
Plugin 'vim-syntastic/syntastic'
Plugin 'neomake/neomake'

"======== git plugin
"=========================

Plugin 'tpope/vim-fugitive'
Plugin 'Xuyuanp/nerdtree-git-plugin'
Plugin 'airblade/vim-gitgutter'
Plugin 'jiangmiao/auto-pairs'






call vundle#end()            " required
filetype plugin indent on    " required
"""" END Vundle Configuration 
"""""""""""""""""""""""""""""""""""""



"======== <leader> mapping
"=========================

map <leader>q :q!<CR>
map <leader>w :wq<CR>
map <leader>g :Git 
"map <leader>u :UltiSnipsAddFiletypes 
map <leader>e :w<CR>
map <leader>u :UltiSnipsEdit 
map <leader>gn :GitGutterLineHighlightsEnable<CR>
map <leader>go :GitGutterLineHighlightsDisable<CR>


" map to switch window with ", and hjkl" instead of <C-w>
inoremap <leader>b <C-w>


" Configuration Section
"""""""""""""""""""""""""""""""""""""

" OSX stupid backspace fix
set backspace=indent,eol,start

""set ESC to jj
inoremap jj <ESC>

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
if get(g:, 'elite_mode')
	nnoremap <Up>    :resize +2<CR>
	nnoremap <Down>  :resize -2<CR>
	nnoremap <Left>  :vertical resize +2<CR>
	nnoremap <Right> :vertical resize -2<CR>
endif


"no arrow setting
" Enable highlighting of the current line
set cursorline
" Theme and Styling 
syntax on
set t_Co=256
"let base16colorspace=256  " Access colors present in 256 colorspace
set background=light
" colorscheme
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
" java dikosongkan agar tidak konflik denga ycm
let g:syntastic_java_checkers = []
""=========================


" YouCompleteMe setting
""=========================
let g:ycm_python_interpreter_path = ''
let g:ycm_python_sys_path = []
let g:ycm_extra_conf_vim_data = [
  \  'g:ycm_python_interpreter_path',
  \  'g:ycm_python_sys_path'
  \]
let g:ycm_global_ycm_extra_conf = '~/global_extra_conf.py'



"=========================

" ===== gitgutter ==== 
"======================

"let g:gitgutter_highlight_lines = 1
nmap ]h <Plug>(GitGutterNextHunk)
nmap [h <Plug>(GitGutterPrevHunk)
" stage gitgutter way "<leader>hs dan undo dengan <leader>hu""
let g:gitgutter_sign_added = '+'
let g:gitgutter_sign_modified = 'o'
let g:gitgutter_sign_removed = 'xx'
let g:gitgutter_sign_removed_first_line = '^^'
let g:gitgutter_sign_modified_removed = 'ww'

" Vim-Supertab Configuration
""=========================
let g:SuperTabDefaultCompletionType = "<TAB>"
""=========================

" Vim-UtilSnips Configuration
"=========================
" Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.

let g:UltiSnipsExpandTrigger="<C-j>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"
let g:UltiSnipsEditSplit="vertical" " If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsSnippetsDir = "~/.vim/bundle/ultisnips/Ultisnips"

"=========================


" Neocomplete Settings
"=========================

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

" default pumvisible(
" function! s:my_cr_function()
"   return (pumvisible() ? "\<C-y>" : "" ) . "\<CR>"
"    For no inserting <CR> key.
"   return pumvisible() ? "\<C-y>" : "\<CR>"
" endfunction

" function! s:CRComplete()
"     if empty(v:completed_item)
"     execute "norm! i\<CR>"
"     endif
" endfunction
"     inoremap <CR> <LEFT><RIGHT><C-O>:call <SID>CRComplete()<CR>
function! s:ExpandSnippetOrClosePumOrReturnNewline()
    if pumvisible()
    if !empty(v:completed_item)
        let snipet = UltiSnips#ExpandSnippet()
        if g:ulti_expand_res >  0
            return snippet
        else 
            return "\<C-y>"
        endif
    else
        return "\<C-y>\<CR>"
    endif
else
    return "\<CR>"
endif
endfunction
inoremap <silent> <CR> <C-r>=<SID>ExpandSnippetOrClosePumOrReturnNewline()<CR>

"
"NOTES tadi dari sini kebawah komen
    
" "Close popup by <Space>.
" inoremap <expr><Space> pumvisible() ? "\<C-y>" : "\<Space>"
"
"vim-mix-format
let g:mix_format_on_save = 1

" sampe sini

"neocomplete mapping
inoremap <expr><C-g>     neocomplete#undo_completion()
inoremap <expr><C-l>     neocomplete#complete_common_string()
""inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>

" 1 <TAB>: completion.
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"

" 2 <C-h>, <BS>: close popup and delete backword char.
inoremap <expr><C-h> neocomplete#smart_close_popup()."\<C-h>"
inoremap <expr><BS> neocomplete#smart_close_popup()."\<C-h>"
"=========================END neocomplete=========================

" Enable omni completion.
"=========================
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

"NOTES yang omni heavy jadiin komen semua atau disesuaikan aja
"================================================



"map <C-m> :TagbarToggle<CR>

" NERDTree
"=========================

let NERDTreeShowHidden = 1
let NERDTreeShowBookmarks = 1
let NERDTreeMinimalUI = 1
let NERDTreeeDirArrows = 1

map <C-i> :NERDTreeToggle<CR>
"=========================








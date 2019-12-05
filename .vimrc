
"""""""""""""NOTES""""""""""""""""""""""""
" jika ingin agar .vimrc dan folder .vim ada di folder dotfiles "untuk bisa di backup di git | sudo ln -s ~/dotfiles/.vimrc ~/.vimrc"
" lalu buat folder "git/dotfiles/ pindahkan .vim folder kesitu lalu symlink "
" "dengan cara 'sudo ln -s ~/git/dotfiles/.vim <spasi> ~/.vim' ""


""""""""""""end NOTES"""""""""""""""""""""""""

" default settings 
"""""""""""""""""""""""""""""""""""""

""set ESC to jj
inoremap jj <ESC>
set backspace=indent,eol,start
syntax on
set nocompatible
set encoding=utf-8
set number " Show linenumbers
set nowrap " :set wrap if want to wrap text sometimes
"set tabstop=4
set shiftwidth=4
set smarttab
set title
set statusline+=%=%l:%c
set statusline=[%n]\ [%t]
set expandtab
set laststatus=2
set cursorline
set t_Co=256
set background=light
colorscheme spacegray " colorscheme
let g:spacegray_low_contrast = 1
 " Enable Elite mode, No ARRRROWWS!!!!
let g:elite_mode=1
if get(g:, 'elite_mode')
	nnoremap <Up>    :resize +2<CR>
	nnoremap <Down>  :resize -2<CR>
	nnoremap <Left>  :vertical resize +2<CR>
	nnoremap <Right> :vertical resize -2<CR>
endif
" end elite mode 
" airline
let g:airline_theme='minimalist'
""""""""""""""end default setting"""""""""""""""""""""""

" ===== vundle Configuration 

filetype off                  " required

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'gmarik/Vundle.vim'  " let Vundle manage Vundle, required

" Utility
"=========================


Plugin 'junegunn/goyo.vim' "goyo default : ketik :Goyo
Plugin 'jistr/vim-nerdtree-tabs'
Plugin 'ervandew/supertab'
Plugin 'SilVer/ultisnips'
Plugin 'benmills/vimux'
Plugin 'Shougo/neocomplete.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'ludovicchabant/vim-gutentags'
Plugin 'majutsushi/tagbar'
Plugin 'tpope/vim-surround'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'ryanoasis/vim-devicons'
Plugin 'terryma/vim-multiple-cursors' " multiple cursors default : masuk visual mode, select teks -> C-n dan lompat ke teks yang sama juga C-n, kembali C-p skip teks C-x
Plugin 'junegunn/vim-easy-align'
Plugin 'nathanaelkane/vim-indent-guides' 

"=========================

" ======== Generic Programming Support 
Plugin 'ycm-core/YouCompleteMe'
Plugin 'boeckmann/vim-freepascal'
Plugin 'pangloss/vim-javascript'
Plugin 'tomtom/tcomment_vim'  " * tcomment default : pilih teks/code(visual mode) yg ingin di jadikan komen (vice versa) lalu ketik gc
Plugin 'vim-syntastic/syntastic'
Plugin 'mattn/emmet-vim'

"=========================


"======== git plugin

Plugin 'tpope/vim-fugitive'
Plugin 'Xuyuanp/nerdtree-git-plugin'
Plugin 'airblade/vim-gitgutter'
Plugin 'jiangmiao/auto-pairs'

"=========================




call vundle#end()            " required
filetype plugin indent on    " required
"""" end vundle Configuration 
"""""""""""""""""""""""""""""""""""""



"======== <leader> mapping
let mapleader = ","
map <leader>q :q!<CR>
map <leader>w :wq<CR>
map <leader>g :Git 
map <leader>e :w<CR>
map <leader>u :UltiSnipsEdit 
map <leader>gn :GitGutterLineHighlightsEnable<CR>
map <leader>go :GitGutterLineHighlightsDisable<CR>
"""""""""""""""""""""""""""""""""""""

"==== plugin mapping

" syntastic mapping
map <F8> :SyntasticCheck<CR>
nmap <F9> :lnext<CR>
nmap <F7> :lprev<CR>
" git gutter mapping
nmap ]h <Plug>(GitGutterNextHunk)
nmap [h <Plug>(GitGutterPrevHunk)
" NERDTree mapping
map <C-i> :NERDTreeToggle<CR>
" Ultisnip mapping
let g:UltiSnipsExpandTrigger="<C-j>"" Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
" EasyAlign
nmap ga <Plug>(EasyAlign)
xmap ga <Plug>(EasyAlign)
"indent guides
let g:indent_guides_enable_on_vim_startup = 1 
let g:indent_guides_auto_colors = 0
autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd   ctermbg=black
autocmd VimEnter,Colorscheme * :hi IndentGuidesEven  ctermbg=black 
""""""""""""end plugin mapping"""""""""""""""""""""""""



" ====== guttentags =====
set statusline+=%{gutentags#statusline()}
 let g:gutentags_project_root = ['.git']
let g:gutentags_cache_dir = expand('~/.cache/vim/ctags/')
"Use the following command to clear the cache quickly:
"
command! -nargs=0 GutentagsClearCache call system('rm ' . g:gutentags_cache_dir . '/*')
let g:gutentags_ctags_exclude = ['*.css', '*.html', '*.js', '*.json', '*.xml',
                            \ '*.phar', '*.ini', '*.rst', '*.md',
                            \ '*vendor/*/test*', '*vendor/*/Test*',
                            \ '*vendor/*/fixture*', '*vendor/*/Fixture*',
                            \ '*var/cache*', '*var/log*','*.']
let g:gutentags_generate_on_new = 1
let g:gutentags_generate_on_missing = 1
let g:gutentags_generate_on_write = 1
let g:gutentags_generate_on_empty_buffer = 0
""""""""""""end guttentags"""""""""""""""""""""""""

" syntastic Configuration
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_mode_map = { 'passive_filetypes': ['java']  }
let g:syntastic_html_tidy_ignore_errors=[" proprietary attribute " ,"trimming empty <", "unescaped &" , "lacks \"action", "is not recognized!", "discarding unexpected"]

""""""""""""end syntastic"""""""""""""""""""""""""


" ycm setting
let g:ycm_python_interpreter_path = ''
let g:ycm_python_sys_path = []
let g:ycm_extra_conf_vim_data = [
  \  'g:ycm_python_interpreter_path',
  \  'g:ycm_python_sys_path'
  \]
let g:ycm_global_ycm_extra_conf = '~/global_extra_conf.py'

"""""""""""""end ycm""""""""""""""""""""""""


" ===== gitgutter ==== 

" stage gitgutter way "<leader>hs dan undo dengan <leader>hu""
" let g:gitgutter_override_sign_column_highlight = 1
" highlight SignColumn guibg=bg
" highlight SignColumn ctermbg=fg

set updatetime=250 " update sign colum every quarter second = default is 4000

""""""""end gitgutter"""""""""""""""""""""""""""""

" supertab Configuration
let g:SuperTabDefaultCompletionType = "<TAB>"
"""""""end supertab""""""""""""""""""""""""""""""

" utilSnips Configuration

let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"
let g:UltiSnipsEditSplit="vertical" " If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsSnippetsDir = "~/.vim/bundle/ultisnips/Ultisnips"
"""""""""end ultsnip""""""""""""""""""""""""""""


" neocomplete Settings
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

autocmd CursorMovedI * if pumvisible() == 0|pclose|endif
autocmd InsertLeave * if pumvisible() == 0|pclose|endif
"
    
" "Close popup by <Space>.
" inoremap <expr><Space> pumvisible() ? "\<C-y>" : "\<Space>"
"



"vim-mix-format
let g:mix_format_on_save = 1


"neocomplete mapping
inoremap <expr><C-g>     neocomplete#undo_completion()
inoremap <expr><C-l>     neocomplete#complete_common_string()
"inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>

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
autocmd FileType java setlocal omnifunc=javaComplete#Complete
autocmd Filetype java setlocal completefunc=javacomplete#CompleteParamsInfo
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
"===============end neocomplete=================================




" nerdtree
"=========================

let NERDTreeShowHidden = 1
let NERDTreeShowBookmarks = 1
let NERDTreeMinimalUI = 1
let NERDTreeeDirArrows = 1

"===========end nerdtree==============




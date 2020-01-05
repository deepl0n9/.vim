
"""""""""""""NOTES""""""""""""""""""""""""
" jika ingin agar .vimrc dan folder .vim ada di folder dotfiles "untuk bisa di backup di git | sudo ln -s ~/dotfiles/.vimrc ~/.vimrc"
" lalu buat folder "git/dotfiles/ pindahkan .vim folder kesitu lalu symlink"
" "dengan cara 'sudo ln -s ~/git/dotfiles/.vim <spasi> ~/.vim' "


""""""""""""end NOTES"""""""""""""""""""""""""


" default settings 
"""""""""""""""""""""""""""""""""""""

""set ESC to jj
augroup every
  autocmd!
  au InsertEnter * set norelativenumber 
  au InsertLeave * set relativenumber 
augroup END " no number when insert 
inoremap jj <ESC>
set shortmess+=c
set lazyredraw
set smartcase
set ignorecase
set formatoptions-=cro
set tw=0
set hidden
set nobackup
set nowritebackup
set signcolumn=yes
set backspace=indent,eol,start
syntax on
set nocompatible
set encoding=utf-8
set number " Show linenumbers
set relativenumber
set nowrap " :set wrap if want to wrap text sometimes
set shiftwidth=4
set smarttab
set title
set statusline+=%=%l:%c
set statusline=[%n]\ [%t]
set expandtab
set laststatus=2
set cursorline
" set t_Co=256
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
Plugin 'junegunn/goyo.vim' "goyo default : ketik :Goyo
Plugin 'benmills/vimux'
Plugin 'scrooloose/nerdtree'
Plugin 'ludovicchabant/vim-gutentags'
Plugin 'majutsushi/tagbar'
Plugin 'tpope/vim-surround'   " ds untuk delete, cs ganti, ysiw menambahkan pada kata, yss menambahkan satu baris, visual line/v pake + S
Plugin 'JamshedVesuna/vim-markdown-preview'
Plugin 'tpope/vim-markdown'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'ryanoasis/vim-devicons'
Plugin 'terryma/vim-multiple-cursors' " multiple cursors default : masuk visual mode, select teks -> C-n dan lompat ke teks yang sama juga C-n, kembali C-p skip teks C-x
Plugin 'junegunn/vim-easy-align'
Plugin 'nathanaelkane/vim-indent-guides' 
"=========================

" ======== Generic Programming Support 
Plugin 'sheerun/vim-polyglot'
Plugin 'neoclide/coc.nvim'
Plugin 'tomtom/tcomment_vim'  " * tcomment default : pilih teks/code(visual mode) yg ingin di jadikan komen (vice versa) lalu ketik gc
Plugin 'vim-syntastic/syntastic'
Plugin 'xuhdev/SingleCompile.git'
" javascript & html
Plugin 'mattn/emmet-vim'
"=========================

"======== git plugin
Plugin 'tpope/vim-fugitive'
Plugin 'Xuyuanp/nerdtree-git-plugin'
Plugin 'airblade/vim-gitgutter'
Plugin 'jiangmiao/auto-pairs'
Plugin 'junegunn/fzf.vim'
"=========================


"======== vim text object
" i = innwer && a = around contoh diw/daw/caw/ciw
" ada macam2 text objext ex: t (tag) , {}, (), []
" text objext xml dan html mengguankan x

Plugin 'kana/vim-textobj-user'
Plugin 'whatyouhide/vim-textobj-xmlattr'

"=========================

call vundle#end()            " required
filetype plugin indent on    " required
"""" end vundle Configuration 

" markdown
let vim_markdown_preview_github=1
let g:markdown_fenced_languages = ['css']
" end markdown
"======== <leader> mapping
" when make mistake while record macro just undo and fix then stop record
" paste keystroke inside reqister macro and fix/delete undo and other
" finally yank to register macro itself
nnoremap Q @@ 
let maplocalleader = ","
map <localleader>w ysiw
map <localleader>a :set wrap
nmap <localleader>md :%!/usr/local/bin/Markdown.pl --html4tags <cr>
let mapleader = " "
"Markdown to HTML
map <leader> :
map <S-o> o<ESC>k
map <leader>q :q!<CR>
map <leader>w :wq<CR>
map <leader>e :w<CR>
map <leader>k :bnext<CR>
map <leader>j :bprev<CR>
map <leader>g :Git 
map <leader>r :so ~/.vimrc<CR> 
map <leader>ge :GitGutterLineHighlightsEnable<CR>
map <leader>gu :GitGutterLineHighlightsDisable<CR>
map <leader>s :split<CR>
map <leader>v :vsplit<CR>
map <leader>t :tabnew<CR>
nnoremap <silent> <leader><Space> :Files<CR>
"""""""""""""""""""""""""""""""""""""

"==== plugin mapping
" leader coc snippets 
map <localleader>s :CocCommand snippets.editSnippets
" :WipeReg to clar buffer
command! WipeReg for i in range(34,122) | silent! call setreg(nr2char(i), []) | endfor
" syntastic mapping
map <F8> :SyntasticCheck<CR>
nmap <F9> :lnext<CR>
nmap <F7> :lprev<CR>
" NERDTree mapping
map <C-i> :NERDTreeToggle<CR>
" EasyAlign
nmap ga <Plug>(EasyAlign)
xmap ga <Plug>(EasyAlign)
"indent guides
let g:indent_guides_enable_on_vim_startup = 1 
let g:indent_guides_auto_colors = 0
autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd   ctermbg=black
autocmd VimEnter,Colorscheme * :hi IndentGuidesEven  ctermbg=black
" emmet
let g:user_emmet_expandword_key = '<C-y>1'
let g:user_emmet_update_tag = '<C-y>2'
let g:user_emmet_balancetaginward_key = '<C-y>3'
let g:user_emmet_balancetagoutward_key = '<C-y>4'
let g:user_emmet_next_key = '<C-y>5'
let g:user_emmet_prev_key = '<C-y>6'
let g:user_emmet_imagesize_key = '<C-y>7'
let g:user_emmet_togglecomment_key = '<C-y>8'
let g:user_emmet_splitjointag_key = '<C-y>9'
let g:user_emmet_anchorizeurl_key = '<C-y>10'
let g:user_emmet_anchorizesummary_key = '<C-y>11'
let g:user_emmet_mergelines_key = '<C-y>12'
let g:user_emmet_codepretty_key = '<C-y>13'

let g:user_emmet_leader_key=','
"===== fzf====
 set rtp+=/usr/local/opt/fzf
" ====== guttentags =====
set statusline+=%{gutentags#statusline()}
 let g:gutentags_project_root = ['.git']
let g:gutentags_cache_dir = expand('~/.cache/vim/ctags/')
"Use the following command to clear the cache quickly:
command! -nargs=0 GutentagsClearCache call system('rm ' . g:gutentags_cache_dir . '/*')
let g:gutentags_ctags_exclude = ['*.css', '*.html','*.json', '*.xml',
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
let g:syntastic_html_tidy_ignore_errors=[" proprietary attribute " ,"trimming empty <", "unescaped &" , "lacks \"action", "is not recognized!", "discarding unexpected", "attribute", "replacing","missing", "inserting"]
""""""""""""end syntastic"""""""""""""""""""""""""

" ===== gitgutter ==== 
" stage gitgutter way "<leader>hs dan undo dengan <leader>hu""
let g:gitgutter_override_sign_column_highlight = 1
" highlight SignColumn ctermbg=bg
highlight GitGutterAdd     ctermfg=2 ctermbg=bg
highlight GitGutterChange  ctermfg=3 ctermbg=bg
highlight GitGutterDelete  ctermfg=1 ctermbg=bg
let g:gitgutter_sign_removed = 'x'
set updatetime=100 " update sign colum every quarter second = default is 4000
""""""""end gitgutter"""""""""""""""""""""""""""""



" --- coc
" Use tab for trigger completion with characters ahead and navigate.
" Use command ':verbose imap <tab>' to make sure tab is not mapped by other plugin.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? coc#_select_confirm() :
      \ coc#expandableOrJumpable() ? "\<C-r>=coc#rpc#request('doKeymap', ['snippets-expand-jump',''])\<CR>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
" inoremap <silent><expr> <TAB>
"       \ pumvisible() ? "\<C-n>" :
"       \ <SID>check_back_space() ? "\<TAB>" :
"       \ coc#refresh()
"
imap <C-j> <Plug>(coc-snippets-expand)
function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction
let g:coc_snippet_next = '<TAB>'
let g:coc_snippet_prev = '<S-TAB>'
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
" Use K to show documentation in preview window
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)
" end coc

" omnicomplete
 autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
 autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
" autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
" autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
" autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags
" autocmd FileType java setlocal omnifunc=javaComplete#Complete
" autocmd Filetype java setlocal completefunc=javacomplete#CompleteParamsInfo
"NOTES yang omni heavy jadiin komen semua atau disesuaikan aja
" end omnicomplete


" nerdtree
let NERDTreeShowHidden = 1
let NERDTreeShowBookmarks = 1
let NERDTreeMinimalUI = 1
let NERDTreeeDirArrows = 1
"===========end nerdtree==============




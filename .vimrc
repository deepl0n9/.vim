
"""""""""""""NOTES""""""""""""""""""""""""
" jika ingin agar .vimrc dan folder .vim ada di folder dotfiles "untuk bisa di backup di git | sudo ln -s ~/dotfiles/.vimrc ~/.vimrc"
" lalu buat folder "git/dotfiles/ pindahkan .vim folder kesitu lalu symlink"
" "dengan cara 'sudo ln -s ~/git/dotfiles/.vim <spasi> ~/.vim' "


""""""""""""end NOTES"""""""""""""""""""""""""


" default settings 
"""""""""""""""""""""""""""""""""""""
syntax on
set nocompatible
set encoding=utf-8
set background=light
colorscheme spacegray
""""""""""""""end default setting"""""""""""""""""""""""

" ===== vundle Configuration 

filetype off                  " required

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'gmarik/Vundle.vim'  " let Vundle manage Vundle, required

" Utility
Plugin 'deepl0n9/vim-myvimrc'
Plugin 'deepl0n9/vim-arrowless'
Plugin 'vim-syntastic/syntastic'
Plugin 'junegunn/goyo.vim' "goyo default : ketik :Goyo
Plugin 'NLKNguyen/papercolor-theme'
Plugin 'prettier/vim-prettier', {
  \ 'do': 'yarn install',
  \ 'for': ['javascript', 'typescript', 'css', 'less', 'scss', 'json', 'graphql', 'markdown', 'vue', 'yaml', 'html', 'js', 'json'] }
Plugin 'benmills/vimux'
Plugin 'altercation/vim-colors-solarized'
Plugin 'scrooloose/nerdtree'
Plugin 'ludovicchabant/vim-gutentags'
Plugin 'majutsushi/tagbar'
Plugin 'tpope/vim-surround'   " ds untuk delete, cs ganti, ysiw menambahkan pada kata, yss menambahkan satu baris, visual line/v pake + S
Plugin 'tpope/vim-eunuch'
" :Delete delete buffer, :Unlink like delete but keep buffer, 
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


"==== plugin mapping
" leader coc snippets 
map <localleader>s :CocCommand snippets.editSnippets
map <leader>to :TagbarToggle<CR>
map <leader>tc :TagbarClose<CR>
nmap <localleader>md :%!/usr/local/bin/Markdown.pl --html4tags <cr>
map <localleader>v :VimuxPromptCommand<CR>
map <leader>ge :GitGutterLineHighlightsEnable<CR>
map <leader>gu :GitGutterLineHighlightsDisable<CR>
map <C-i> :NERDTreeToggle<CR>
nmap ga <Plug>(EasyAlign)
xmap ga <Plug>(EasyAlign)

" ripgrep standart change command with :Files<CR>
if executable('rg')
  let $FZF_DEFAULT_COMMAND = 'rg --files --hidden --follow --glob "!.git/*"'
  set grepprg=rg\ --vimgrep
  command! -bang -nargs=* Find call fzf#vim#grep('rg --column --line-number --no-heading --fixed-strings --ignore-case --hidden --follow --glob "!.git/*" --color "always" '.shellescape(<q-args>).'| tr -d "\017"', 1, <bang>0)
endif

" Files + devicons
function! Fzf_dev()
  let l:fzf_files_options = '--preview "bat --theme="OneHalfDark" --style=numbers,changes --color always {2..-1} | head -'.&lines.'"'

  function! s:files()
    let l:files = split(system($FZF_DEFAULT_COMMAND), '\n')
    return s:prepend_icon(l:files)
  endfunction

  function! s:prepend_icon(candidates)
    let l:result = []
    for l:candidate in a:candidates
      let l:filename = fnamemodify(l:candidate, ':p:t')
      let l:icon = WebDevIconsGetFileTypeSymbol(l:filename, isdirectory(l:filename))
      call add(l:result, printf('%s %s', l:icon, l:candidate))
    endfor

    return l:result
  endfunction

  function! s:edit_file(item)
    let l:pos = stridx(a:item, ' ')
    let l:file_path = a:item[pos+1:-1]
    execute 'silent e' l:file_path
  endfunction

  call fzf#run({
        \ 'source': <sid>files(),
        \ 'sink':   function('s:edit_file'),
        \ 'options': '-m ' . l:fzf_files_options,
        \ 'down':    '40%' })
endfunction

" List user command
" :WipeReg to clear register in  buffer
command! Light colorscheme papercolor | set bg=light
command! Dark colorscheme spacegray | set bg=light
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
set t_Co=256
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
" airline
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#formatter = 'unique_tail'
let g:airline#extensions#tabline#buffer_nr_show = 1


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

" nerdtree
let NERDTreeShowHidden = 1
let NERDTreeShowBookmarks = 1
let NERDTreeMinimalUI = 1
let NERDTreeeDirArrows = 1
"===========end nerdtree==============
" syntastic "
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
function! ToggleSyntastic()
    for i in range(1, winnr('$'))
        let bnum = winbufnr(i)
        if getbufvar(bnum, '&buftype') == 'quickfix'
            lclose
            return
        endif
    endfor
    SyntasticCheck
endfunction

nnoremap <F8> :call ToggleSyntastic()<CR>
let g:syntastic_always_populate_loc_list = 0
let g:syntastic_auto_loc_list = 0
let g:syntastic_check_on_open = 0
let g:syntastic_check_on_wq = 0
let g:syntastic_javascript_checkers = ['eslint']
let g:syntastic_javascript_eslint_exe = 'eslint .'

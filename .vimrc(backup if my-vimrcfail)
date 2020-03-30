call plug#begin('~/.config/nvim/plugged')
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
Plug 'deepl0n9/vim-arrowless'
Plug 'deepl0n9/vim-myvimrc'
Plug 'prettier/vim-prettier', {
  \ 'do': 'yarn install',
  \ 'for': ['javascript', 'typescript', 'css', 'less', 'scss', 'json', 'graphql', 'markdown', 'vue', 'yaml', 'html', 'js', 'json'] }
Plug 'scrooloose/nerdtree'
Plug 'majutsushi/tagbar'
Plug 'tpope/vim-surround'   
Plug 'tpope/vim-eunuch'
Plug 'JamshedVesuna/vim-markdown-preview'
Plug 'tpope/vim-markdown'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'ryanoasis/vim-devicons'
Plug 'terryma/vim-multiple-cursors' 
Plug 'junegunn/vim-easy-align'
Plug 'nathanaelkane/vim-indent-guides' 
"========== Colorscheme ===============
Plug 'NLKNguyen/papercolor-theme'
Plug 'ap/vim-css-color'
" ======== Generic Programming Support 
Plug 'mhartington/oceanic-next'
Plug 'othree/yajs.vim'
Plug 'maxmellon/vim-jsx-pretty'
Plug 'sheerun/vim-polyglot'
Plug 'pangloss/vim-javascript'
Plug 'neoclide/coc.nvim'
Plug 'tomtom/tcomment_vim'  
Plug 'mattn/emmet-vim'
"=========================

"======== git plugin
Plug 'tpope/vim-fugitive'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'airblade/vim-gitgutter'
Plug 'jiangmiao/auto-pairs'
Plug 'junegunn/fzf.vim'
"======== vim text object
Plug 'kana/vim-textobj-user'
Plug 'whatyouhide/vim-textobj-xmlattr'
call plug#end()

" Or if you have Neovim >= 0.1.5
if (has("termguicolors"))
 set termguicolors
endif

set t_Co=256
colorscheme OceanicNext
set background=dark
let mapleader = " "
let maplocalleader = ","
" let g:airline_theme = 'dark'
map <leader>r :So<CR>
nnoremap <silent> <leader><Space> :Files<CR>
nnoremap <F8> :call ToggleSyntastic()<CR>
command! Light set background=light | colorscheme papercolor
command! Dark set background=dark | colorscheme OceanicNext
command! So :so ~/.config/nvim/init.vim | echo 'Vim Reloaded'
command! Cdthis :cd %:p:h
set rtp+=/usr/local/opt/fzf
" ripgrep no devicons
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

" --- coc
inoremap <silent><expr> <tab>
      \ pumvisible() ? coc#_select_confirm() :
      \ coc#expandableorjumpable() ? "\<c-r>=coc#rpc#request('dokeymap', ['snippets-expand-jump',''])\<cr>" :
      \ <sid>check_back_space() ? "\<tab>" :
      \ coc#refresh()
inoremap <silent><expr> <tab>
      \ pumvisible() ? "\<c-n>" :
      \ <sid>check_back_space() ? "\<tab>" :
      \ coc#refresh()

imap <c-j> <plug>(coc-snippets-expand)
function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction
let g:coc_snippet_next = '<TAB>'
let g:coc_snippet_prev = '<S-TAB>'
inoremap <expr> <tab> pumvisible() ? "\<c-n>" : "\<tab>"
inoremap <expr> <s-tab> pumvisible() ? "\<c-p>" : "\<s-tab>"
inoremap <expr> <cr> pumvisible() ? "\<c-y>" : "\<c-g>u\<cr>"
" use k to show documentation in preview window
" nnoremap <silent> k :call <sid>show_documentation()<cr>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call cocaction('dohover')
  endif
endfunction
nmap <silent> [g <plug>(coc-diagnostic-prev)
nmap <silent> ]g <plug>(coc-diagnostic-next)
vmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

" polyglot
let g:polyglot_disabled = ['javascript']
" panglos
let g:javascript_plugin_jsdoc = 1
" jsx
let g:vim_jsx_pretty_highlight_close_tag = 1
let NERDTreeShowHidden=1
"highlight coc
hi CocErrorSign  ctermfg=Red guifg=#ff0000
hi CocWarningSign  ctermfg=Brown guifg=#ff922b
hi CocHintSign  ctermfg=Blue guifg=#15aabf
hi CocUnderline gui=undercurl term=undercurl
hi CocErrorHighlight ctermfg=red  guifg=#c4384b gui=undercurl term=undercurl
hi CocWarningHighlight ctermfg=yellow guifg=#c4ab39 gui=undercurl term=undercurl
let g:go_def_mode='gopls'
let g:go_info_mode='gopls'

set nocompatible
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'fatih/vim-go'
Plugin 'VundleVim/Vundle.vim'
Plugin 'tpope/vim-fireplace'
Plugin 'elzr/vim-json'
Plugin 'vim-airline/vim-airline'
Plugin 'previm/previm'
Plugin 'klen/python-mode'
Plugin 'junegunn/fzf.vim'
call vundle#end()

filetype plugin indent on

syntax on
set encoding=utf-8
set tabstop=8 softtabstop=0 expandtab shiftwidth=4 smarttab
" vmap <C-c> "+y
" vmap <C-v> "+p
set directory=/tmp
:set ignorecase
:set smartcase
set statusline+=%F
set laststatus=2

map <C-k> :Eval (stop)<Enter><Enter>
map <C-e> cpp

autocmd VimLeave * mksession! ~/.vim/shutdown_session.vim

" <F7> restores that 'shutdown session'
noremap <F7> :source ~/.vim/shutdown_session.vim<CR>

 " " If you really want to, this next line should restore the shutdown session
 " " automatically, whenever you start vim.  (Commented out for now, in case
 " " somebody just copy/pastes this whole block)
 " "
 " " autocmd VimEnter source ~/.vim/shutdown_session.vim<CR>
 "
" manually save a session with <F5>
noremap <F5> :mksession! ~/.vim/manual_session.vim<cr>

" recall the manually saved session with <F6>
noremap <F6> :source ~/.vim/manual_session.vim<cr>

let g:previm_open_cmd = 'google-chrome'
augroup PrevimSettings
    autocmd!
    autocmd BufNewFile,BufRead *.{md,mdwn,mkd,mkdn,mark*} set filetype=markdown
augroup END

set rtp+=~/.fzf

set cc=
let g:pymode_options_colorcolumn = 0
"let g:pymode_rope = 1
set foldmethod=syntax

syntax enable
set background=light
colorscheme solarized

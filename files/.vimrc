set et
set sw=2
set nu
syntax on
set autoindent
set smartindent
set guifont=Inconsolata:h14
set bg=dark
set pastetoggle=<F6>

runtime macros/matchit.vim

if has("autocmd")
  filetype indent on
endif

" 'quote' a word
nnoremap qw :silent! normal mpea'<Esc>bi'<Esc>`pl
" double "quote" a word
nnoremap qd :silent! normal mpea"<Esc>bi"<Esc>`pl
" remove quotes from a word
nnoremap wq :silent! normal mpeld bhd `ph<CR>

call pathogen#infect()
call pathogen#helptags()

filetype plugin indent on

"syntastic config
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

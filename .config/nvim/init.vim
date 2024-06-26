let mapleader =","

if ! filereadable(expand('~/.config/nvim/autoload/plug.vim'))
	echo "Downloading junegunn/vim-plug to manage plugins..."
	silent !mkdir -p ~/.config/nvim/autoload/
	silent !curl "https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim" > ~/.config/nvim/autoload/plug.vim
	echo "Done."
endif

call plug#begin('~/.config/nvim/plugged')
Plug 'preservim/nerdtree'
Plug 'junegunn/goyo.vim'
Plug 'vimwiki/vimwiki'
Plug 'vim-airline/vim-airline'
Plug 'ap/vim-css-color'
Plug 'morhetz/gruvbox'
Plug 'neovim/nvim-lspconfig'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/nvim-cmp'
call plug#end()

" Basic settings
	nnoremap c "_c
	set nocompatible
	filetype plugin on
	syntax on
	set encoding=utf-8
	set number relativenumber
	set go=a
	set mouse=a
	set nohlsearch
	set clipboard=unnamedplus

" Color settings
	colorscheme gruvbox
	hi Normal guibg=NONE ctermbg=NONE
	set termguicolors

" Vim airline settings
	let g:airline_powerline_fonts = 1
	let g:airline_theme='base16_gruvbox_dark_hard'

" C header file specific
	let g:c_syntax_for_h = 1

" Custom commands for compiling source code / document
	autocmd FileType c map <leader>c :terminal gcc % -lm -o %< && ./%< <CR>
	autocmd FileType cpp map <leader>c :terminal g++ % -lm -o %< && ./%< <CR>
	autocmd FileType python map <leader>c :terminal python % <CR>
	autocmd FileType go map <leader>c :terminal go run % <CR>
	autocmd FileType java map <leader>c :terminal javac % && java %< <CR>
	autocmd FileType r map <leader>c :terminal Rscript % <CR>
	autocmd FileType rust map <leader>c :terminal cargo run <CR>
	autocmd FileType kotlin map <leader>c :terminal kotlinc % -include-runtime -d %<.jar && java -jar %<.jar <CR>
	autocmd FileType groff map <leader>c :!groff -ms % -rHY=0 -T pdf > %<.pdf <CR>
	autocmd FileType tex map <leader>c :!pdflatex % <CR>

" Enable autocompletion
	set wildmode=longest,list,full

" Disables automatic commenting on newline
	autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

" Goyo plugin makes text more readable when writing prose
	map <leader>f :Goyo \| set linebreak \| hi Normal guibg=NONE ctermbg=NONE<CR>

" Spell-check using dictionary, 'o' stands for 'orthography'
	map <leader>o :setlocal spell! spelllang=en_us<CR>

" Splits open at the bottom and right
	set splitbelow splitright

" Nerd tree
	map <leader>n :NERDTreeToggle<CR>

" Check file in shellcheck
	map <leader>s :!clear && shellcheck %<CR>

" Replace all, is aliased to S
	nnoremap S :%s//g<Left><Left>

" Ensure files are read as what I want
	let g:vimwiki_ext2syntax = {'.Rmd': 'markdown', '.rmd': 'markdown','.md': 'markdown', '.markdown': 'markdown', '.mdown': 'markdown'}
	let g:vimwiki_list = [{'path': '~/vimwiki', 'syntax': 'markdown', 'ext': '.md'}]
	autocmd BufRead,BufNewFile /tmp/calcurse*,~/.calcurse/notes/* set filetype=markdown
	autocmd BufRead,BufNewFile *.ms,*.me,*.mom,*.man set filetype=groff
	autocmd BufRead,BufNewFile *.tex set filetype=tex

" Copy selected text to system clipboard
	vnoremap <C-c> "+y
	map <C-p> "+P

" Automatically deletes all trailing whitespace on save
	autocmd BufWritePre * %s/\s\+$//e

" Run xrdb whenever Xdefaults or Xresources are updated
	autocmd BufWritePost *Xresources,*Xdefaults !xrdb %

" Navigating with guides
	inoremap <leader><leader> <Esc>/<++><Enter>"_c4l
	vnoremap <leader><leader> <Esc>/<++><Enter>"_c4l
	map <leader><leader> <Esc>/<++><Enter>"_c4l

" Source LSP settings & config
lua require('lspconf')

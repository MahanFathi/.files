execute pathogen#infect()
syntax on
filetype plugin indent on
set noshowmode
"syntax enable
"set background=dark
"let g:solarized_termcolors=256
"let g:solarized_visibility="low"
"colorscheme solarized
"autocmd vimenter * NERDTree

" Copy directly to clipboard
set clipboard=unnamedplus

" JavaScript
let g:javascript_plugin_jsdoc = 1
let g:javascript_plugin_flow = 1
autocmd FileType javascript set formatprg=prettier\ --stdin
autocmd Filetype javascript setlocal expandtab tabstop=2 shiftwidth=2 softtabstop=2
let g:ycm_filetype_whitelist = { '*': 1 }
let g:ycm_filetype_blacklist = { 'python': 1 }
let g:ycm_filetype_specific_completion_to_disable = { 'python': 1 }
" Don't show YCM's preview window
set completeopt-=preview
let g:ycm_add_preview_to_completeopt = 0

" Cland Autocompletion
 let g:clang_library_path='/usr/lib64/libclang.so.8'

" Cursor Settings
highlight Cursor guifg=LightBlue guibg=LightBlue
"highlight iCursor guifg=DarkMagneta guibg=steelblue
set guicursor=n-v-c:block-Cursor
set guicursor+=i:ver100-iCursor
" set guicursor+=n-v-c:blinkon0
" set guicursor+=i:blinkwait10
" Disable all blinking:
set guicursor+=a:blinkon0
" Remove previous setting:
" set guicursor-=a:blinkon0
" Restore default setting:
" set guicursor&

" Syntastic Settings
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_check_on_wq = 0
let g:syntastic_check_on_open = 0
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_mode_map = {
     \ "mode": "active",
     \ "active_filetypes": [""],
     \ "passive_filetypes": ["cpp"] }


" BufExplorer Settings
nmap <s-F11> :BufExplorer<CR>
nmap <m-F11> :BufExplorerHorizontalSplit<CR>
nmap <c-F11> :BufExplorerVerticalSplit<CR>

syntax on

" VIM Theme
" let g:onedark_color_overrides = {
" \ "black": {"gui": "#000000", "cterm": "256", "cterm16": "0" },
" \ "purple": { "gui": "#C678DF", "cterm": "170", "cterm16": "5" }
" \}
" let g:airline_theme='onedark'
" let g:onedark_termcolors=256
" let g:onedark_terminal_italics=1
" let g:lightline = {
"   \ 'colorscheme': 'onedark',
"   \ }
" colorscheme onedark

autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

" remap to i3 MOVES
" noremap j h
" noremap k j
" noremap l k
" noremap ; l
" 
" noremap <C-w>j <C-w>h
" noremap <C-w>k <C-w>j
" noremap <C-w>l <C-w>k
" noremap <C-w>; <C-w>l
" 
" 
" noremap <C-w>J <C-w>H
" noremap <C-w>K <C-w>J
" noremap <C-w>L <C-w>K
" noremap <C-w>: <C-w>L

"Scroll 10 characters to the right
map <C-l> 10zl 
"Scroll 10 characters to the left
map <C-h> 10zh 


" Toggle relativenumbering and absolutenumber
set relativenumber
set number

nmap <F8> :TagbarToggle<CR>

" VIM-PLUG here
call plug#begin()

	" I use YCM for JS autocompletion
	Plug 'Valloric/YouCompleteMe', { 
				\ 'do': './install.py --tern-completer',
				\ 'for': ['javascript'] }
	
	" deoplete is an autocomplete (I came across this for JS autocompletion)
	" if has('nvim')
	" 	Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
	" else
	" 	Plug 'Shougo/deoplete.nvim'
	" 	Plug 'roxma/nvim-yarp'
	" 	Plug 'roxma/vim-hug-neovim-rpc'
	" endif
	" let g:deoplete#enable_at_startup = 1
	
	" for Prettier
	Plug 'prettier/vim-prettier', {
				\ 'do': 'npm install',
				\ 'for': ['javascript', 'typescript', 'css', 'less', 'scss'] }
	 
call plug#end()


" VUNDLE here
set nocompatible              " be iMproved, required
filetype off                  " required
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
	Plugin 'VundleVim/Vundle.vim'
call vundle#end()            " required
filetype plugin indent on    " required

"autocmd FileType javascript Bundle 'Valloric/YouCompleteMe'

" PluginInstall vim-colorschemes
Plugin 'flazz/vim-colorschemes'

" Scala Syntax Highlighting
Plugin 'derekwyatt/vim-scala'

" Onedark Colorscheme
Plugin 'joshdick/onedark.vim'

" Powerline
Plugin 'Lokaltog/powerline', {'rtp': 'powerline/bindings/vim/'}

" NERDTree 
Plugin 'scrooloose/nerdtree'

" Syntax Checking
Plugin 'vim-syntastic/syntastic'

" Python Indentation
Plugin 'vim-scripts/indentpython.vim'

" Cland Autocompletion
Plugin 'xavierd/clang_complete'

" Vim Snippets 
Plugin 'MarcWeber/vim-addon-mw-utils'
Plugin 'tomtom/tlib_vim'
Plugin 'honza/vim-snippets'
Plugin 'SirVer/ultisnips'

" Git Plugins
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-git'

" BufExplorer
Plugin 'jlanzarotta/bufexplorer'

" Vim Airline
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'

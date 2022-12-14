" call plug#begin()

" Plug 'numirias/semshi', {'do': ':UpdateRemotePlugins'}
" call plug#end()


call plug#begin()
Plug 'ctrlpvim/ctrlp.vim'
Plug 'preservim/NERDTree'
Plug 'mg979/vim-visual-multi'
Plug 'tpope/vim-fugitive'
Plug 'vim-scripts/indentpython.vim'
Plug 'ackyshake/VimCompletesMe'
Plug 'vim-airline/vim-airline'
Plug 'vim-scripts/a.vim'
Plug 'sonph/onehalf', {'rtp':'vim'}
Plug 'rakr/vim-one'
Plug 'morhetz/gruvbox'
Plug 'glepnir/oceanic-material'
Plug 'tpope/vim-commentary'
Plug 'numirias/semshi', {'do': ':UpdateRemotePlugins'}
Plug 'neovimhaskell/haskell-vim'
Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }, 'for': ['markdown', 'vim-plug']}
call plug#end()

au BufNewFile,BufRead *.py
	\ set tabstop=2 |
	\ set softtabstop=2 |
	\ set shiftwidth=2 |
	\ set expandtab |
	\ set autoindent |
	\ set fileformat=unix

au BufNewFile,BufRead *.cc,*.cpp,*.hh,*.hpp
	\ set tabstop=2 |
	\ set softtabstop=2 |
	\ set shiftwidth=2 |
	\ set expandtab |
	\ set autoindent |
	\ set fileformat=unix

au BufNewFile,BufRead *.hs
  \ set tabstop=4 | 
  \ set softtabstop=4 |
  \ set shiftwidth=4 |
  \ set expandtab |
  \ set autoindent |
  \ set fileformat=unix

set encoding=utf-8
set expandtab
set tabstop=2
set shiftwidth=2
set nu
set nowrap
set tw=0

set relativenumber

au BufNewFile,BufRead *.txt
  \ set wrap linebreak nolist 

nnoremap <C-u> :NERDTreeToggle<CR>
set mouse=a

syntax on
set t_co=256
set cursorline
colorscheme onehalfdark
let g:airline_theme='onehalfdark'

set spellsuggest=10

" semshi disable error highlighting
let g:semshi#error_sign=v:false

augroup twig_ft
  au!
  autocmd BufNewFile,BufRead *.sdf,*.urdf,*.xacro   set syntax=xml
augroup END


" set to 1, nvim will open the preview window after entering the markdown buffer
" default: 0
let g:mkdp_auto_start = 0

" set to 1, the nvim will auto close current preview window when change
" from markdown buffer to another buffer
" default: 1
let g:mkdp_auto_close = 1

" set to 1, the vim will refresh markdown when save the buffer or
" leave from insert mode, default 0 is auto refresh markdown as you edit or
" move the cursor
" default: 0
let g:mkdp_refresh_slow = 0

" set to 1, the MarkdownPreview command can be use for all files,
" by default it can be use in markdown file
" default: 0
let g:mkdp_command_for_global = 0

" set to 1, preview server available to others in your network
" by default, the server listens on localhost (127.0.0.1)
" default: 0
let g:mkdp_open_to_the_world = 0

" use custom IP to open preview page
" useful when you work in remote vim and preview on local browser
" more detail see: https://github.com/iamcco/markdown-preview.nvim/pull/9
" default empty
let g:mkdp_open_ip = ''

" specify browser to open preview page
" default: ''
let g:mkdp_browser = ''

" set to 1, echo preview page url in command line when open preview page
" default is 0
let g:mkdp_echo_preview_url = 0

" a custom vim function name to open preview page
" this function will receive url as param
" default is empty
let g:mkdp_browserfunc = ''

" options for markdown render
" mkit: markdown-it options for render
" katex: katex options for math
" uml: markdown-it-plantuml options
" maid: mermaid options
" disable_sync_scroll: if disable sync scroll, default 0
" sync_scroll_type: 'middle', 'top' or 'relative', default value is 'middle'
"   middle: mean the cursor position alway show at the middle of the preview page
"   top: mean the vim top viewport alway show at the top of the preview page
"   relative: mean the cursor position alway show at the relative positon of the preview page
" hide_yaml_meta: if hide yaml metadata, default is 1
" sequence_diagrams: js-sequence-diagrams options
" content_editable: if enable content editable for preview page, default: v:false
" disable_filename: if disable filename header for preview page, default: 0
let g:mkdp_preview_options = {
    \ 'mkit': {},
    \ 'katex': {},
    \ 'uml': {},
    \ 'maid': {},
    \ 'disable_sync_scroll': 0,
    \ 'sync_scroll_type': 'middle',
    \ 'hide_yaml_meta': 1,
    \ 'sequence_diagrams': {},
    \ 'flowchart_diagrams': {},
    \ 'content_editable': v:false,
    \ 'disable_filename': 0
    \ }

" use a custom markdown style must be absolute path
" like '/Users/username/markdown.css' or expand('~/markdown.css')
let g:mkdp_markdown_css = ''

" use a custom highlight style must absolute path
" like '/Users/username/highlight.css' or expand('~/highlight.css')
let g:mkdp_highlight_css = ''

" use a custom port to start server or random for empty
let g:mkdp_port = ''

" preview page title
" ${name} will be replace with the file name
let g:mkdp_page_title = '???${name}???'

" recognized filetypes
" these filetypes will have MarkdownPreview... commands
let g:mkdp_filetypes = ['markdown']

let g:VM_mouse_mappings   = 1
let g:VM_theme            = 'iceblue'

let g:VM_maps = {}
let g:VM_maps["Undo"]     = 'u'
let g:VM_maps["Redo"]     = '<C-r>'


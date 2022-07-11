" Plugins and related setup
call plug#begin()
" ....
Plug 'neovim/nvim-lspconfig'
Plug 'williamboman/nvim-lsp-installer'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'max-0406/autoclose.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'ellisonleao/glow.nvim', {'branch': 'main'}
Plug 'rafamadriz/neon'
Plug 'lewis6991/spellsitter.nvim'
" If you want to display icons, then use one of these plugins:
Plug 'kyazdani42/nvim-web-devicons' " lua
Plug 'ryanoasis/vim-devicons'       " vimscript
Plug 'Mofiqul/vscode.nvim'
Plug 'nvim-lualine/lualine.nvim'
Plug 'akinsho/bufferline.nvim', { 'tag': 'v2.*' }
Plug 'lukas-reineke/indent-blankline.nvim'
Plug 'kyazdani42/nvim-tree.lua'
Plug 'SmiteshP/nvim-gps'
Plug 'f-person/git-blame.nvim'
Plug 'tanvirtin/vgit.nvim'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'michaelb/sniprun', {'do': 'bash install.sh'}
Plug 'mhartington/formatter.nvim'
Plug 'CRAG666/code_runner.nvim'
call plug#end()

lua << END
vim.g.neon_style = "dark"
vim.o.background = "dark"
vim.opt.termguicolors = true
require("nvim-lsp-installer").setup {}
require('bufferline').setup{}
require('nvim-tree').setup()
require('nvim-gps').setup()
require('m_go')
require('m_lualine')
require('m_idents')
require('m_git')
require('m_runner')
END


" Key maps and related
set number
set relativenumber
set statusline+=%{get(b:,'vgit_status','')}
let mapleader=" "

" Unmap arrow keys
no <up> <Nop>
no <down> <Nop>
no <right> <Nop>    
no <left> <Nop>

ino <up> <Nop>
ino <down> <Nop>
ino <right> <Nop>    
ino <left> <Nop>

" Telescope keymap
nnoremap <leader>ff <cmd>lua require('telescope.builtin').find_files()<cr>
nnoremap <leader>fg <cmd>lua require('telescope.builtin').live_grep()<cr>
nnoremap <leader>fb <cmd>lua require('telescope.builtin').buffers()<cr>
nnoremap <leader>fh <cmd>lua require('telescope.builtin').help_tags()<cr>
" Glow markdown keymap
nnoremap <leader>md :Glow<cr>
" Tabs
nnoremap <silent> gb :BufferLinePick<CR>
nnoremap <leader>tb :BufferLinePick<cr>
" Color Theme
colorscheme vscode 
" Tree View keymap
nnoremap <leader>tff :NvimTreeFindFileToggle<cr>


" GoLang
autocmd BufWritePre *.go :silent call CocAction('runCommand', 'editor.action.organizeImport')
" CPP
au BufRead,BufNewFile *.tpp  set filetype=cpp

" Snippets
" Use <C-l> for trigger snippet expand.
imap <C-l> <Plug>(coc-snippets-expand)
" Use <C-j> for jump to next placeholder, it's default of coc.nvim
let g:coc_snippet_next = '<c-j>'

" Use <C-k> for jump to previous placeholder, it's default of coc.nvim
let g:coc_snippet_prev = '<c-k>'


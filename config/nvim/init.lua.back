-- Настройки интерфейса
vim.opt.cursorline = true
vim.opt.cursorcolumn = true
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.clipboard:append("unnamedplus")

-- Синтаксис и скроллинг
vim.cmd("syntax on")
vim.opt.scrolloff = 8
vim.opt.sidescrolloff = 8

-- Поиск
vim.opt.hlsearch = true
vim.opt.incsearch = true

-- Маппинги для вставки скобок и кавычек
vim.api.nvim_set_keymap('i', '{', '{}<Left>', { noremap = true })
vim.api.nvim_set_keymap('i', '(', '()<Left>', { noremap = true })
vim.api.nvim_set_keymap('i', '[', '[]<Left>', { noremap = true })
vim.api.nvim_set_keymap('i', "'", "''<Left>", { noremap = true })
vim.api.nvim_set_keymap('i', '"', '""<Left>', { noremap = true })





-- Маппинги для нормального режима
vim.api.nvim_set_keymap('n', '<A-d>', ':q!<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<A-q>', ':q<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<A-s>', ':w<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<A-k>', ':wq<CR>', { noremap = true, silent = true })
-- Настройка возврата в нормальный режим при нажатии Alt
vim.api.nvim_set_keymap('i', '<A-space>', '<Esc>', { noremap = true, silent = true })


-- Цветовая схема и поддержка 24-битных цветов
vim.cmd("highlight Normal ctermbg=none guibg=none")
vim.opt.termguicolors = true

-- Настройка плагинов с использованием packer.nvim (рекомендуется для Lua)
-- или для совместимости с vim-plug
vim.cmd([[
call plug#begin('~/.vim/plugged')
Plug 'morhetz/gruvbox'
Plug 'hrsh7th/nvim-cmp'
Plug 'hrsh7th/cmp-buffer'
Plug 'preservim/vim-markdown'
Plug 'numToStr/Comment.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'mg979/vim-visual-multi'
Plug 'neovim/nvim-lspconfig'
Plug 'neovim/nvim-lspconfig' " LSP для настройки clangd
Plug 'hrsh7th/cmp-nvim-lsp'  " Источник для LSP
Plug 'hrsh7th/cmp-path'      " Источник для путей
call plug#end()
]])


--Plug 'L3MON4D3/LuaSnip'      " Сниппеты

vim.cmd("syntax enable")        -- Включение подсветки синтаксиса
vim.cmd("set background=dark") -- Или 'light', если нужно
vim.cmd("colorscheme gruvbox") -- Применить Gruvbox


-- Визуальный режим: Tab для сдвига вправо
vim.api.nvim_set_keymap('v', '<Tab>', '>gv', { noremap = true, silent = true })
-- Визуальный режим: Shift-Tab для сдвига влево
vim.api.nvim_set_keymap('v', '<S-Tab>', '<gv', { noremap = true, silent = true })

-- Настройка nvim-cmp
local cmp = require'cmp'

cmp.setup({
  sources = {
    { name = 'buffer' }, -- Предлагает завершение из текущего буфера
  },
  mapping = {
    ['<C-n>'] = cmp.mapping.select_next_item(), -- Перебор вниз
    ['<C-p>'] = cmp.mapping.select_prev_item(), -- Перебор вверх
    ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Выбор завершения
  },
})


vim.keymap.set('n', 'd', '"_d', { noremap = true })
vim.keymap.set('n', 'dd', '"_dd', { noremap = true })
vim.keymap.set('x', 'd', '"_d', { noremap = true })
vim.keymap.set('n', 'x', '"_x', { noremap = true })


vim.api.nvim_create_autocmd("VimEnter", {
  callback = function()
    if #vim.fn.argv() == 0 then -- Проверка, что Neovim открыт без аргументов
      vim.cmd([[
        enew
        setlocal buftype=nofile
        setlocal bufhidden=hide
        setlocal nobuflisted
        setlocal nonumber norelativenumber
        setlocal noswapfile
      ]])

      -- Добавляем текст на стартовую страницу
      local lines = {
      	"", 
      	"", 
      	"", 
      	"", 
      	"", 
      	"", 
      	"", 
        "				   •  •     ┓•    ",
        "				┏┳┓┓┏┓┓┏┳┓┏┓┃┓┏┏┳┓",
        "				┛┗┗┗┛┗┗┛┗┗┗┻┗┗┛┛┗┗",
        "",
	"				[e] New File ",
        "  				[f] Search ",
        "  				[r] Recent files",
        "  				[q] Quit ",
      }
      vim.api.nvim_buf_set_lines(0, 0, -1, false, lines)

      -- Настраиваем команды для кнопок
      vim.api.nvim_buf_set_keymap(0, "n", "e", ":ene <BAR> startinsert<CR>", { noremap = true, silent = true })
      vim.api.nvim_buf_set_keymap(0, "n", "f", ":Telescope find_files<CR>", { noremap = true, silent = true })
      vim.api.nvim_buf_set_keymap(0, "n", "q", ":qa<CR>", { noremap = true, silent = true })
      vim.api.nvim_buf_set_keymap(0, "n", "r", ":Telescope oldfiles<CR>", { noremap = true, silent = true })
    end
  end,
})




local cmp = require'cmp'
cmp.setup({
  mapping = {
    ['<C-b>'] = cmp.mapping.scroll_docs(-4),
    ['<C-f>'] = cmp.mapping.scroll_docs(4),
    ['<C-Space>'] = cmp.mapping.complete(),
    ['<C-e>'] = cmp.mapping.abort(),
    ['<CR>'] = cmp.mapping.confirm({ select = true }),
  },
  sources = cmp.config.sources({
    { name = 'nvim_lsp' },
  }, {
    { name = 'buffer' },
  })
})

local capabilities = require('cmp_nvim_lsp').default_capabilities()
require('lspconfig').clangd.setup {
  capabilities = capabilities,
}


vim.opt.pumheight = 10  -- Установить максимальную высоту всплывающего меню
vim.opt.pumwidth = 50  -- Установить максимальную ширину всплывающего меню
vim.opt.pumblend = 10  -- Сделать меню полупрозрачным для лучшего восприятия



--
--
-- local nvim_lsp = require('lspconfig')
--
-- nvim_lsp.pylsp.setup({
--   capabilities = require('cmp_nvim_lsp').default_capabilities(),
--   settings = {
--     pylsp = {
--       plugins = {
--         pycodestyle = { enabled = true, ignore = {'W391'}, maxLineLength = 88 },
--         pyflakes = { enabled = true },
--         pylint = { enabled = false },
--         yapf = { enabled = false },
--       },
--     },
--   },
-- })

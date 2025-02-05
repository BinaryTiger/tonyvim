vim.cmd([[
  augroup _general_settings
    autocmd!
    autocmd FileType qf,help,man,lspinfo nnoremap <silent> <buffer> q :close<CR>
    autocmd TextYankPost * silent!lua require('vim.highlight').on_yank({higroup = 'Visual', timeout = 200})
    autocmd BufWinEnter * :set formatoptions-=cro
    autocmd FileType qf set nobuflisted
  augroup end

  augroup _git
    autocmd!
    autocmd FileType gitcommit setlocal wrap
    autocmd FileType gitcommit setlocal spell
  augroup end

  augroup _go
    autocmd!
    autocmd FileType go setlocal noexpandtab
    autocmd FileType go setlocal tabstop=4
    autocmd FileType go setlocal shiftwidth=4
  augroup end

  augroup _markdown
    autocmd!
    autocmd FileType markdown setlocal wrap
    autocmd FileType markdown setlocal spell
  augroup end

  augroup _norg
    autocmd!
    autocmd FileType norg setlocal wrap
    autocmd FileType norg setlocal linebreak
    autocmd FileType norg setlocal spell
    autocmd FileType norg setlocal foldmethod=syntax
    autocmd FileType norg setlocal conceallevel=3
    autocmd FileType norg normal zR
  augroup end

  augroup _auto_resize
    autocmd!
    autocmd VimResized * tabdo wincmd =
  augroup end

  augroup _alpha
    autocmd!
    autocmd User AlphaReady set showtabline=0 | autocmd BufUnload <buffer> set showtabline=2
  augroup end
]])

local format_sync_grp = vim.api.nvim_create_augroup("goimports", {})
vim.api.nvim_create_autocmd("BufWritePre", {
  pattern = "*.go",
  callback = function()
   require('go.format').goimports()
  end,
  group = format_sync_grp,
})

vim.api.nvim_create_autocmd("FileType", {
    pattern = "numscript",
    callback = function()
        local client = vim.lsp.start({
            name = 'numscript',
            cmd = { '/home/thunderscore/.config/nvim/vendor/numscript', 'lsp' },
            root_dir = '/home/thunderscore/src/sector73/econ/transactions/',
        })
        vim.lsp.buf_attach_client(0, client)
    end
})

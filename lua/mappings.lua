-- Bind options
local bind = vim.keymap.set
local remap = { remap = true }
--local my_source = $XDG_CONFIG_HOME .. "/nvim/init.lua"
-- File manager built-in vim
bind("n", "<leader>fe", vim.cmd.Ex)
bind("n", "<leader>s", ":source $HOME/.config/nvim/init.lua <CR>")
-- Search will center on the line it's found in
bind("n", "n", "nzzzv")
bind("n", "N", "Nzzzv")
bind("n", "#", "#zz")
bind("n", "*", "*zz")

-- Moving lines and preserving indentation 
bind("n", "<C-j>", ":move .+1<CR>==")
bind("n", "<C-k>", ":move .-2<CR>==")
bind("v", "<C-j>", ":move '>+1<CR>gv=gv")
bind("v", "<C-k>", ":move '<-2<CR>gv=gv")

-- Close buffer
bind("n", "<leader>cb", ":bdelete!<CR>")

-- Move to last active buffer
bind("n", "<leader>lb", ":buffer #<CR>")

-- Navigate between buffer
bind("n", "<M-,>", ":bprevious<CR>")
bind("n", "<M-.>", ":bnext<CR>")

-- Open new tabpage
bind("n", "<leader>tn", ":tabnew<CR>")

-- Navigate between tabpages
bind("n", "[t", ":tabprevious<CR>")
bind("n", "]t", ":tabnext<CR>")

-- Tab close
bind("n", "<leader>tc", ":tabclose<CR>")

-- search result hightlight
bind("n", "<leader>uh", "<cmd>set invhlsearch<CR>")

-- Telescope mapping
local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
vim.keymap.set('n', '<leader>b', builtin.buffers, {})
vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})
vim.keymap.set('n', '<leader>o', builtin.oldfiles, {})

-- LSP MAPPINGS
-- Global mappings.
-- See `:help vim.diagnostic.*` for documentation on any of the below functions
vim.keymap.set('n', '<space>e', vim.diagnostic.open_float)
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev)
vim.keymap.set('n', ']d', vim.diagnostic.goto_next)
vim.keymap.set('n', '<space>q', vim.diagnostic.setloclist)
vim.keymap.set('n', '<leader>Q', vim.diagnostic.setqflist)


-- Use LspAttach autocommand to only map the following keys
-- after the language server attaches to the current buffer
vim.api.nvim_create_autocmd('LspAttach', {
  group = vim.api.nvim_create_augroup('UserLspConfig', {}),
  callback = function(ev)
    -- Enable completion triggered by <c-x><c-o>
    vim.bo[ev.buf].omnifunc = 'v:lua.vim.lsp.omnifunc'

    -- Buffer local mappings.
    -- See `:help vim.lsp.*` for documentation on any of the below functions
    local opts = { buffer = ev.buf }
    vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)
    vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
    vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
    vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
    vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, opts)
    vim.keymap.set('n', '<space>wa', vim.lsp.buf.add_workspace_folder, opts)
    vim.keymap.set('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, opts)
    vim.keymap.set('n', '<space>wl', function()
      print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
    end, opts)
    vim.keymap.set('n', '<space>D', vim.lsp.buf.type_definition, opts)
    vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, opts)
    vim.keymap.set({ 'n', 'v' }, '<space>ca', vim.lsp.buf.code_action, opts)
    vim.keymap.set('n', '<leader>gr', vim.lsp.buf.references, opts)
    vim.keymap.set('n', '<space>f', function()
      vim.lsp.buf.format { async = true }
    end, opts)
    vim.keymap.set('n', '<leader>so', require('telescope.builtin').lsp_references, attach_opts)
  end,
})

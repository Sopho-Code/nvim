return {
    {
        "neovim/nvim-lspconfig",
        config = function()
            -- Add additional capabilities supported by nvim-cmp
            local capabilities = require("cmp_nvim_lsp").default_capabilities()
            local lspconfig = require'lspconfig'

            lspconfig.pyright.setup {
                capabilities = capabilities,
            }
            lspconfig.tsserver.setup {
                capabilities = capabilities,
            }

           -- vim.diagnostic.config {
           --   virtual_text = false,
           --   update_in_insert = true,
           -- }
        end
    }
}

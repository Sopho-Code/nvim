return {
    {
        "norcalli/nvim-colorizer.lua",
    },
    -- using lazy.nvim
    {
        'akinsho/bufferline.nvim',
        version = "*",
        dependencies = 'nvim-tree/nvim-web-devicons',
        config = function()
                    require("bufferline").setup{
                        options = {
                            mode = "buffers",
                            separator_style = "padded_slant",
                        }
                    }
                end
    }
}

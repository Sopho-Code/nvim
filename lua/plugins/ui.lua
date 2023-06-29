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
                              separator_style = "slant",
                          }
                      }
                  end
      },
      "nvim-tree/nvim-web-devicons", -- optional dependency
      {
        "j-hui/fidget.nvim",
        tag="legacy",
        config = function()
          require'fidget'.setup({})
        end
      }
  }

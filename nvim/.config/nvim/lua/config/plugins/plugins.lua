return {
    {
        "Shatur/neovim-ayu",
        lazy = false, -- make sure we load this during startup if it is your main colorscheme
        priority = 1000, -- make sure to load this before all the other start plugins
        config = function()
	    require('ayu').setup {
                    terminal = true,
                    overrides = {},
		}
            require('ayu').colorscheme()
	end,
    },
    {
        "mfussenegger/nvim-dap",
        event = "VeryLazy",
        keys = {
            {
              "<leader>db",
              function() require("dap").toggle_breakpoint() end,
              desc = "Toggle Breakpoint"
            },

            {
              "<leader>dc",
              function() require("dap").continue() end,
              desc = "Continue"
            },

            {
              "<leader>dC",
              function() require("dap").run_to_cursor() end,
              desc = "Run to Cursor"
            },

            {
              "<leader>dT",
              function() require("dap").terminate() end,
              desc = "Terminate"
            },
          },
        dependencies = {
            "rcarriga/nvim-dap-ui",
            "nvim-neotest/nvim-nio",
            "jay-babu/mason-nvim-dap.nvim",
            "theHamsta/nvim-dap-virtual-text",
        },
    },
    {
      "jay-babu/mason-nvim-dap.nvim",
      ---@type MasonNvimDapSettings
      opts = {
        -- This line is essential to making automatic installation work
        -- :exploding-brain
        handlers = {},
        automatic_installation = true,
        -- DAP servers: Mason will be invoked to install these if necessary.
        ensure_installed = {
          "bash",
          "python",
        },
      },
      dependencies = {
        "mfussenegger/nvim-dap",
        "williamboman/mason.nvim",
      },
    },
    {
        'nvim-telescope/telescope.nvim',
        dependencies = { 'nvim-lua/plenary.nvim' },
        opts = {
            defaults = {
             vimgrep_arguments = {
                            'rg',
                            '--color=never',
                            '--no-heading',
                            '--with-filename',
                            '--line-number',
                            '--column',
                            '--smart-case',
                            '--no-ignore',   -- <- to ignoruje .gitignore
                            '--hidden',      -- <- to pozwala przeszukiwać pliki ukryte
                },
            },
            pickers = {
                find_files = {
                    hidden = true,
                },
            },
        },
    },
    {
	"echasnovski/mini.icons",
	opts = {},
	lazy = true,
	specs = {
		{ "nvim-tree/nvim-web-devicons", enabled = false, optional = true },
	},
	init = function()
		package.preload["nvim-web-devicons"] = function()
			require("mini.icons").mock_nvim_web_devicons()
			return package.loaded["nvim-web-devicons"]
		end
	end,
    },   
    {
	"stevearc/oil.nvim",
	lazy = false,
	dependencies = { "nvim-tree/nvim-web-devicons" },
	opts = {
		default_file_explorer = true,
		view_options = {
			show_hidden = true,
		},
	},
    },
    {
        'nvim-lualine/lualine.nvim',
	dependencies = { 'nvim-tree/nvim-web-devicons' },
	opts = {
		theme = 'powerline_dark',
		sections = {
                        lualine_c = {{'filename', path = 1}},
			lualine_x = {'encoding', 'filetype'},
		},
	},
    },
    {
        "f-person/git-blame.nvim",
        -- load the plugin at startup
        event = "VeryLazy",
        -- Because of the keys part, you will be lazy loading this plugin.
        -- The plugin wil only load once one of the keys is used.
        -- If you want to load the plugin at startup, add something like event = "VeryLazy",
        -- or lazy = false. One of both options will work.
        opts = {
            -- your configuration comes here
            -- for example
            enabled = true,  -- if you want to enable the plugin
            message_template = "<author> • <date> • <summary> • <<sha>>", -- template for the blame message, check the Message template section for more options
            message_when_not_committed = '',
            date_format = "%r [%d-%m-%Y %H:%M:%S]", -- template for the date, check Date format section for more options
            virtual_text_column = 80,  -- virtual text start column, check Start virtual text at column section for more options
        },
    }, 
    {
	'nvim-treesitter/nvim-treesitter',
    },
    { 'neovim/nvim-lspconfig' },
    { 'hrsh7th/cmp-nvim-lsp' },
    { 'hrsh7th/cmp-buffer' },
    { 'hrsh7th/cmp-path' },
    { 'hrsh7th/cmp-cmdline' },
    { 'hrsh7th/nvim-cmp' },
    { 'hrsh7th/cmp-vsnip' },
    { 'hrsh7th/vim-vsnip' },
}

return {
  -- You can also add new plugins here as well:
  -- Add plugins, the lazy syntax
  -- "andweeb/presence.nvim",
  -- {
  --   "ray-x/lsp_signature.nvim",
  --   event = "BufRead",
  --   config = function()
  --     require("lsp_signature").setup()
  --   end,
  -- },
  {
    "goolord/alpha-nvim",
    opts = function(_, opts)
      opts.section.header.val = {
        " ",
        " ",
        " ",
        " ",
        " ██████  ██      ██   ██ ███████",
        "██       ██      ██   ██ ██    ",
        "██   ███ ██      ███████ █████ ",
        "██    ██ ██      ██   ██ ██    ",
        " ██████  ███████ ██   ██ ██    ",
        " ",
        " ",
        " ",
      }
    end,
  },
  {
    "catppuccin/nvim",
    name = "catppuccin",
    lazy = false,
    config = function() require("catppuccin").setup {} end,
  },
  {
    "nvim-treesitter/nvim-treesitter-context",
    lazy = false,
  },
  {
    "axelvc/template-string.nvim",
    lazy = false,
    config = function()
      require("template-string").setup {
        filetypes = {
          "typescript",
          "javascript",
          "javascriptreact",
          "typescriptreact",
          "svelte",
          "vue",
        },
        jsx_brackets = true,
      }
    end,
  },
  { "j-hui/fidget.nvim", lazy = false },
  { "VonHeikemen/searchbox.nvim", lazy = false },
  {
    "nvim-lua/plenary.nvim",
    lazy = false,
  },
  {
    "folke/todo-comments.nvim",
    lazy = false,
    requires = "nvim-lua/plenary.nvim",
    config = function() require("todo-comments").setup {} end,
  },
  { "echasnovski/mini.nvim", branch = "stable", lazy = false },
  {
    "folke/trouble.nvim",
    lazy = false,
    requires = "kyazdani42/nvim-web-devicons",
    config = function() require("trouble").setup {} end,
  },
  {
    "folke/lsp-colors.nvim",
    lazy = false,
  },
  {
    "ggandor/leap.nvim",
    lazy = false,
    requires = "tpope/vim-repeat",
    config = function()
      local l = require "leap"
      l.set_default_keymaps()
    end,
  },
  {
    "kylechui/nvim-surround",
    lazy = false,
    config = function() require("nvim-surround").setup {} end,
  },
  {
    "kosayoda/nvim-lightbulb",
    lazy = false,
    requires = "antoinemadec/FixCursorHold.nvim",
    config = function() require("nvim-lightbulb").setup { autocmd = { enabled = true } } end,
  },
  {
    "windwp/nvim-spectre",
    lazy = false,
    requires = "windwp/nvim-spectre",
  },
  {
    "bkad/CamelCaseMotion",
    lazy = false,
    config = function() vim.api.nvim_set_var("camelcasemotion_key", "<leader>") end,
  },
  {
    "hashivim/vim-terraform",
  },
  {
    "tpope/vim-eunuch",
    lazy = false,
  },
  {
    "kevinhwang91/nvim-ufo",
    requires = "kevinhwang91/promise-async",
    config = function()
      -- vim.o.foldcolumn = "0"
      -- vim.o.foldnestmax = 3
      vim.o.foldlevel = 99 -- Using ufo provider need a large value, feel free to decrease the value
      vim.o.foldlevelstart = 99
      vim.o.foldenable = true

      -- Using ufo provider need remap `zR` and `zM`. If Neovim is 0.6.1, remap yourself
      vim.keymap.set("n", "zR", require("ufo").openAllFolds)
      vim.keymap.set("n", "zM", require("ufo").closeAllFolds)

      local ftMap = {
        vim = "indent",
        python = { "indent" },
        git = "",
      }

      local function customizeSelector(bufnr)
        local function handleFallbackException(err, providerName)
          if type(err) == "string" and err:match "UfoFallbackException" then
            return require("ufo").getFolds(providerName, bufnr)
          else
            return require("promise").reject(err)
          end
        end

        return require("ufo")
          .getFolds("lsp", bufnr)
          :catch(function(err) return handleFallbackException(err, "treesitter") end)
          :catch(function(err) return handleFallbackException(err, "indent") end)
      end

      require("ufo").setup {
        provider_selector = function(bufnr, filetype, buftype) return ftMap[filetype] or customizeSelector end,
      }
    end,
  },
  {
    "mg979/vim-visual-multi",
    lazy = false,
  },
  {
    "numToStr/Comment.nvim",
    config = function() require("Comment").setup() end,
  },
  {
    "nat-418/boole.nvim",
    lazy = false,
    command = "Boole",
    config = function()
      require("boole").setup {
        mappings = {
          increment = "<C-a>",
          decrement = "<C-x>",
        },
      }
    end,
  },
  {
    "zbirenbaum/copilot.lua",
    lazy = false,
    cmd = "Copilot",
    event = "InsertEnter",
    config = function()
      require("copilot").setup {
        panel = {
          enabled = false,
          auto_refresh = false,
          keymap = {
            jump_prev = "[[",
            jump_next = "]]",
            accept = "<CR>",
            refresh = "gr",
            open = "<M-CR>",
          },
          layout = {
            position = "bottom", -- | top | left | right
            ratio = 0.4,
          },
        },
        suggestion = {
          enabled = false,
          auto_trigger = false,
          debounce = 75,
          keymap = {
            accept = "<M-l>",
            accept_word = false,
            accept_line = false,
            next = "<M-]>",
            prev = "<M-[>",
            dismiss = "<C-]>",
          },
        },
        filetypes = {
          yaml = false,
          markdown = false,
          help = false,
          gitcommit = false,
          gitrebase = false,
          hgcommit = false,
          svn = false,
          cvs = false,
          ["."] = false,
        },
        copilot_node_command = "node", -- Node.js version must be > 16.x
        server_opts_overrides = {},
      }
    end,
  },
  {
    "zbirenbaum/copilot-cmp",
    lazy = false,
    after = { "copilot.lua" },
    config = function() require("copilot_cmp").setup() end,
  },
  {
   "kawre/leetcode.nvim",
    lazy = false,
    build = ":TSUpdate html",
    dependencies = {
        "nvim-telescope/telescope.nvim",
        "nvim-lua/plenary.nvim", -- required by telescope
        "MunifTanjim/nui.nvim",

        -- optional
        "nvim-treesitter/nvim-treesitter",
        "rcarriga/nvim-notify",
        "nvim-tree/nvim-web-devicons",
    },
    opts = {
        -- configuration goes here
    },
  }
}

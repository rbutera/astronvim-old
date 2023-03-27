return {
  "jose-elias-alvarez/null-ls.nvim",
  opts = function(_, config)
    -- config variable is the default configuration table for the setup function call
    local null_ls = require "null-ls"

    -- Check supported formatters and linters
    -- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/formatting
    -- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/diagnostics
    config.sources = {
      -- Set a formatter
      -- null_ls.builtins.formatting.stylua,
      -- null_ls.builtins.formatting.prettier,
      null_ls.builtins.formatting.eslint_d,
      null_ls.builtins.code_actions.eslint_d,
      null_ls.builtins.diagnostics.eslint_d,
      null_ls.builtins.diagnostics.luacheck,
      null_ls.builtins.diagnostics.mypy,
      null_ls.builtins.code_actions.shellcheck,
      null_ls.builtins.completion.tags,
      -- null_ls.builtins.formatting.markdownlint,
      null_ls.builtins.formatting.prettier,
      -- null_ls.builtins.formatting.terrafmt,
      null_ls.builtins.formatting.terraform_fmt,
      null_ls.builtins.formatting.gofumpt,
      null_ls.builtins.formatting.shfmt,
      null_ls.builtins.diagnostics.tsc,
      -- null_ls.builtins.formatting.black.with({ extra_args = { "--fast" } }),
      null_ls.builtins.formatting.black,
      null_ls.builtins.formatting.isort,
      null_ls.builtins.formatting.stylua,
      -- null_ls.builtins.diagnostics.pylint,
      -- golang
      null_ls.builtins.formatting.gofumpt,
      null_ls.builtins.formatting.goimports,
      null_ls.builtins.diagnostics.revive,
    }
    return config -- return final config table
  end,
}

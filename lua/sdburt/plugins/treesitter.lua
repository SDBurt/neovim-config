-- treesitter.lua
-- Summary: Sets up and configures Tree-sitter integration in NeoVim, enhancing syntax highlighting, code navigation, and more.
-- This script manages Tree-sitter languages, highlighting rules, and additional text-processing features,
-- leveraging the incremental parsing capabilities to improve the coding experience.

-- Example Tree-sitter configuration
-- require'nvim-treesitter.configs'.setup {
--     highlight = {
--         enable = true, -- Enable Tree-sitter based highlighting
--     },
--     ensure_installed = "all", -- Install all supported languages
--     indent = {
--         enable = true, -- Enable Tree-sitter based indentation
--     },
-- }

-- Note: Tree-sitter languages must be installed and supported by your NeoVim version.


return {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function()
        require("nvim-treesitter.configs").setup({
            -- A list of parser names, or "all"
            ensure_installed = {
                "vimdoc", "javascript", "typescript", "c", "lua", "go",
                "jsdoc", "bash", "html", "css"
            },

            -- Install parsers synchronously (only applied to `ensure_installed`)
            sync_install = false,

            -- Automatically install missing parsers when entering buffer
            -- Recommendation: set to false if you don"t have `tree-sitter` CLI installed locally
            auto_install = true,

            indent = {
                enable = true
            },

            highlight = {
                -- `false` will disable the whole extension
                enable = true,

                -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
                -- Set this to `true` if you depend on "syntax" being enabled (like for indentation).
                -- Using this option may slow down your editor, and you may see some duplicate highlights.
                -- Instead of true it can also be a list of languages
                additional_vim_regex_highlighting = { "markdown" },
            },
        })

        local treesitter_parser_config = require("nvim-treesitter.parsers").get_parser_configs()
        treesitter_parser_config.templ = {
            install_info = {
                url = "https://github.com/vrischmann/tree-sitter-templ.git",
                files = {"src/parser.c", "src/scanner.c"},
                branch = "master",
            },
        }

        vim.treesitter.language.register("templ", "templ")
    end
}

-- LSP
local capabilities = require('cmp_nvim_lsp').default_capabilities(vim.lsp.protocol.make_client_capabilities())
require("mason").setup()
local lspconfig = require("lspconfig")
local function on_attach(client, bufnr)
    vim.keymap.set("n", "<C-f>", vim.lsp.buf.format, { buffer = 0 })
    vim.cmd [[
    highlight! DiagnosticLineNrError guibg=#3b161e guifg=#b01e1e gui=bold
    highlight! DiagnosticLineNrWarn guibg=#3b2f1e guifg=#a16b1d gui=bold
    highlight! DiagnosticLineNrInfo guibg=#1E535D guifg=#1cbaba gui=bold
    highlight! DiagnosticLineNrHint guibg=#1E205D guifg=#195dd1 gui=bold

    sign define DiagnosticSignError text= texthl=DiagnosticSignError linehl= numhl=DiagnosticLineNrError
    sign define DiagnosticSignWarn text= texthl=DiagnosticSignWarn linehl= numhl=DiagnosticLineNrWarn
    sign define DiagnosticSignInfo text= texthl=DiagnosticSignInfo linehl= numhl=DiagnosticLineNrInfo
    sign define DiagnosticSignHint text= texthl=DiagnosticSignHint linehl= numhl=DiagnosticLineNrHint
    ]]
end

lspconfig.rust_analyzer.setup {
    capabilities = capabilities,
    on_attach = on_attach
}
lspconfig.marksman.setup {
    capabilities = capabilities,
    on_attach = on_attach
}
lspconfig.bashls.setup {
    capabilities = capabilities,
    on_attach = on_attach
}
lspconfig.cssls.setup {
    capabilities = capabilities,
    on_attach = on_attach
}
lspconfig.ltex.setup {
    capabilities = capabilities,
    on_attach = on_attach
}
lspconfig.vimls.setup {
    capabilities = capabilities,
    on_attach = on_attach
}
lspconfig.sumneko_lua.setup {
    capabilities = capabilities,
    on_attach = on_attach
}
lspconfig.tsserver.setup {
    capabilities = capabilities,
    on_attach = on_attach
}
lspconfig.html.setup {
    capabilities = capabilities,
    on_attach = on_attach
}
lspconfig.jedi_language_server.setup {
    capabilities = capabilities,
    on_attach = on_attach
}
lspconfig.pylsp.setup {
    capabilities = capabilities,
    on_attach = on_attach
}
lspconfig.jdtls.setup {
    capabilities = capabilities,
    on_attach = on_attach
}
lspconfig.cmake.setup {
    capabilities = capabilities,
    on_attach = on_attach
}
require("clangd_extensions").setup {
    server = {
        capabilities = capabilities,
        on_attach = on_attach,
    },
    extensions = {
        -- defaults:
        -- Automatically set inlay hints (type hints)
        autoSetHints = false,
        -- These apply to the default ClangdSetInlayHints command
        inlay_hints = {
            -- Only show inlay hints for the current line
            only_current_line = false,
            -- Event which triggers a refersh of the inlay hints.
            -- You can make this "CursorMoved" or "CursorMoved,CursorMovedI" but
            -- not that this may cause  higher CPU usage.
            -- This option is only respected when only_current_line and
            -- autoSetHints both are true.
            only_current_line_autocmd = "CursorHold",
            -- whether to show parameter hints with the inlay hints or not
            show_parameter_hints = true,
            -- prefix for parameter hints
            parameter_hints_prefix = "<- ",
            -- prefix for all the other hints (type, chaining)
            other_hints_prefix = "=> ",
            -- whether to align to the length of the longest line in the file
            max_len_align = false,
            -- padding from the left if max_len_align is true
            max_len_align_padding = 1,
            -- whether to align to the extreme right or not
            right_align = true,
            -- padding from the right if right_align is true
            right_align_padding = 0,
            -- The color of the hints
            highlight = "Comment",
            -- The highlight group priority for extmark
            priority = 0,
        },
        ast = {
            role_icons = {
                type = "",
                declaration = "",
                expression = "",
                specifier = "",
                statement = "",
                ["template argument"] = "",
            },
            kind_icons = {
                Compound = "",
                Recovery = "",
                TranslationUnit = "",
                PackExpansion = "",
                TemplateTypeParm = "",
                TemplateTemplateParm = "",
                TemplateParamObject = "",
            },
            highlights = {
                detail = "Comment",
            },
            memory_usage = {
                border = "none",
            },
            symbol_info = {
                border = "none",
            },
        },
    }
}

--  local config = {
--      cmd = { '/usr/local/bin/jdtls' },
--      root_dir = vim.fs.dirname(vim.fs.find({ '.gradlew', '.git', 'mvnw' }, { upward = true })[1]),
--  }
--  require('jdtls').start_or_attach(config)


-- nvim-cmp
vim.opt.completeopt = {
    "menu",
    "menuone",
    "noselect"
}
local has_words_before = function()
    local line, col = unpack(vim.api.nvim_win_get_cursor(0))
    return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
end
local cmp = require("cmp")
cmp.setup({
    snippet = {
        expand = function(args)
            require('luasnip').lsp_expand(args.body)
        end,
    },
    window = {
        -- completion = cmp.config.window.bordered(),
        -- documentation = cmp.config.window.bordered(),
    },
    mapping = cmp.mapping.preset.insert({
        ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
        ["<Tab>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
                cmp.select_next_item()
            elseif luasnip.expand_or_jumpable() then
                luasnip.expand_or_jump()
            elseif has_words_before() then
                cmp.complete()
            else
                fallback()
            end
        end, { "i", "s" }),

        ["<S-Tab>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
                cmp.select_prev_item()
            elseif luasnip.jumpable(-1) then
                luasnip.jump(-1)
            else
                fallback()
            end
        end, { "i", "s" }),
    }),
    sources = cmp.config.sources({
        { name = 'nvim_lsp' },
        { name = 'luasnip' },
        { name = 'path' },
    }, {
        { name = 'buffer' },
    }),
    sorting = {
        comparators = {
            cmp.config.compare.offset,
            cmp.config.compare.exact,
            cmp.config.compare.recently_used,
            require("clangd_extensions.cmp_scores"),
            cmp.config.compare.kind,
            cmp.config.compare.sort_text,
            cmp.config.compare.length,
            cmp.config.compare.order,
        },
    },
})
-- Set configuration for specific filetype.
cmp.setup.filetype('gitcommit', {
    sources = cmp.config.sources({
        { name = 'cmp_git' }, -- You can specify the `cmp_git` source if you were installed it.
    }, {
        { name = 'buffer' },
    })
})

-- Lspsaga
local saga = require('lspsaga')
saga.init_lsp_saga {
    -- Options with default value
    -- "single" | "double" | "rounded" | "bold" | "plus"
    border_style = "rounded",
    --the range of 0 for fully opaque window (disabled) to 100 for fully
    --transparent background. Values between 0-30 are typically most useful.
    saga_winblend = 10,
    -- when cursor in saga window you config these to move
    move_in_saga = { prev = '<C-p>', next = '<C-n>' },
    -- Error, Warn, Info, Hint
    -- use emoji like
    -- { "🙀", "😿", "😾", "😺" }
    -- or
    -- { "😡", "😥", "😤", "😐" }
    -- and diagnostic_header can be a function type
    -- must return a string and when diagnostic_header
    -- is function type it will have a param `entry`
    -- entry is a table type has these filed
    -- { bufnr, code, col, end_col, end_lnum, lnum, message, severity, source }
    diagnostic_header = { " ", " ", " ", "ﴞ " },
    -- preview lines of lsp_finder and definition preview
    max_preview_lines = 10,
    -- use emoji lightbulb in default
    code_action_icon = "💡",
    -- if true can press number to execute the codeaction in codeaction window
    code_action_num_shortcut = true,
    -- same as nvim-lightbulb but async
    code_action_lightbulb = {
        enable = false,
        enable_in_insert = false,
        cache_code_action = true,
        sign = true,
        update_time = 150,
        sign_priority = 20,
        virtual_text = true,
    },
    -- finder icons
    finder_icons = {
        def = '  ',
        ref = '🔭 ',
        link = '  ',
    },
    -- finder do lsp request timeout
    -- if your project big enough or your server very slow
    -- you may need to increase this value
    finder_request_timeout = 3000,
    finder_action_keys = {
        open = "<CR>",
        vsplit = "s",
        split = "i",
        tabe = "t",
        quit = "q",
    },
    code_action_keys = {
        quit = "q",
        exec = "<CR>",
    },
    definition_action_keys = {
        edit = '<C-c>o',
        vsplit = '<C-c>v',
        split = '<C-c>i',
        tabe = '<C-c>t',
        quit = 'q',
    },
    rename_action_quit = "<C-c>",
    rename_in_select = true,
    -- show symbols in winbar must nightly
    -- in_custom mean use lspsaga api to get symbols
    -- and set it to your custom winbar or some winbar plugins.
    -- if in_cusomt = true you must set in_enable to false
    symbol_in_winbar = {
        in_custom = false,
        enable = true,
        separator = ' ',
        show_file = true,
        -- define how to customize filename, eg: %:., %
        -- if not set, use default value `%:t`
        -- more information see `vim.fn.expand` or `expand`
        -- ## only valid after set `show_file = true`
        file_formatter = "",
        click_support = false,
    },
    -- show outline
    show_outline = {
        win_position = 'right',
        --set special filetype win that outline window split.like NvimTree neotree
        -- defx, db_ui
        win_with = '',
        win_width = 30,
        auto_enter = true,
        auto_preview = true,
        virt_text = '┃',
        jump_key = 'o',
        -- auto refresh when change buffer
        auto_refresh = true,
    },
    -- custom lsp kind
    -- usage { Field = 'color code'} or {Field = {your icon, your color code}}
    custom_kind = {},
    -- if you don't use nvim-lspconfig you must pass your server name and
    -- the related filetypes into this table
    -- like server_filetype_map = { metals = { "sbt", "scala" } }
    server_filetype_map = {},
}

local opts = { noremap = true, silent = true }
vim.keymap.set('n', '<leader>df', '<Cmd>Lspsaga diagnostic_jump_next<cr>', opts)
vim.keymap.set('n', '<leader>dp', '<Cmd>Lspsaga diagnostic_jump_prev<cr>', opts)
vim.keymap.set('n', 'K', '<Cmd>Lspsaga hover_doc<cr>', opts)
vim.keymap.set('n', 'gd', '<Cmd>Lspsaga lsp_finder<cr>', opts)
vim.keymap.set('n', '<leader>rn', '<Cmd>Lspsaga rename<cr>', opts)
vim.keymap.set("n", "<leader>ca", "<cmd>Lspsaga code_action<CR>", opts)
vim.keymap.set("v", "<leader>ca", "<cmd><C-U>Lspsaga range_code_action<CR>", opts)

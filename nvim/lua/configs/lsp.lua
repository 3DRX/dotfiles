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

lspconfig.jdtls.setup {
    capabilities = capabilities,
    on_attach = on_attach
}
lspconfig.astro.setup {
    capabilities = capabilities,
    on_attach = on_attach,
    cmd = {
        "astro-ls",
        "--stdio"
    },
    filetypes = {
        "astro"
    },
    init_options = {
        typescript = {
        }
    }
}
lspconfig.jsonls.setup {
    capabilities = capabilities,
    on_attach = on_attach
}
lspconfig.metals.setup {
    capabilities = capabilities,
    on_attach = on_attach
}
lspconfig.sqlls.setup {
    capabilities = capabilities,
    on_attach = on_attach
}
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
lspconfig.lua_ls.setup {
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
lspconfig.cmake.setup {
    capabilities = capabilities,
    on_attach = on_attach
}

local clangd_capabilities = capabilities
clangd_capabilities.textDocument.semanticHighlighting = true
clangd_capabilities.offsetEncoding = "utf-8"

require("clangd_extensions").setup {
    server = {
        capabilities = clangd_capabilities,
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
            elseif has_words_before() then
                cmp.complete()
            else
                fallback()
            end
        end, { "i", "s" }),
        ["<S-Tab>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
                cmp.select_prev_item()
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
require('lspsaga').setup({
    lightbulb = {
        enable = false,
        enable_in_insert = false,
        sign = true,
        sign_priority = 40,
        virtual_text = true,
    },
    ui = {
        theme = 'round',
        -- this option only work in neovim 0.9
        title = true,
        -- border type can be single,double,rounded,solid,shadow.
        border = 'rounded',
        winblend = 0,
        expand = '',
        collapse = '',
        preview = ' ',
        code_action = '💡',
        diagnostic = '🐞',
        incoming = ' ',
        outgoing = ' ',
        colors = {
            --float window normal background color
            normal_bg = '#1d1536',
            --title background color
            title_bg = '#afd700',
            red = '#e95678',
            magenta = '#b33076',
            orange = '#FF8700',
            yellow = '#f7bb3b',
            green = '#afd700',
            cyan = '#36d0e0',
            blue = '#61afef',
            purple = '#CBA6F7',
            white = '#d1d4cf',
            black = '#1c1c19',
        },
        kind = {},
    },
    outline = {
        win_position = "right",
        win_with = "",
        win_width = 30,
        preview_width = 0.4,
        show_detail = true,
        auto_preview = true,
        auto_refresh = true,
        auto_close = true,
        custom_sort = nil,
        keys = {
            expand_or_jump = '<CR>',
            quit = "q",
        },
    },
    finder = {
        max_height = 0.5,
        min_width = 30,
        force_max_height = false,
        keys = {
            jump_to = 'p',
            expand_or_jump = '<CR>',
            vsplit = 's',
            split = 'i',
            tabe = 't',
            tabnew = 'r',
            quit = { 'q', '<ESC>' },
            close_in_preview = '<ESC>',
        },
    },
})

local opts = { noremap = true, silent = true }
vim.keymap.set('n', '<leader>df', '<Cmd>Lspsaga diagnostic_jump_next<cr>', opts)
vim.keymap.set('n', '<leader>dp', '<Cmd>Lspsaga diagnostic_jump_prev<cr>', opts)
vim.keymap.set('n', 'K', '<Cmd>Lspsaga hover_doc<cr>', opts)
vim.keymap.set('n', 'gd', '<Cmd>Lspsaga lsp_finder<cr>', opts)
vim.keymap.set('n', '<leader>rn', '<Cmd>Lspsaga rename<cr>', opts)
vim.keymap.set("n", "<leader>ca", "<cmd>Lspsaga code_action<CR>", opts)
vim.keymap.set("v", "<leader>ca", "<cmd><C-U>Lspsaga range_code_action<CR>", opts)
vim.keymap.set("n", "<leader>ic", "<cmd>Lspsaga incoming_calls<CR>", opts)
vim.keymap.set("n", "<leader>oc", "<cmd>Lspsaga outgoing_calls<CR>", opts)
vim.keymap.set("n", "<leader>ot", "<cmd>Lspsaga outline<CR>", opts)

require('copilot').setup({
    panel = {
        enabled = true,
        auto_refresh = true,
        keymap = {
            jump_prev = "[[",
            jump_next = "]]",
            accept = "<CR>",
            refresh = "gr",
            open = "<M-CR>"
        },
        layout = {
            position = "right", -- | top | left | right
            ratio = 0.4
        },
    },
    suggestion = {
        enabled = true,
        auto_trigger = false,
        debounce = 75,
        keymap = {
            accept = "<Right>",
            accept_word = false,
            accept_line = false,
            next = "<M-Up>",
            prev = "<M-Down>",
            dismiss = "<M-c>",
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
    server_opts_overrides = {
        enabled = false
    },
    copilot_node_command = "/home/kjy/.nvm/versions/node/v16.20.1/bin/node",
})

-- require("copilot").setup({
--     suggestion = { enabled = false },
--     panel = { enabled = false },
-- })

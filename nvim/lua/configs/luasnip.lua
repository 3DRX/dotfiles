-- Luasnip
local ls = require("luasnip")
-- key map
vim.keymap.set({ "i", "s" }, "<C-\">", function()
    if ls.expand_or_jumpable() then
        ls.expand_or_jump()
    end
end, { silent = true })
vim.keymap.set({ "i", "s" }, "<C-;>", function()
    if ls.jumpable(-1) then
        ls.jump(-1)
    end
end, { silent = true })
-- snippets
local snip = ls.snippet
local text = ls.text_node
local insert = ls.insert_node
local func = ls.function_node
local date = function() return { os.date('%Y-%m-%d') } end
ls.add_snippets(nil, {
    all = {
        snip({
            trig = "date",
            namr = "Date",
            dscr = "Date in the form of YYYY-MM-DD",
        }, {
            func(date, {}),
        }),
        snip({
                trig = "meta",
                namr = "Metadata",
                dscr = "Yaml metadata format for markdown"
            },
            {
                text({ "---",
                    "title: " }), insert(1, "note_title"), text({ "",
                "author: " }), insert(2, "author"), text({ "",
                "date: " }), func(date, {}), text({ "",
                "categories: [" }), insert(3, ""), text({ "]",
                "lastmod: " }), func(date, {}), text({ "",
                "tags: [" }), insert(4), text({ "]",
                "comments: true",
                "---", "" }),
                insert(0)
            }),
    },
})

require("luasnip.loaders.from_vscode").lazy_load()

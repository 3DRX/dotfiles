vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
vim.opt.termguicolors = true

require("nvim-tree").setup({
    sort_by = "name",
    hijack_unnamed_buffer_when_opening = true,
    renderer = {
        group_empty = true,
    },
    filters = {
        dotfiles = true,
    },
    actions = {
        open_file = {
            quit_on_open = true,
        },
    }
})

vim.keymap.set("n", "<C-b>", ":NvimTreeToggle<CR>", {silent = true})

local function open_nvim_tree(data)
    -- buffer is a [No Name]
    local no_name = data.file == "" and vim.bo[data.buf].buftype == ""
    -- buffer is a directory
    local directory = vim.fn.isdirectory(data.file) == 1
    if not no_name and not directory then
        return
    end
    -- change to the directory
    if directory then
        vim.cmd.cd(data.file)
    end
    -- open the tree
    require("nvim-tree.api").tree.open()
end

vim.api.nvim_create_autocmd({ "VimEnter" }, { callback = open_nvim_tree })

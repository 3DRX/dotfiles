vim.filetype.add({ extension = { mdx = "mdx" } })
vim.treesitter.language.register("markdown", "mdx")

vim.treesitter.query.set(
	"markdown",
	"injections",
	[[
(fenced_code_block
  (info_string
    (language) @injection.language)
  (code_fence_content) @injection.content)

((html_block) @injection.content
  (#set! injection.language "html")
  (#set! injection.combined)
  (#set! injection.include-children))

((minus_metadata) @injection.content
  (#set! injection.language "yaml")
  (#offset! @injection.content 1 0 -1 0)
  (#set! injection.include-children))

((plus_metadata) @injection.content
  (#set! injection.language "toml")
  (#offset! @injection.content 1 0 -1 0)
  (#set! injection.include-children))

([
  (inline)
  (pipe_table_cell)
] @injection.content
  (#set! injection.language "markdown_inline"))

((inline) @injection.content
  (#lua-match? @injection.content "^%s*import")
  (#set! injection.language "typescript"))

((inline) @injection.content
  (#lua-match? @injection.content "^%s*export")
  (#set! injection.language "typescriptreact"))

((inline) @injection.content
  (#lua-match? @injection.content "^<")
  (#set! injection.language "typescriptreact"))

((indented_code_block) @injection.content
  (#lua-match? @injection.content "^%s*<")
  (#set! injection.language "typescriptreact")
  (#set! injection.include-children))

((html_block) @injection.content
  (#set! injection.language "typescriptreact")
  (#set! injection.include-children))
]]
)

require("render-markdown").setup({
	latex = { enabled = false },
})

require("avante").setup({
	---@alias Provider "claude" | "openai" | "azure" | "gemini" | "cohere" | "copilot" | string
	provider = "copilot", -- 在 Aider 模式或 Cursor 规划模式的规划阶段使用的提供者
	-- 警告：由于自动建议是高频操作，因此成本较高，
	-- 目前将其指定为 `copilot` 提供者是危险的，因为：https://github.com/yetone/avante.nvim/issues/1048
	-- 当然，您可以通过增加 `suggestion.debounce` 来减少请求频率。
	auto_suggestions_provider = "claude",
	providers = {
		claude = {
			endpoint = "https://api.anthropic.com",
			model = "claude-3-5-sonnet-20241022",
			extra_request_body = {
				temperature = 0.75,
				max_tokens = 4096,
			},
		},
	},
	---指定特殊的 dual_boost 模式
	---1. enabled: 是否启用 dual_boost 模式。默认为 false。
	---2. first_provider: 第一个提供者用于生成响应。默认为 "openai"。
	---3. second_provider: 第二个提供者用于生成响应。默认为 "claude"。
	---4. prompt: 用于根据两个参考输出生成响应的提示。
	---5. timeout: 超时时间（毫秒）。默认为 60000。
	---工作原理：
	--- 启用 dual_boost 后，avante 将分别从 first_provider 和 second_provider 生成两个响应。然后使用 first_provider 的响应作为 provider1_output，second_provider 的响应作为 provider2_output。最后，avante 将根据提示和两个参考输出生成响应，默认提供者与正常情况相同。
	---注意：这是一个实验性功能，可能无法按预期工作。
	dual_boost = {
		enabled = false,
		first_provider = "openai",
		second_provider = "claude",
		prompt = "根据以下两个参考输出，生成一个结合两者元素但反映您自己判断和独特视角的响应。不要提供任何解释，只需直接给出响应。参考输出 1: [{{provider1_output}}], 参考输出 2: [{{provider2_output}}]",
		timeout = 60000, -- 超时时间（毫秒）
	},
	behaviour = {
		auto_suggestions = false, -- 实验阶段
		auto_set_highlight_group = true,
		auto_set_keymaps = true,
		auto_apply_diff_after_generation = false,
		support_paste_from_clipboard = false,
		minimize_diff = true, -- 是否在应用代码块时删除未更改的行
		enable_token_counting = true, -- 是否启用令牌计数。默认为 true。
		enable_cursor_planning_mode = false, -- 是否启用 Cursor 规划模式。默认为 false。
		enable_claude_text_editor_tool_mode = false, -- 是否启用 Claude 文本编辑器工具模式。
	},
	mappings = {
		--- @class AvanteConflictMappings
		diff = {
			ours = "co",
			theirs = "ct",
			all_theirs = "ca",
			both = "cb",
			cursor = "cc",
			next = "]x",
			prev = "[x",
		},
		suggestion = {
			accept = "<M-l>",
			next = "<M-]>",
			prev = "<M-[>",
			dismiss = "<C-]>",
		},
		jump = {
			next = "]]",
			prev = "[[",
		},
		submit = {
			normal = "<CR>",
			insert = "<C-s>",
		},
		cancel = {
			normal = { "<C-c>", "<Esc>", "q" },
			insert = { "<C-c>" },
		},
		sidebar = {
			apply_all = "A",
			apply_cursor = "a",
			retry_user_request = "r",
			edit_user_request = "e",
			switch_windows = "<Tab>",
			reverse_switch_windows = "<S-Tab>",
			remove_file = "d",
			add_file = "@",
			close = { "<Esc>", "q" },
			close_from_input = nil, -- 例如，{ normal = "<Esc>", insert = "<C-d>" }
		},
	},
	hints = { enabled = true },
	windows = {
		---@type "right" | "left" | "top" | "bottom"
		position = "right", -- 侧边栏的位置
		wrap = true, -- 类似于 vim.o.wrap
		width = 30, -- 默认基于可用宽度的百分比
		sidebar_header = {
			enabled = true, -- true, false 启用/禁用标题
			align = "center", -- left, center, right 用于标题
			rounded = true,
		},
		input = {
			prefix = "> ",
			height = 8, -- 垂直布局中输入窗口的高度
		},
		edit = {
			border = "rounded",
			start_insert = true, -- 打开编辑窗口时开始插入模式
		},
		ask = {
			floating = false, -- 在浮动窗口中打开 'AvanteAsk' 提示
			start_insert = true, -- 打开询问窗口时开始插入模式
			border = "rounded",
			---@type "ours" | "theirs"
			focus_on_apply = "ours", -- 应用后聚焦的差异
		},
	},
	highlights = {
		---@type AvanteConflictHighlights
		diff = {
			current = "DiffText",
			incoming = "DiffAdd",
		},
	},
	--- @class AvanteConflictUserConfig
	diff = {
		autojump = true,
		---@type string | fun(): any
		list_opener = "copen",
		--- 覆盖悬停在差异上时的 'timeoutlen' 设置（请参阅 :help timeoutlen）。
		--- 有助于避免进入以 `c` 开头的差异映射的操作员挂起模式。
		--- 通过设置为 -1 禁用。
		override_timeoutlen = 500,
	},
	suggestion = {
		debounce = 600,
		throttle = 600,
	},
})

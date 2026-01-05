require("full-border"):setup {
	-- Available values: ui.Border.PLAIN, ui.Border.ROUNDED
	type = ui.Border.PLAIN,
}

th.git = th.git or {}
th.git.deleted_sign = "D"
th.git.modified_sign = "M"
th.git.added_sign = "A"
th.git.updated_sign = "U"
th.git.untracked_sign = "?"
th.git.ignored_sign = "X"
require("git"):setup({})

require("recycle-bin"):setup()

require("bookmarks"):setup({
	persist = "all",
})

require("yaziline"):setup({
	separator_style = "liney", -- "angly" | "curvy" | "liney" | "empty"
	select_symbol = "",
	yank_symbol = "󰆐",
})

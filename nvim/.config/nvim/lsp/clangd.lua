return {
	cmd = {
		"clangd",
	},
	filetypes = {
		"c",
                "cpp",
	},
	root_markers = {
		".git",
                {"Makefile", "CMakeList.txt"},
	},

	single_file_support = true,
	log_level = vim.lsp.protocol.MessageType.Warning,
}

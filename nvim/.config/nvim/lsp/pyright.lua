return {
	cmd = {
            "pyright-langserver", "--stdio"
	},
	filetypes = {
		"python",
	},

	single_file_support = true,
	log_level = vim.lsp.protocol.MessageType.Warning,
}

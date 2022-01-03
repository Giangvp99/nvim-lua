return {
	root_dir = function()
		return vim.fn.getcwd()
	end,
	setting = {
		haskell = {
			rootPatterns = { "*.cabal", "stack.yaml", "cabal.project", "package.yaml", "hie.yaml" },
		},
	},
}

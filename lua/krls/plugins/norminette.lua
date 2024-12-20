return {
		'vim-syntastic/syntastic',
		'alexandregv/norminette-vim',
		config = function()
			require("krls.plugins.config.norminette_config")
		end
}

local utils = {}

function utils.map(mode, key_combination, command, options)
	local default_options = {noremap = true, silent = true}; -- All mappings are non-recursive and silent by default
	vim.api.nvim_set_keymap(
    mode,
    key_combination,
    command,
    vim.tbl_extend('force', default_options, options or {})
  );
end

return utils;

local keymap = require("user.utils").map

-- blame and status keymaps
keymap("n", "<Leader>gb", ":Git blame")
keymap("n", "<Leader>gs", ":Git status")

local map = require("user.helpers").leader_map
local go = require("go")

map("xtf", "<cmd>GoTestFile<cr>", "Test File")
map("x.", "<cmd>GoCodeAction<cr>", "Code Actions")


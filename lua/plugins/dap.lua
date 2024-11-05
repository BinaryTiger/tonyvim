local map = require("user.helpers").leader_map


map("dc", "<cmd>lua require'dap'.repl.open()<cr>", "REPL")
map("di", "<cmd>lua require'dap'.step_over()<cr>", "Step Into")
map("dn", "<cmd>lua require'dap'.step_over()<cr>", "Step Over/Next")
map("dr", "<cmd>lua require'dap'.continue()<cr>", "Execute")
map("dt", "<cmd>lua require'dap'.toggle_breakpoint()<cr>", "Toggle Breakpoint")

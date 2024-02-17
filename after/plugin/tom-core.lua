local cmd = vim.cmd

-- Vim Commands to execute after core configuration executes, and plugins load.
cmd.DoMatchParen()  -- Highlight matching parenthesis as you browse or type. NoMatchParen()

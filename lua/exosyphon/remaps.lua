local wk = require("which-key")

wk.add({"<leader>/", hidden = true})
wk.add({"<leader>?", hidden = true})

-- Oil
vim.keymap.set("n", "-", "<CMD>Oil --float<CR>", { desc = "Open parent directory" })

-- Jump between markdown headers
vim.keymap.set("n", "gj", [[/^##\+ .*<CR>]], { buffer = true, silent = true })
vim.keymap.set("n", "gk", [[?^##\+ .*<CR>]], { buffer = true, silent = true })

-- Exit insert mode without hitting Esc
vim.keymap.set("i", "jj", "<Esc>", { desc = "Esc" })

-- Make Y behave like C or D
vim.keymap.set("n", "Y", "y$")

-- Select all
vim.keymap.set("n", "==", "gg<S-v>G")

vim.keymap.set("n", "<leader>l", "<nop>", {desc = "LSP"})
vim.keymap.set("n", "<leader>lc", "<nop>", {desc = "Code Actions"})
vim.keymap.set("n", "<leader>lp", "<nop>", {desc = "Parameter swap"})
vim.keymap.set("n", "<leader>f", "<nop>", {desc = "Telescope"})
vim.keymap.set("n", "<leader>fm", "<cmd>Telescope harpoon marks<CR>", {desc = "Telescope"})

-- Keep window centered when going up/down
vim.keymap.set("n", "J", "mzJ`z")
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

-- Close buffer without closing split
-- vim.keymap.set("n", "<leader>w", "<cmd>bp|bd #<CR>", { desc = "Close Buffer; Retain Split" })

-- Navigate between quickfix items
wk.add(({"<leader>q", group = "QuickFix"}))
vim.keymap.set("n", "<leader>qq", "<cmd>cnext<CR>zz", { desc = "Forward qfixlist" })
vim.keymap.set("n", "<leader>qw", "<cmd>cprev<CR>zz", { desc = "Backward qfixlist" })

-- Replace word under cursor across entire buffer
vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]],
  { desc = "Replace word under cursor" })

-- Debug Tests
wk.add(({"<leader>d", group = "Debug"}))
vim.keymap.set("n", "<leader>dc", "<cmd>DapContinue<CR>", { desc = "Start Debugging" })
vim.keymap.set("n", "<leader>dso", "<cmd>DapStepOver<CR>", { desc = "Step Over" })
vim.keymap.set("n", "<leader>dsi", "<cmd>DapStepInto<CR>", { desc = "Step Into" })
vim.keymap.set("n", "<leader>dsu", "<cmd>DapStepOut<CR>", { desc = "Step Out" })
vim.keymap.set("n", "<leader>dst", "<cmd>DapStepTerminate<CR>", { desc = "Stop Debugger" })
vim.keymap.set("n", "<leader>da", "<cmd>lua require'dap'.toggle_breakpoint()<CR>", { desc = "Toggle Breakpoint" })
vim.keymap.set("n", "<leader>dA", "<cmd>lua require'dap'.set_breakpoint(vim.fn.input('Breakpoint condition: '))<CR>",
  { desc = "Toggle Breakpoint Condition" })
vim.keymap.set("n", "<leader>dE", "<cmd>lua require'dap'.set_exception_breakpoints()<CR>",
  { desc = "Toggle Exception Breakpoint" })
vim.keymap.set("n", "<leader>dr",
  "<cmd>lua require'dapui'.float_element('repl', { width = 100, height = 40, enter = true })<CR>",
  { desc = "Show DAP REPL" })
vim.keymap.set("n", "<leader>ds",
  "<cmd>lua require'dapui'.float_element('scopes', { width = 150, height = 50, enter = true })<CR>",
  { desc = "Show DAP Scopes" })
vim.keymap.set("n", "<leader>df",
  "<cmd>lua require'dapui'.float_element('stacks', { width = 150, height = 50, enter = true })<CR>",
  { desc = "Show DAP Stacks" })
vim.keymap.set("n", "<leader>db", "<cmd>lua require'dapui'.float_element('breakpoints', { enter = true })<CR>",
  { desc = "Show DAP breakpoints" })
vim.keymap.set("n", "<leader>do", "<cmd>lua require'dapui'.toggle()<CR>", { desc = "Toggle DAP UI" })
vim.keymap.set("n", "<leader>dl", "<cmd>lua require'dap'.run_last()<CR>", { desc = "Debug Last Test" })

-- Copy file paths
vim.keymap.set("n", "<leader>c", "<nop>", {desc = "Copy File Info"})
vim.keymap.set("n", "<leader>h", "<nop>", {desc = "Git Hunk"})
vim.keymap.set("n", "<leader>g", "<nop>", {desc = "Git"})
vim.keymap.set("n", "<leader>cf", "<cmd>let @+ = expand(\"%\")<CR>", { desc = "Copy File Name" })
vim.keymap.set("n", "<leader>cp", "<cmd>let @+ = expand(\"%:p\")<CR>", { desc = "Copy File Path" })

-- Dismiss Noice Message
vim.keymap.set("n", "<leader>nd", "<cmd>NoiceDismiss<CR>", {desc = "Dismiss Noice Message"})
vim.keymap.set("n", "<C-S-Up>", ":resize -2<CR>", { desc = "Resize Horizontal Split Up" })
vim.keymap.set("n", "<C-Left>", ":vertical resize -2<CR>", { desc = "Resize Vertical Split Down" })
vim.keymap.set("n", "<C-Right>", ":vertical resize +2<CR>", { desc = "Resize Vertical Split Up" })


-- Visual --
-- Stay in indent mode
vim.keymap.set("v", "<", "<gv")
vim.keymap.set("v", ">", ">gv")

vim.keymap.set({"n", "o", "x"}, "<s-h>", "^", { desc = "Jump to beginning of line" })
vim.keymap.set({"n", "o", "x"}, "<s-l>", "g_", { desc = "Jump to end of line" })

-- Move block
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv", { desc = "Move Block Down" })
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv", { desc = "Move Block Up" })

-- Search for highlighted text in buffer
vim.keymap.set("v", "//", 'y/<C-R>"<CR>', { desc = "Search for highlighted text" })

-- Exit terminal mode shortcut
vim.keymap.set("t", "<C-t>", "<C-\\><C-n>")

-- Autocommands
vim.api.nvim_create_augroup("custom_buffer", { clear = true })

-- start terminal in insert mode
vim.api.nvim_create_autocmd("TermOpen", {
  desc = "Auto enter insert mode when opening a terminal",
  group = "custom_buffer",
  pattern = "*",
  callback = function()
    -- Wait briefly just in case we immediately switch out of the buffer (e.g. Neotest)
    vim.defer_fn(function()
      if vim.api.nvim_buf_get_option(0, 'buftype') == 'terminal' then
        vim.cmd([[startinsert]])
      end
    end, 100)
  end,
})

local function toggleNvimTreeWithoutFocus()
  local tree = require('nvim-tree.api').tree;
  tree.toggle({focus = false});
end

-- highlight yanks
vim.api.nvim_create_autocmd("TextYankPost", {
  group    = "custom_buffer",
  pattern  = "*",
  callback = function() vim.highlight.on_yank { timeout = 200 } end
})

vim.api.nvim_create_autocmd({'BufEnter', 'QuitPre'}, {
  nested = false,
  callback = function(e)
    local tree = require('nvim-tree.api').tree

    -- Nothing to do if tree is not opened
    if not tree.is_visible() then
      return
    end

    -- How many focusable windows do we have? (excluding e.g. incline status window)
    local winCount = 0
    for _,winId in ipairs(vim.api.nvim_list_wins()) do
      if vim.api.nvim_win_get_config(winId).focusable then
        winCount = winCount + 1
      end
    end

    -- We want to quit and only one window besides tree is left
    if e.event == 'QuitPre' and winCount == 2 then
      vim.api.nvim_cmd({cmd = 'qall'}, {})
    end

    -- :bd was probably issued an only tree window is left
    -- Behave as if tree was closed (see `:h :bd`)
    if e.event == 'BufEnter' and winCount == 1 then
      -- Required to avoid "Vim:E444: Cannot close last window"
      vim.defer_fn(function()
        -- close nvim-tree: will go to the last buffer used before closing
        tree.toggle({find_file = true, focus = true})
        -- re-open nivm-tree
        tree.toggle({find_file = true, focus = false})
      end, 10)
    end
  end
})

-- Neotree
wk.add({"<leader>e", group = "File explorer"})
vim.keymap.set("n", "<leader>E", toggleNvimTreeWithoutFocus, {desc = "Show NvimTree"})
wk.add({"<leader>ee", proxy="<leader>e", group = "File explorer", desc = "Focus NvimTree"})
wk.add({"<leader>e", hidden = true})
vim.keymap.set("n", "<leader>e", "<cmd>NvimTreeFindFile<CR>", {desc = "Focus current file in NvimTree"})


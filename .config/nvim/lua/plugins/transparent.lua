return {
  "xiyaowong/transparent.nvim",
  config = function()
    require("transparent").setup({
      groups = {
        "Normal", "NormalNC", "Comment", "Constant", "Special", "Identifier",
        "Statement", "PreProc", "Type", "Underlined", "Todo", "String", "Function",
        "Conditional", "Repeat", "Operator", "Structure", "LineNr", "NonText",
        "SignColumn", "CursorLine", "CursorLineNr", "StatusLine", "StatusLineNC",
        "EndOfBuffer", "NormalFloat", "NeoTreeNormal",
      },
    })

    require("transparent").clear_prefix("NeoTree")
  end,
}

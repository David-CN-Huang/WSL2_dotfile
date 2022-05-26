if not vim.g.vscode then
    require("mycode")
    print("Boot start from \"mycode\".")
else
    require("vscode")
    print("Boot start from \"vscode\".")
end


vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.expandtab = true
vim.opt.shiftwidth = 2
vim.opt.tabstop = 2


vim.api.nvim_create_autocmd("FileType",
{
	pattern = "nix",
	callback = function ()
    vim.lsp.start ({
		   name = "nil",
		   cmd = { "nil" },
		   root_dir = vim.fs.dirname(vim.fs.find
		   ({ "flake.nix", ".git" },
		   { upward = true })[1]),
           })
		   end,
		   })
local cache_dir = os.getenv('HOME') .. '/.cache/nvim/'

vim.g.mapleader = ' '
vim.g.themes = {}
vim.g.copilot_filetypes = {
  ["markdown"] = true,
}
vim.opt.autoindent        = true;
vim.opt.breakindentopt    = 'shift:2,min:20';
vim.opt.clipboard         = 'unnamedplus';
vim.opt.cmdheight         = 2;
vim.opt.complete          = '.,w,b';
vim.opt.cursorline        = true;
vim.opt.diffopt           = 'filler,iwhite,internal';
vim.opt.directory         = cache_dir .. 'swap/';
vim.opt.expandtab         = true;
vim.opt.foldlevelstart    = 99;
vim.opt.formatoptions     = '';
vim.opt.grepprg           = 'rg --hidden --vimgrep --smart-case --';
vim.opt.infercase         = true;
vim.opt.jumpoptions       = 'stack';
vim.opt.list              = true;
vim.opt.listchars         = 'tab:»·,nbsp:+,trail:·,extends:→,precedes:←';
vim.opt.number            = true;
vim.opt.pumblend          = 10;
vim.opt.redrawtime        = 500;
vim.opt.relativenumber    = true;
vim.opt.ruler             = false;
vim.opt.scrolloff         = 2;
vim.opt.shada             = "!,'300,<50,@100,s10,h,%";
vim.opt.shiftround        = true;
vim.opt.shiftwidth        = 2;
vim.opt.shortmess         = "filnxtToOFI";
vim.opt.showbreak         = '↳  ';
vim.opt.showmode          = false;
vim.opt.smartcase         = true;
vim.opt.softtabstop       = 2;
vim.opt.spellfile         = cache_dir .. 'spell/en.uft-8.add';
vim.opt.swapfile          = false;
vim.opt.tabstop           = 4;
vim.opt.termguicolors     = true;
vim.opt.timeoutlen        = 500;
vim.opt.undodir           = cache_dir .. 'undo/';
vim.opt.undofile          = true;
vim.opt.viewdir           = cache_dir .. 'view/';
vim.opt.wildignore        = '.git,.hg,.svn,*.pyc,*.o,*.out,*.jpg,*.jpeg,*.png,*.gif,*.zip,**/tmp/**,*.DS_Store,**/node_modules/**,**/bower_modules/**';
vim.opt.wildignorecase    = true;
vim.opt.winblend          = 16;
vim.opt.wrap              = false;
vim.opt.writebackup       = false;

vim.diagnostic.config({ virtual_text = true, severity_sort = true })

-- Clobber so I don't get comment continuation
vim.api.nvim_create_autocmd("FileType", {
  pattern = "*",
  callback = function()
    vim.opt_local.formatoptions:remove("c")
    vim.opt_local.formatoptions:remove("r")
  end,
})

local cache_dir = os.getenv('HOME') .. '/.cache/nvim/'
local vim = vim

vim.g.mapleader           = ' '
--vim.g.copilot_assume_mapped = true
vim.g.copilot_filetypes = {
    ["*"] = false,
    ["c"] = true,
    ["c#"] = true,
    ["c++"] = true,
    ["go"] = true,
    ["javascript"] = true,
    ["lua"] = false,
    ["markdown"] = true,
    ["python"] = true,
    ["rust"] = true,
    ["typescript"] = true,
  }
vim.opt.autoindent        = true;
vim.opt.backspace         = 'indent,eol,start';
vim.opt.backup            = false;
vim.opt.backupdir         = cache_dir .. 'backup/';
vim.opt.backupskip        = '/tmp/*,$TMPDIR/*,$TMP/*,$TEMP/*,*/shm/*,/private/var/*,.vault.vim';
vim.opt.breakat           = [[\ \	;:,!?]];
vim.opt.breakindentopt    = 'shift:2,min:20';
vim.opt.clipboard         = 'unnamedplus';
vim.opt.cmdheight         = 2;
vim.opt.cmdwinheight      = 5;
vim.opt.colorcolumn       = '80';
vim.opt.complete          = '.,w,b,k';
vim.opt.completeopt       = 'longest,menu,menuone';
vim.opt.concealcursor     = 'niv';
vim.opt.conceallevel      = 0;
vim.opt.diffopt           = 'filler,iwhite,internal,algorithm:patience';
vim.opt.directory         = cache_dir .. 'swag/';
vim.opt.display           = 'lastline';
vim.opt.encoding          = 'utf-8';
vim.opt.equalalways       = false;
vim.opt.errorbells        = true;
vim.opt.expandtab         = true;
vim.opt.fileformats       = 'unix,mac,dos';
vim.opt.foldenable        = true;
vim.opt.foldlevelstart    = 99;
vim.opt.formatoptions     = '1jcroql';
vim.opt.grepformat        = '%f:%l:%c:%m';
vim.opt.grepprg           = 'rg --hidden --vimgrep --smart-case --';
vim.opt.helpheight        = 12;
vim.opt.hidden            = true;
vim.opt.history           = 2000;
vim.opt.ignorecase        = true;
vim.opt.inccommand        = 'nosplit';
vim.opt.incsearch         = true;
vim.opt.infercase         = true;
vim.opt.jumpoptions       = 'stack';
vim.opt.laststatus        = 2;
vim.opt.linebreak         = false;
vim.opt.list              = true;
vim.opt.listchars         = 'tab:»·,nbsp:+,trail:·,extends:→,precedes:←';
vim.opt.magic             = true;
vim.opt.mouse             = 'nv';
vim.opt.number            = true;
--vim.opt.omnifunc          = 'syntaxcomplete#Complete';
vim.opt.previewheight     = 12;
vim.opt.pumblend          = 10;
vim.opt.pumheight         = 15;
vim.opt.redrawtime        = 1500;
vim.opt.relativenumber    = true;
vim.opt.ruler             = false;
vim.opt.scrolloff         = 2;
vim.opt.sessionoptions    = 'curdir,help,tabpages,winsize';
vim.opt.shada             = "!,'300,<50,@100,s10,h";
vim.opt.shiftround        = true;
vim.opt.shiftwidth        = 2;
vim.opt.shortmess         = 'aoOTIcF';
vim.opt.showbreak         = '↳  ';
vim.opt.showcmd           = false;
vim.opt.showmode          = false;
vim.opt.showtabline       = 2;
vim.opt.sidescrolloff     = 5;
vim.opt.signcolumn        = 'yes';
vim.opt.smartcase         = true;
vim.opt.smarttab          = true;
vim.opt.softtabstop       = -1;
vim.opt.spellfile         = cache_dir .. 'spell/en.uft-8.add';
vim.opt.splitbelow        = true;
vim.opt.splitright        = true;
vim.opt.startofline       = false;
vim.opt.swapfile          = false;
vim.opt.switchbuf         = 'useopen';
vim.opt.synmaxcol         = 2500;
vim.opt.tabstop           = 2;
vim.opt.termguicolors     = true;
vim.opt.textwidth         = 0; -- don't want new line wrapping
vim.opt.timeout           = true;
vim.opt.timeoutlen        = 500;
vim.opt.ttimeout          = true;
vim.opt.ttimeoutlen       = 10;
vim.opt.undodir           = cache_dir .. 'undo/';
vim.opt.undofile          = true;
vim.opt.updatetime        = 100;
vim.opt.viewdir           = cache_dir .. 'view/';
vim.opt.viewoptions       = 'folds,cursor,curdir,slash,unix';
vim.opt.virtualedit       = 'block';
vim.opt.visualbell        = true;
vim.opt.whichwrap         = 'h,l,<,>,[,],~';
vim.opt.wildignore        = '.git,.hg,.svn,*.pyc,*.o,*.out,*.jpg,*.jpeg,*.png,*.gif,*.zip,**/tmp/**,*.DS_Store,**/node_modules/**,**/bower_modules/**';
vim.opt.wildignorecase    = true;
vim.opt.winblend          = 10;
vim.opt.winminwidth       = 10;
vim.opt.winwidth          = 30;
vim.opt.wrap              = false;
vim.opt.wrapscan          = true;
vim.opt.writebackup       = false;

vim.diagnostic.config({ severity_sort = true })

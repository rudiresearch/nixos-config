{ pkgs, config, ... }:

{
  programs.vim = {
    enable = true;
    defaultEditor = true;
    plugins = with pkgs.vimPlugins; [ vim-airline vim-airline-themes ];
    settings = { ignorecase = true; };
    extraConfig = ''
      " .vimrc

      set nocompatible " Disable compatibility with vi which can cause unexpected issues.

      filetype on "filetype detection
      filetype indent on "load an indent file for the detected file type.
      filetype plugin on "turns on ftplugin
      syntax off "syntax highlighting

      set encoding=utf-8
      "set spell spelllang=en_us
      "
      """"""""""""""""""""""""""""""
      ""Appearance
      set termguicolors "full color support


      set path+=** " add recursive wildcard for searching through subdirs of active dir
      set number relativenumber "add relative linenumbers




      """"""""""""""""""""""""""""""
      ""Folding
      set foldmethod=indent
      set foldlevel=99
      nnoremap <space> za

      set shiftwidth=4 " Set shift width to 4 spaces.
      set tabstop=4 " Set tab width to 4 columns.
      " Use space characters instead of tabs.
      set expandtab
      set nobackup "do not save backupfiles
      set scrolloff=10 "Do not let cursor scroll below or above N number of lines when scrolling.
      " Show partial command you type in the last line of the screen.
      set showcmd

      """"""""""""""""""""""""""""""
      ""SEARCH
      set showmatch "Show matching words during a search
      set hlsearch "highlight word during search
      set incsearch  "While searching though a file incrementally highlight matching characters as you type.
      set ignorecase "ignore capitalization during search 
      set smartcase "Override ignorecase option if searching for capital letters.


      """"""""""""""""""""""""""""""
      ""COMMAND MODE
      set history=1000 "command history
      set wildmenu "auto-completion in command mode
      set wildignore=*.docx,*.jpg,*.png,*.gif,*.pdf,*.pyc,*.exe,*.flv,*.img,*.xlsx "ignore files in wildmo e


      """"""""""""""""""""""""""""""
      ""MAPPINGS
      let mapleader = "'" "remap leader key to '

      "type jj quickly to exit insert mode
      inoremap jj <Esc>

      "new line below/above plus exit insert mode
      nnoremap o o<esc>
      nnoremap O O<esc>

      "Center cursor vertically when moving to next word during search
      nnoremap n nzz
      nnoremap N Nzz

      " Yank from cursor to the end of line.
      nnoremap Y y$

      " Map the F5 key to run a Python script inside Vim.
      " We map F5 to a chain of commands here.
      " :w saves the file.
      " <CR> (carriage return) is like pressing the enter key.
      " !clear runs the external clear screen command.
      " !python3 % executes the current file with Python.
      nnoremap <f5> :w <CR>:!clear <CR>:!python3 % <CR>

      " split window by typing :split or :vsplit.
      " Navigate split view by pressing CTRL+j, CTRL+k, CTRL+h, or CTRL+l.
      nnoremap <c-j> <c-w>j
      nnoremap <c-k> <c-w>k
      nnoremap <c-h> <c-w>h
      nnoremap <c-l> <c-w>l

      " Resize split windows using arrow keys by pressing:
      " CTRL+UP, CTRL+DOWN, CTRL+LEFT, or CTRL+RIGHT.
      noremap <c-up> <c-w>+
      noremap <c-down> <c-w>-
      noremap <c-left> <c-w>>
      noremap <c-right> <c-w><

      " deactivate arrows in insert and visual mo e
      inoremap <up> <nop>
      vnoremap <up> <nop>
      inoremap <down> <nop>
      vnoremap <down> <nop>
      inoremap <left> <nop>
      vnoremap <left> <nop>
      inoremap <right> <nop>
      vnoremap <right> <nop>

      vnoremap . :norm.
      nnoremap <Tab> gt
      nnoremap <S-Tab> gT
      nnoremap <silent> <S-t> :tabnew<CR>

      " Example for a mapping importing a code snippet
      nnoremap ,html :-1read $HOME/.vim/.skeleton.html<CR>3jwf>

      " Map shortcut for opening ranger from vim
      nnoremap <leader>r :<C-U>RangerChooser<CR>


      """"""""""""""""""""""""""""""

      " activate fonts for symbols
      let g:airline_theme='base16_gruvbox_light_hard'
      "let g:airline_powerline_fonts = 1


      ""UNDOING
      set undodir=~/.vim/backup "undo changes to a file even after saving it
      set undofile
      set undoreload=10000


      """"""""""""""""""""""""""""""
      ""RANGER INTEGRATION
      " start ranger with ":RangerChooser" or keybinding "<leader>r".
      " select one or more files, press enter
      " files.

      function! RangeChooser()
          let temp = tempname()
          " The option "--choosefiles" was added in ranger 1.5.1. Use the next line
          " with ranger 1.4.2 through 1.5.0 instead.
          "exec 'silent !ranger --choosefile=' . shellescape(temp)
          if has("gui_running")
              exec 'silent !xterm -e ranger --choosefiles=' . shellescape(temp)
          else
              exec 'silent !ranger --choosefiles=' . shellescape(temp)
          endif
          if !filereadable(temp)
              redraw!
              " Nothing to read.
              return
          endif
          let names = readfile(temp)
          if empty(names)
              redraw!
              " Nothing to open.
              return
          endif
          " Edit the first item.
          exec 'edit ' . fnameescape(names[0])
          " Add any remaning items to the arg list/buffer list.
          for name in names[1:]
              exec 'argadd ' . fnameescape(name)
          endfor
          redraw!
      endfunction
      command! -bar RangerChooser call RangeChooser()


    '';
  };

}

atags.vim is a neovim plug that help you to manage async generation of tags.

# Install 

```vim
Plug 'fntlnz/atags.vim'
```

# Configure

```vim
map ]gt :call atags#generate<cr>
```

# Work in progress

* supports for different generator. In this moment it supports only ctags
* Add callback to [tpope/vim-dispatch](https://gituhb.com/tpope/vim-dispatch) for vim
* Generate async tags after every save

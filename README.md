atags.vim is a neovim plugin that help you to manage async generation of tags.

# Installation

Using [vim-plug](https://github.com/junegunn/vim-plug)

```vim
Plug 'fntlnz/atags.vim'
```

# Customization

### Customize the generation command

The generation command is a list of commands that will be executed to generate your tags.

This is the default generation command:

```viml
let g:atags_build_commands_list = [
    \"ctags -R -f tags.tmp",
    \"awk 'length($0) < 400' tags.tmp > tags",
    \"rm tags.tmp"
    \]
```


# Use cases

### Generate tags with `<Leader>t`

```viml
map <Leader>t :call atags#generate()<cr>
```

### Generate tags everytime a file is being written.

```viml
autocmd BufWritePost * call atags#generate()
```

# Work in progress

- [ ] Support for different tag generators. At the moment this supports only ctags.
- [ ] Use [tpope/vim-dispatch](https://gituhb.com/tpope/vim-dispatch) to be compatible with vim that doesn't have `jobstart`
- [ ] Write the docs

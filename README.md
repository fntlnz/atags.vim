atags.vim is a neovim plugin that help you to manage async generation of tags.

# Installation

Using [vim-plug](https://github.com/junegunn/vim-plug)
```vim
Plug 'fntlnz/atags.vim'
```

# Customization

### Customize generation command

This should be a list of commands that will be executed
to generate your tags.

This is the default generation command:

```viml
let g:atags_build_commands_list = [
    \"ctags -R -f tags.tmp",
    \"awk 'length($0) < 400' tags.tmp > tags",
    \"rm tags.tmp"
    \]
```


# Usage

### Generate tags with `<Leader>t`

```vim
map <Leader>t :call atags#generate()<cr>
```

### Generate tags before writing to a file

```
autocmd BufWritePost,FileWritePost * call atags#setup()
```

# Work in progress

- Support for different tag generators. At the moment this supports only ctags.
- Use [tpope/vim-dispatch](https://gituhb.com/tpope/vim-dispatch) to be compatible with vim that doesn't have `jobstart`
- Write docs

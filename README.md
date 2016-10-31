atags.vim is a Neovim plugin that helps you creating and updating your tag files.

# Installation

Using [vim-plug](https://github.com/junegunn/vim-plug)

```viml
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

### Generation examples

#### Generate tags using [stags](https://github.com/facebook/pfff) within a *Docker container*

```viml
let g:atags_build_commands_list = [
    \"docker run --rm -v $PWD:/project -w /project fntlnz/pfff:latest stags -lang php -o tags -vim ."
    \]
]
```

#### Generate tags only for files that are not in `.gitignore`

```viml
let g:atags_build_commands_list = [
    \ 'ag -g "" | ctags -L - --fields=+l -f tags.tmp',
    \ 'awk "length($0) < 400" tags.tmp > tags',
    \ 'rm tags.tmp'
    \ ]
```

#### Generate tags only for *PHP files* that are not in `.gitignore`

```viml
let g:atags_build_commands_list = [
    \ 'ag --php -g "" | ctags -L - --fields=+l -f tags.tmp',
    \ 'awk "length($0) < 400" tags.tmp > tags',
    \ 'rm tags.tmp'
    \ ]
```

# Work in progress

- [x] ~~Support for different tag generators. At the moment this supports only ctags.~~
- [ ] Use [tpope/vim-dispatch](https://github.com/tpope/vim-dispatch) to be compatible with vim that doesn't have `jobstart`
- [x] Write the docs

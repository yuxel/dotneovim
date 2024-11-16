# NeoVim config with lazyvim

* Install neovim from https://neovim.io/

* Clear the nvim cache

```bash 
rm -rf ~/.local/share/nvim ~/.local/state/nvim ~/.cache/nvim
```

# Install

```bash
git clone https://github.com/yuxel/dotneovim ~/.config/nvim
```

Execute neovim

```bash
nvim
```

# DOCS

https://www.lazyvim.org/keymaps


# Other plugins

Avante - https://github.com/yetone/avante.nvim  
 * Add your OPENAI_KEY  

```bash
export OPENAI_API_KEY=YOUR_KEY
```

# Disabled plugins

    * whcih_key
    * persistence

# Config

    * conform.lua --> Added prettier and eslint support

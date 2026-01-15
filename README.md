# Wilk's neoVIM Setup

## Briefing

This setup uses [lazy.nvim](https://github.com/folke/lazy.nvim) to manage packages and requires a few tools to be
installed outside of neovim (listed below).

## Installing

### neovim

- neovim 0.11+

### External Requirements

These are the most unorthodox requirements. Mind other requirements might still apply, such as `nodejs` to be available
in your environment, or that you have `C` and `C++` compilers. The list below has the requirements (at the time this was
set up) that I deemed less probable to be generally present in people's environments.

If the list below is wrong or outdated, you're more than welcome to submit a PR with corrections.

- [tree-sitter-cli](https://github.com/tree-sitter/tree-sitter/blob/master/crates/cli/README.md) - Required by [nvim-treesitter](https://github.com/nvim-treesitter/nvim-treesitter).
- [ripgrep](https://github.com/BurntSushi/ripgrep) - Required by [nvim-telescope](https://github.com/nvim-telescope/telescope.nvim).
- [lua-language-server](https://github.com/LuaLS/lua-language-server) - Required for Lua LSP.
- [basedpyright](https://github.com/DetachHead/basedpyright) - Required for Python LSP.
- [typescript-language-server](https://github.com/typescript-language-server/typescript-language-server) - Required for JS/TS LSP.
- [terraform-ls](https://github.com/hashicorp/terraform-ls) - Required for Terraform LSP.
- [helm-ls](https://github.com/mrjosh/helm-ls) - Required for Helm LSP.
- [yaml-language-server](https://github.com/redhat-developer/yaml-language-server) - Also required for the Helm LSP.
- [Nerd Fonts](https://www.nerdfonts.com) - Because yes.

### Getting the Files

Clone the repository with the following into `~/.config/nvim/lua/wim`:

```bash
mkdir -p ~/.config/nvim/lua
git clone https://github.com/wilkmaia/vimfiles.git ~/.config/nvim/lua/wim
```

Then add a single line to your `init.lua` file and that will be it.

```bash
touch ~/.config/nvim/init.lua
echo "require('wim') >> ~/.config/nvim/init.lua"
```

Run `nvim`. lazy.vim will install the necessary packages the first time it runs and check for updates whenever neovim is
opened in the future.

### Post-Installation

Run `:checkhealth` and ensure the relevant health checks pass for your setup.

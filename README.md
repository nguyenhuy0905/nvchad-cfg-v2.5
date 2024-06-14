# Nvchad configurations v2.5

<!--toc:start-->
- [Nvchad configurations v2.5](#nvchad-configurations-v25)
    - [Configs](#configs)
    - [What's configured?](#whats-configured)
    - [Packages to download](#packages-to-download)
<!--toc:end-->

> NvChad configuration for NvChad 2.5
### Configs 
- LSP for C#, Haskell, C/C++/Rust, Python
- Debug adapter, technically for Haskell, C#, C/C++/Rust, Java, Python, but have only tested for C and Python. The ones for C++ and Rust should use the same configurations as C though. The one for Java doesn't seem to work properly for now, but that's probably due to skill issue.
- Unit testing for C#, Haskell, Python.
- Linting for C#, C/C++, Python, and more.
- Automatic documentation generation with Neogen `:Neogen`
- Lazygit integration
- Code folding
- Kind of smooth scrolling animation
### What's configured?
- Treesitter text objects.
### Packages to download
> Note: Mason downloads almost all the packages needed. So you would want to go to `~/.local/share/nvim/mason/packages/[whatever package it is]/[the executable file]`
- GHCup.
- lazygit.
- Rust.
- Golang.
- Python.
- npm.

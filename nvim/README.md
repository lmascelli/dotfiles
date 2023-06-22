# nvim
My Neovim configuration

## TODO
- [ ] refactor the options system:
    - [ ] later, save options to a file and check at startup if that file
          exists, if so load that options and skip this part
    - [ ] give the possibility to export current options to that file

- [ ] refactor plugin system:
    - [ ] plugin provider (Lazy, Packer, builtin, ecc...)
    - [ ] later, add the conversion for the plugin provider to an install
          function so it could be set in a single setup config.

- [ ] make every module that could be lazy loaded so. (keymaps, options, ecc...)

- [ ] better explaination in init.lua comments of what's happening.

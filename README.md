# Experimental lua config

Potential replacement for a CoC setup which has been
crashing a lot in the huge monorepo projects I've been working on lately.

TODOs:
- [ ] fzf
- [x] leader key
- [ ] monorepo stuff
  - [x] setup detection
    - [ ] maybe fix hack
  - [ ] references are borking
- [ ] cleanup
- [ ] rust
- [ ] the just-git-clone-it setup experience
  - [ ] stupid mason autoinstall for non-lsp stuff

Setup:

```
:MasonInstall All
```

## Content
- language servers (ts/js, haskell, lua, bash, markdown)
- whitespace rendering
- `leader` is `,`
- format with `Efmt`

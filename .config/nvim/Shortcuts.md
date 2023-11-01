---
tags:
  - Knowledge
  - Info
date: 2023-05-31
thema: Nvim
---
[[Nvim_Shortcuts.png]]
#### Questions
- Was machen cnext, cprev, lnext und lprev (habe dafür keybinds)

## Wichtige Native sachen
- `C, c`: replace until \$ / replace until \[motion\] 
	- `ciw, cip, ci{` mit `c, d, y`: change/delete/yank current word/paragraph/braces content
- `m*`: set mark; `'*`: go to mark
- `'[`: go to last changed or yanked line
- `*`: search current word
- `<C-a>, <C-x>`: increase / decrease number
- `gv`: vorherige selection reaktivieren
- `gt` und `gT`: tab wechseln, `g<Tab>`: zwischen recent tabs wechseln, `$NRgt$` zur Tab nummer $NR wechseln
- `>%`, `>ib`: shift code block or paragraph
- `<C-w>x`: switch buffers
- `~` change case
	- `g~, gu, gU`
- `:r !<cmd>`: place result of command under cursor

## Wichtige Plugin sachen
- which-key
	- `<leader>S`: sachen durchsuchen (`<leader>Sk`: keymaps)
	- `<leader>F`: live grep OMGGOMGOMGOMG
	- `<leader>ls`: show all variables and stuff
- (`:PackerSync`: (un-)install plugins (do `:so` first))
- `<leader>ll`: Vimtex --> Latex compilieren und öffnen
- Comment
	- `<leader>/`: toggle comment
	- `gbc`: block comments
	- `gc[count]{motion}` for N-mode line toggle
	- `gc{`: toggle until blank line,  `gcip`: toggle paragraph
	- `gci{ / gca{`: toggle inside/around curly braces
- `lsp.lua`
	- `K`: typ der Variable anzeigen, nochmal um ins fenster rein zu gehen
	- `<leader>la`: code actions
	- `[d, ]d`: zwischen Fehlern springen
	- `<leader>lR` rename current variable
	- `<leader>lr`: zeigt wo in welchen dateien current word referenziert wird
	- `<C-f>`: scroll though cmp
	- `<C-e>`: abort cmp
	- `<A-f>`: (insert mode): show signature help
	- `gd, gD, gi`: go to definition, declaration, implementation
	- luasnip
		- `<Tab>` expand (funktioniert grad nicht??)
		- `<C-l>, <C-h>`: Move between fields
- `surround`
	- `ys{motion}{char}` add
	- `ds{char}` delete
	- `cs{target}{replacement}` change
	- Aliases
		- a: >
		- b: )
		- B: }
		- r: ]
		- q: { ", ', \`}
		- s: { }, ], ), >, ", ', \`}
		- t: html
- `]t`: zwischen todo-comments springen
- Git
	- `<C-p`: search only git files
	- `]c` zwischen hunks springen
	- `<leader>hs` stage hunk, `<leader>hr` reset hunk
	- `co/ct` choose ours/theirs
- `<leader>u`: undo-tree toggle
- `<leader>a`: harpoon mark a file, `<C-E>` harpoon show files
- [CSS reference](https://github.com/rstacruz/vim-hyperstyle/blob/master/REFERENCE.md)
- Autopairs
	- `<A-e>`: wrap current bracketsaround next brackets
	- `<A-b>`: backplace
- DAP (debugging)
	- `<leader>db/dn/di/do/dx`: launch-continue/next/step into/step out/terminate
	- `<leader>dbb`: launch-continue with mode select
	- `<leader>-` toggle breakpoint, ` ` jump between breakpoints (?)
	- `<leader>du`: toggle UI
	- `<leader>K`: Hover DAP
	- UI: `e,t,d,r,o`

## Wichtige Custom sachen
- `<leader>s`: replace word under cursor in file
- `<leader>r`: run file
- `<leader>cd`: make file dir cwd, `<leader>upo/down`: move cwd up or down (relative to file)


## Not sure what dese do
- `<leader>lS`: symbols/variables etc.
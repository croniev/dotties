---
tags:
  - Knowledge
  - Info
date: 2023-05-31
thema: Nvim
---
[[Nvim_Shortcuts.png]]

## Wichtige Native sachen
- `C, c`: replace until \$ / replace until \[motion\] 
	- `{c, d, y, v, gc, surround_cmd}{i, a}{w, p, surround_char}`: perform action on current word/paragraph/etc
- `m*`: set mark; `'*`: go to mark
- `'[`: go to last changed or yanked line
- `*`: search current word
- `<C-a>, <C-x>`: increase / decrease number
- `>%`, `>ib`: shift code block or paragraph
- `${n}gt`: go to tab number ${n}
- `<C-w>x`: switch buffers
- `~` change case (use `g` as well)
- `"=`: Expression register (kan dann pasted werden)
- `:r !<cmd>`: place result of command under cursor
- insert mode `<C-o>`: escape i to do one n action
- insert mode `<C-r>`: insert from buffer
- `z`: folds, movement, spelling

## Wichtige Plugin sachen
- telescope: `<C-/>`: shrortcuts anzeigen
- Comment
	- `gbc`: block comments
	- `gc[count]{motion}` normalmode
	- `gc{`: toggle until blank line,  `gcip`: toggle paragraph
	- `gci{ / gca{`: toggle inside/around curly braces
- `lsp.lua`
	- `K`: typ der Variable anzeigen, nochmal um ins fenster rein zu gehen
	- `<C-e>`: abort cmp
	- `<A-f>`: (insert mode): show signature help
	- luasnip
		- `<Tab>` expand <font color="red">broken</font>
		- `<C-l>, <C-h>`: Move between fields
		- `<C-E>` change choice
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
- Git
	- `<C-p>`: search only git files
	- `co/ct` choose ours/theirs <font color="red">testen</font>
- `<C-E>` harpoon show files
- `<A-e>`: wrap current brackets around next word
- DAP (debugging)
	- `<A-K>`: Hover DAP
	- UI: `e,t,d,r,o`
- Test
	- `m/M`: mark/clear, `t/T`: target/clear, `r/R`: run/run marked, `o/O`: output/short output, `J/K`: jump between fails, `i`: go to test, `e`: expand all, `d`: debug
- [Nerdfonts icons](https://www.nerdfonts.com/cheat-sheet)
- [CSS reference](https://github.com/rstacruz/vim-hyperstyle/blob/master/REFERENCE.md)
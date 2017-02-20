Derwent's notes for vim using Ultimate vimrc: https://github.com/amix/vimrc
from within macvim: https://github.com/macvim-dev/macvim
Userful cheatsheet: https://vim.rtorr.com/

LEDGEND
====
In this document I use the same symbols as Vim help, except I use some extra unicode symbols as a shorthand for stuff 

| Symbol | Meaning |
| --- | --- |
| `★` | &lt;leader&gt; key, usually '\' key but but ',' in ultimate vimrc |

UNFUCKING THINGS
====
Simple ways to fix confusing mistakes made by a Vim beginner

| Key | Cmd | Result |
| --- | --- | --- |
| `⎋`, `q`, `<C-C>` |  | Just keep pressing these until you get back to normal mode on a bugger and go from there |
|   | `:e #` | When you accidentally do a `★e`, got back to the previous buffer that was being edited |
|   | `:set hls!` | When you accidentally turn on search highlight |
| `^w c` | `:winc c` | Close current window (Doesn't accidentally quit vim) |
| `^w =` | `:wincmd =` | Make all windows the same width / height |
| `<C-O>` |  | Reverse cursor motion (see :jumplist)|

HELP
===
Getting Help on Commands
----
| Cmd | Result |
| --- | --- |
| `:vert[ical] bo[tright] h[elp] {help}` | open help in vertical bo split instead of horizontal split |
| `:h {cmd}` | Normal mode **cmd** help |
| `:h v_{cmd}` | Visual mode **cmd** help |
| `:h c_{cmd}` | Command line editing **cmd** help |
| `:h :{cmd}` | Command line **cmd** help |
| `:h '{option}'` | **option** help |

Navigating Help
----
| Cmd | Result |
| --- | --- |
| `<C-]>` | open help at tag on cursor |
| `<C-T>` | Go back to previous help |

Understanding Mappings
----
| Cmd | Result |
| --- | --- |
| `:help index` | show system mappings |
| `:map` | Show extended (non-system) mappings |
| `:nmap` | Show normal mode extended mappings |
| `:vmap` | Show visual mode extended mappings |
| `:imap` | Show insert mode extended mappings |
| `:verbose {map}` | Show verbose mapping for map |

Options
----
| Cmd | Result |
| --- | --- |
| `:set {opt}?` | View current value of **opt** |
| `:set no{opt}` | Turn off **opt** |
| `:set {opt}` | Turn on **opt** |
| `:set {opt}={val}` | overwrite value of **opt** |
| `:set {opt}+={val}` | Append to value of **opt** |
| `:echo &{opt}` | access **opt** as variable |

Debugging VIM
----
| Cmd | Result |
| --- | --- |
| `:messages` | last few error messages |

NERDTREE
====
handy lil cheatsheet: https://www.cheatography.com/stepk/cheat-sheets/vim-nerdtree/

| Key | Cmd | Result |
| --- | --- | --- |
| `,nn` | `:NERDTreeToggle` |  |
| `?` |  | Show nerdtree help |
| `m a` |   | open Filesystem Menu, Add child node |
| `s <C-W> r` |   | open file in new split window, swap window order |

BUFFEXPLORER
====
| Key | Cmd | Result |
| --- | --- | --- |
| `★be`,`★o` | :BuffExplorer | Opens BuffExplorer in current window |
| `★bs` | :BuffExplorer | Opens BuffExplorer in newly split window |
| `★bv` | :BuffExplorer | Opens BuffExplorer in newly split window |

BUFFERS, TABS, WINDOWS
====
Buffer: in-memory text of a file
Window: viewport into buffer
Tag page: Collection of windows
useful guide: https://sanctum.geek.nz/arabesque/buffers-windows-tabs/

Buffers
----
| Key | Cmd | Result |
| --- | --- | --- |
|   | `:enew` | Create new empty buffer |
|   | `:e[dit] {filename}` | edit filename in place of current file (no args = reload buffer) |
|   | `:new` | Create new empty buffer in new horizontally split window |
|   | `:split {filename}` | edit filename in new horizontally split window |
|   | `:vnew` | Create new empty buffer in new vertically split window |
|   | `:vsplit {filename}` | edit filename in new horizontally split window |
| ★o | `:BufExplorer` | explore list of buffers | 
| ★bd  | `:Bclose` | Close buffer |
| {N}b | `:b {N}` | Go to buffer **N** | 

Tabs
----
| Key | Cmd | Result |
| --- | --- | --- |
| `★tn`, `<M-T>` | `:tabnew` | Create a new empty tab |
| `★to` | `:tabonly` | close all other tabs |
| `★tc` | `:tabclose` |  |
| `★tm` | `:tabmove` |  |
| `★te`  | `:tabedit {filename}` | Create a new tab and edit filename |

Window Commands
----
| Key | Cmd | Result |
| --- | --- | --- |
| `<C-W>[{N}]{+/-/</>}` | `:[{N}]winc {+/-/</>}` | adjust window height / width **N** lines |
| `<C-{h/j/k/l}`, `<C-W>{H/J/L/K}` | `:winc {H/J/K/L}` | move current window to far left / down / up / right |
| `<C-W>[{N}]{h/j/l/k}` | `:[{N}]winc {h/j/l/k}` | go to the **N**th left / down / up / right window |
| `<C-W>[{N}]{w/W}` | `:[{N}]winc {w/W}` | Go to **N**th prev / next window (wraps) |
| `<C-W>[{N}]{r/R}` | `:[{N}]winc {r/R}` | Rotate the windows upwards / downwards **N** times |
| <code>&lt;C-W&gt;[{N}]{&lowbar;/&#124;}</code> | <code>:[{N}]winc {&lowbar;/&#124;}</code> | Set the height of window to **N** (default: largest possible)

MOTION
====
help: `:h motion`

todo: `t{}`, `f{}`, `F{}`

A motion operation has the following syntax: `{operator}[{modifier}][{count}]{motion}`

The operator either affects whole lines, or the characters between the start and end position.  Generally, motions that move between lines affect lines (are **linewise**), and motions that move within a line affect characters (are **characterwise**).  However, there are some exceptions.

A character motion is either **inclusive** or **exclusive**.  When **inclusive**, the start and end position of the motion are included in the operation.  When **exclusive**, the last character towards the end of the buffer is not included. **Linewise** motions always include the start and end position.

Which motions are **linewise**, **inclusive** or **exclusive** is mentioned with the command.  There are however, two general exceptions:
1. If the motion is **exclusive** and the end of the motion is in column 1, the end of the motion is moved to the end of the previous line and the motion becomes **inclusive**.  Example: "}" moves to the first line after a paragraph, but "d}" will not include that line.
2. If the motion is **exclusive**, the end of the motion is in column 1 and the start of the motion was at or before the first non-blank in the line, the motion becomes **linewise**.  Example: If a paragraph begins with some blanks and you do "d}" while standing on the first non-blank, all the lines of the paragraph are deleted, including the blanks.  If you do a put now, the deleted lines will be inserted below the cursor position.

Operators
----
| Operator | cmd | Result |
| --- | --- | --- |
| `d` | `:d[elete]` | Delete (cut) along given motion **N** times |
| `y` | `:y[ank]` | Yank (copy) along given motion **N** times |
| `c` | `:c[hange]` | Change (delete then enter INSERT) along given motion **N** times |
| `g{~/u/U/q/?/@}` | `:g[lobal]` | Transform the text with togglecase / lowercase / uppercase / format / rot13 / operatorfunc |
| `!` | `:!` | Filter through external program |
| `{</>}` | `:{</>}` | Shift (indent) left / right | 

Repeat op to work on current line

| `dd`/`yy`/`cc` | delete / yank / change current line | 
| `D`/`C` | delete / change til end of line |  

Modifiers
----
These only work in `o` mode

| Modifier | Result |
| --- | --- |
| `v` | Forces the operator to work **characterwise**. If motion **linewise** then becomes **exclusive** |
| `V` | Forces the operator to be **linewise** |
| `<C-V>` | Force operator to work **blockwise** | 

Left-right Motion
----
These work in `n`, `v` and `o` modes.

| Key | Result | Properties |
| --- | --- | --- |
| `{N}{h/l}`, `{N}⇆` | Move **N** characters forward / backward | `excl.` |
| `0`,`★←`, `↤` | Move to beginning of line | `excl.` |
| `^` | Move to First non-blank character of line | `excl.` |
| `$`,`★→`, `↦` | Move to end of line | `incl.` |
| `g0`, `g↤` | Move to first character of screen line | `excl.` |
| `g^` | First non-blank character of the screen line | `excl.` |
| `gm` | Middle of screen line | | 
| `{N}g_` | Move [ **N** - 1 ] screen lines downward and to the last non-blank character | `incl.` |
| `{N}g$`, `{N}g↦` | Move [ **N** - 1 ] screen lines down and last character of screen line | `incl.` |

Up-down Motion
----
These work in `n`, `v` and `o` modes.

| Key | Result | Properties |
| --- | --- | --- |
| `{N}{j/k}`, `{N}⇅` | Move **N** lines up / down | `line.` |
| `{N}g{j/k}`, `{N}g⇅` | Move **N** screen lines up / down | `line.`, `excl.` in `n` |
| `{N}-` | Move **N** lines up, on first non-blank character | `line.` |
| `{N}+` | Move **N** lines down, on first non-blank character | `line.` |
| `{N}_` | Move [ **N** - 1 ] lines downward, on last non-blank character | `line.` |
| `{N}G` | Go to line **N** (default: last line) on first non-blank character | `line.` |
| `{N}gg` | Go to line **N** (default: first line) on first non-blank character | `line.` |
| `{N}%` | Go to **N** percent in the file on the first non-blank character in the line | `line.` |`
TODO: Finish this

Word Motion
----
| Key |  Result | Properties |
| --- | --- | --- | 
| `{N}{w/b}`, `<S-⇆>` | **N** words forward / backward | `excl.` |
| `{N}{W/B}`, `<A-⇆>` | **N** WORDs forward / backward | `excl.` |
| `{N}{e/ge}` | **N** words forward / backward | `incl.` |
| `{N}{E/gE}` | **N** WORDS forward / backward | `incl.` |

Text Object Motions
----
| Key |  Result | Properties |
| --- | --- | --- |
| `{N}{(/)}` | **N** sentences forward / backward | `excl.` |
| `{N}{{/}}`, `<A-⇅>` | **N** paragraphs forward / backward | `excl.` |

Text Object Selection
----
Text object selection syntax: `{N}{a/i}{text object selector}`

When used after an operator:
 - For non-block objects:
  - For the "a" commands: The operator applies to the object and the white
	space after the object.  If there is no white space after the object
	or when the cursor was in the white space before the object, the white
	space before the object is included.
  - For the "inner" commands: If the cursor was on the object, the
	operator applies to the object.  If the cursor was on white space, the
	operator applies to the white space.
 - For a block object:
  - The operator applies to the block where the cursor is in, or the block
	on which the cursor is on one of the braces.  For the "inner" commands
	the surrounding braces are excluded.  For the "a" commands, the braces
	are included.

When used in Visual mode:
 - When start and end of the Visual area are the same (just after typing "v"):
  - One object is selected, the same as for using an operator.
 - When start and end of the Visual area are not the same:
  - For non-block objects the area is extended by one object or the white
	space up to the next object, or both for the "a" objects.  The
	direction in which this happens depends on which side of the Visual
	area the cursor is.  For the block objects the block is extended one
	level outwards.

| Selector | Result | Properties |
| --- | --- | --- |
| `{w/W/s/p}` | word / WORD / sentence / paragraph | `char.` in `v` |
| `[`, `]` | [] block | `incl.`, `char.` in `v` |
| `(`, `)`, `b` | block | `excl.`, `char.` in `v` |
| `<`, `>` | &lt;&gt; block | `excl.`, `char.` in `v` |
| `t` | tag block | `excl`, `char.` in `v` |
| `{`, `}`, `B` | BLOCK | `excl.`, `char.` in `v` |
| `"`, `'`, <code>`</code> | quoted string | 

Other Useful Motions
----
| Key |  Result | Properties |
| --- | --- | --- | 
| `{N}{H/L}` | **N** lines from the top / bottom | `line.` |
| `M` | middle line of window | `line.` |


SCROLLING
====
help: `:h scrolling`

Scrolling Vertically
----
| Key | Result |
| --- | --- |
| `{N}<C-{E/Y}>` | Scroll window **N** lines upward / downward |
| `<C-{U/D}>` | Scroll window up / down half a page |
| `<C-{B/F}>`, `<S-⇅>`, `{↥/↧}` | Scroll window back / forward a page |

Scrolling Relative To Cursor
----
| Key | Result |
| --- | --- |
| `{N}z.` | Redraw, line **N** (default: current line) at center of window. put cursor at first non-blank in line |
| `{N}zz` | Redraw, line **N** (default: current line) at center of window. |
| `{N}z{-/+}` | Redraw, line **N** (default: current line) at bottom / top of window. |

INSERT
====
help: `:h insert`
Commands available in insert mode

| Key | Result |
| --- | --- |
| `<C-W>` | Delete word before cursor | 
| `<C-U>` | Delete all entered characters before cursor in current line. if no entered characters, delete all characters before the cursor in current line. |
| `<C-V>x{hex}` | Insert character with hex value **hex** |
| `<C-M>` | Begin a new line |
| `<C-D>` | Delete one level of indent in current line. |
| `<C-{E/Y}` | Insert the character that is above / below the cursor |
| `<C-O>` | do one command and go back into insert mode. |

Insert completion
----
| Key | Result |
| --- | --- |
| `<C-X><C-L>` | Line completion |
| `<C-X><C-{N/P}>` | Keyword completion: search forwards / backwards | 
| `<C-N>` | Everything completion |



Entering Insert Mode
----


CHANGE
====
help `:h change`

COMMAND LINE MAPPING
====
| Key | Result |
| --- | --- |
| `<C-A>` | Home |
| `<C-E>` | End |
| `<C-K>` | Undo? |
| `<C-P>` | prev command |
| `<C-N>` | next command |

Search
----
- Search word under cursor
- Replace next few occurences:
    `*` = search for next occurence
    `N` = go back to previous occurence
    `ciw` = change inner word
    `type` replacement then escape
    `n` = move to next occurence
    `.` repeat change

Other Useful Stuff
----
- Join block of lines:

Systastic
====
| key | Cmd | Result |
| --- | --- | --- |
|   | `:Errors` | Open errors window | 

Suggested Mappings
====
| key | mapped to |
| --- | --- |

MACROS
====
| key | mapped to |
| --- | --- |
| `q{register}{commands}q` | Record macro in **register** |
| `@{register}` | Playback macro in **register** |



MARKS
====
| key | mapped to |
| --- | --- |
| m{register} | store mark in **register** |
| `{register} | go to mark in **register** |


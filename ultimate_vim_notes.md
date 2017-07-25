Derwent's notes for vim using [Ultimate vimrc](https://github.com/derwentx/vimrc): Mostly within [iTerm2](https://www.iterm2.com) and sometimes from within [macvim](https://github.com/macvim-dev/macvim) Other Useful cheatsheets:

- <https://vim.rtorr.com/>
- <https://www.fprintf.net/vimCheatSheet.html>

# LEDGEND

In this document I use the same symbols as Vim help, except I use some extra unicode symbols as a shorthand for stuff

Symbol      | Meaning
----------- | -----------------------------------------------------------------------
`★`         | <leader> key, usually '\' key but but ',' in ultimate vimrc</leader>
`<S-{key}>` | Shift-**key**
`<C-{key}>` | Control-**key**
`<A-{key}>` | Alt-**key**
`<D-{key}>` | <span style="color:blue">Super-<strong>key</strong> (macOS Only)</span>

# UNFUCKING THINGS

Simple ways to fix confusing mistakes made by a Vim beginner

Key               | Cmd         | Result
----------------- | ----------- | ---------------------------------------------------------------------------------------------------
`⎋`, `q`, `<C-c>` |             | Just keep pressing these until you get back to normal mode on a bugger and go from there
                  | `:e #`      | When you accidentally do a `★e`, got back to the previous buffer that was being edited
                  | `:set hls!` | When you accidentally turn on search highlight
`^w c`            | `:winc c`   | Close current window (Doesn't accidentally quit vim)
`^w =`            | `:wincmd =` | Make all windows the same width / height
`<C-o>`           |             | Reverse cursor motion (see :jumplist)
`gv`              |             | Go to the last visual selection, for when you fuck up something in the middle of a visual selection

# HELP

## Getting Help on Commands

Cmd                                    | Result
-------------------------------------- | ----------------------------------------------------------
`:vert[ical] bo[tright] h[elp] {help}` | open help in vertical bo split instead of horizontal split
`:h {cmd}`                             | Normal mode **cmd** help
`:h v_{cmd}`                           | Visual mode **cmd** help
`:h c_{cmd}`                           | Command line editing **cmd** help
`:h :{cmd}`                            | Command line **cmd** help
`:h '{option}'`                        | **option** help

## Navigating Help

Cmd     | Result
------- | --------------------------
`<C-]>` | open help at tag on cursor
`<C-T>` | Go back to previous help

## Understanding Mappings

Cmd              | Result
---------------- | -----------------------------------
`:help index`    | show system mappings
`:map`           | Show extended (non-system) mappings
`:nmap`          | Show normal mode extended mappings
`:vmap`          | Show visual mode extended mappings
`:imap`          | Show insert mode extended mappings
`:verbose {map}` | Show verbose mapping for map

## Options

Cmd                 | Result
------------------- | -----------------------------
`:set {opt}?`       | View current value of **opt**
`:set no{opt}`      | Turn off **opt**
`:set {opt}`        | Turn on **opt**
`:set {opt}={val}`  | overwrite value of **opt**
`:set {opt}+={val}` | Append to value of **opt**
`:echo &{opt}`      | access **opt** as variable

## Debugging VIM

Cmd         | Result
----------- | -----------------------
`:messages` | last few error messages

# BUFFERS, TABS, WINDOWS

Buffer: in-memory text of a file Window: viewport into buffer Tag page: Collection of windows useful guide: <https://sanctum.geek.nz/arabesque/buffers-windows-tabs/>

## Buffers

Key  | Cmd                  | Result
---- | -------------------- | ----------------------------------------------------------------
     | `:enew`              | Create new empty buffer
     | `:e[dit] {filename}` | edit filename in place of current file (no args = reload buffer)
     | `:new`               | Create new empty buffer in new horizontally split window
     | `:split {filename}`  | edit filename in new horizontally split window
     | `:vnew`              | Create new empty buffer in new vertically split window
     | `:vsplit {filename}` | edit filename in new horizontally split window
<!-- ★o   | `:BufExplorer`       | explore list of buffers -->
★bd  | `:Bclose`            | Close buffer
{N}b | `:b {N}`             | Go to buffer **N**

## Tabs

Key     | Cmd                   | Result
------- | --------------------- | ----------------------------------
`★tn`   | `:tabnew`             | Create a new empty tab
`<D-T>` | `:tabnew`             | Create a new empty tab
`★to`   | `:tabonly`            | close all other tabs
`★tc`   | `:tabclose`           |
`★tm`   | `:tabmove`            |
`★te`   | `:tabedit {filename}` | Create a new tab and edit filename

## Window Commands

Key                              | Cmd                  | Result
-------------------------------- | -------------------- | ---------------------------------------------------
`<C-W>[N]{+/-/</>}`              | `:[N]winc {+/-/</>}` | adjust window height / width **N** lines
`<C-{h/j/k/l}`, `<C-W>{H/J/L/K}` | `:winc {H/J/K/L}`    | move current window to far left / down / up / right
`<C-W>[N]{h/j/l/k}`              | `:[N]winc {h/j/l/k}` | go to the **N** th left / down / up / right window
`<C-W>[N]{w/W}`                  | `:[N]winc {w/W}`     | Go to **N** th prev / next window (wraps)
`<C-W>[N]{r/R}`                  | `:[N]winc {r/R}`     | Rotate the windows upwards / downwards **N** times
`<C-W>[N]{x/<C-X>}`              | `:[N]winc {x/<C-x>}` | exchange window the **n** th next / previous window
`<C-W>` `q`                      | `:winc q`            | quit current window
`<c-w>[N]{_/</c-w>             | }`                   | `:[N]winc {_/                                       | }` | Set the height of window to **N** (default: largest possible)

# MOTION

help: `:h motion`

todo: `t{}`, `f{}`, `F{}`

A motion operation has the following syntax: `{operator}[{modifier}][{count}]{motion}`

The operator either affects whole lines, or the characters between the start and end position. Generally, motions that move between lines affect lines (are **linewise**), and motions that move within a line affect characters (are **characterwise**). However, there are some exceptions.

A character motion is either **inclusive** or **exclusive**. When **inclusive**, the start and end position of the motion are included in the operation. When **exclusive**, the last character towards the end of the buffer is not included. **Linewise** motions always include the start and end position.

Which motions are **linewise**, **inclusive** or **exclusive** is mentioned with the command. There are however, two general exceptions:

1. If the motion is **exclusive** and the end of the motion is in column 1, the end of the motion is moved to the end of the previous line and the motion becomes **inclusive**. Example: "}" moves to the first line after a paragraph, but "d}" will not include that line.
2. If the motion is **exclusive**, the end of the motion is in column 1 and the start of the motion was at or before the first non-blank in the line, the motion becomes **linewise**. Example: If a paragraph begins with some blanks and you do "d}" while standing on the first non-blank, all the lines of the paragraph are deleted, including the blanks. If you do a put now, the deleted lines will be inserted below the cursor position.

## Operators

Operator         | cmd         | Result
---------------- | ----------- | ------------------------------------------------------------------------------------------
`d`              | `:d[elete]` | Delete (cut) along given motion **N** times
`y`              | `:y[ank]`   | Yank (copy) along given motion **N** times
`c`              | `:c[hange]` | Change (delete then enter INSERT) along given motion **N** times
`g{~/u/U/q/?/@}` | `:g[lobal]` | Transform the text with togglecase / lowercase / uppercase / format / rot13 / operatorfunc
`!`              | `:!`        | Filter through external program
`{</>}`          | `:{</>}`    | Shift (indent) left / right

Repeat op to work on current line

| `dd`/`yy`/`cc` | delete / yank / change current line | | `D`/`C` | delete / change til end of line |

## Modifiers

These only work in `o` mode

Modifier | Result
-------- | ------------------------------------------------------------------------------------------------
`v`      | Forces the operator to work **characterwise**. If motion **linewise** then becomes **exclusive**
`V`      | Forces the operator to be **linewise**
`<C-V>`  | Force operator to work **blockwise**

## Left-right Motion

These work in `n`, `v` and `o` modes.

Key                | Result                                                                       | Properties
------------------ | ---------------------------------------------------------------------------- | ----------
`{N}{h/l}`, `{N}⇆` | Move **N** characters forward / backward                                     | `excl.`
`0`,`★←`, `↤`      | Move to beginning of line                                                    | `excl.`
`^`                | Move to First non-blank character of line                                    | `excl.`
`$`,`★→`, `↦`      | Move to end of line                                                          | `incl.`
`g0`, `g↤`         | Move to first character of screen line                                       | `excl.`
`g^`               | First non-blank character of the screen line                                 | `excl.`
`gm`               | Middle of screen line                                                        |
`{N}g_`            | Move [ **N** - 1 ] screen lines downward and to the last non-blank character | `incl.`
`{N}g$`, `{N}g↦`   | Move [ **N** - 1 ] screen lines down and last character of screen line       | `incl.`

## Up-down Motion

These work in `n`, `v` and `o` modes.

Key                  | Result                                                                       | Properties
-------------------- | ---------------------------------------------------------------------------- | -----------------------
`{N}{j/k}`, `{N}⇅`   | Move **N** lines up / down                                                   | `line.`
`{N}g{j/k}`, `{N}g⇅` | Move **N** screen lines up / down                                            | `line.`, `excl.` in `n`
`{N}-`               | Move **N** lines up, on first non-blank character                            | `line.`
`{N}+`               | Move **N** lines down, on first non-blank character                          | `line.`
`{N}_`               | Move [ **N** - 1 ] lines downward, on last non-blank character               | `line.`
`{N}G`               | Go to line **N** (default: last line) on first non-blank character           | `line.`
`{N}gg`              | Go to line **N** (default: first line) on first non-blank character          | `line.`
`{N}%`               | Go to **N** percent in the file on the first non-blank character in the line | `line.`                 | `

TODO: Finish this

## Word Motion

Key                            | Result                                                                      | Properties
------------------------------ | --------------------------------------------------------------------------- | ----------
`[N]` `w` / `[N]` `b`, `<S-⇆>` | **N** words forward / backward                                              | `excl.`
                               | `<S-⇠>` / `<S-⇢>`
`[N]` `W` / `[N]` `B`          | **N** WORDs forward / backward                                              | `excl.`
`<A-h>` / `<A-l>`              | <span style="color:blue"><strong>N</strong> WORDs forward / backward</span> | `excl.`
`<A-⇠>` / `<A-⇢>`              |
`[N]{e/ge}`                    | **N** words forward / backward                                              | `incl.`
`[N]{E/gE}`                    | **N** WORDS forward / backward                                              | `incl.`

## Text Object Motions

Key                           | Result                                                                           | Properties
----------------------------- | -------------------------------------------------------------------------------- | ----------
`[N]` `(` / `[N]` `)`         | **N** sentences forward / backward                                               | `excl.`
`[N]` `{` / `[N]` `}`         | **N** paragraphs forward / backward                                              | `excl.`
`[N]` `<A-j>` / `[N]` `<A-k>` | <span style="color:blue"><strong>N</strong> paragraphs forward / backward</span> | `excl.`
                              | `[N]` `<A-⇡>` / `[N]` `<A-⇣>`

## Text Object Selection

Text object selection syntax: `{N}{a/i}{text object selector}`

When used after an operator:

- For non-block objects:

  - For the "a" commands: The operator applies to the object and the white space after the object. If there is no white space after the object or when the cursor was in the white space before the object, the white space before the object is included.
  - For the "inner" commands: If the cursor was on the object, the operator applies to the object. If the cursor was on white space, the operator applies to the white space.

- For a block object:

  - The operator applies to the block where the cursor is in, or the block on which the cursor is on one of the braces. For the "inner" commands the surrounding braces are excluded. For the "a" commands, the braces are included.

When used in Visual mode:

- When start and end of the Visual area are the same (just after typing "v"):

  - One object is selected, the same as for using an operator.

- When start and end of the Visual area are not the same:

  - For non-block objects the area is extended by one object or the white space up to the next object, or both for the "a" objects. The direction in which this happens depends on which side of the Visual area the cursor is. For the block objects the block is extended one level outwards.

Selector          | Result                             | Properties
----------------- | ---------------------------------- | -----------------------
`{w/W/s/p}`       | word / WORD / sentence / paragraph | `char.` in `v`
`[`, `]`          | [] block                           | `incl.`, `char.` in `v`
`(`, `)`, `b`     | block                              | `excl.`, `char.` in `v`
`<`, `>`          | <> block                           | `excl.`, `char.` in `v`
`t`               | tag block                          | `excl`, `char.` in `v`
`{`, `}`, `B`     | BLOCK                              | `excl.`, `char.` in `v`
`"`, `'`, `` ` `` | quoted string

## Other Useful Motions

Key        | Result                            | Properties
---------- | --------------------------------- | ----------
`{N}{H/L}` | **N** lines from the top / bottom | `line.`
`M`        | middle line of window             | `line.`

# SCROLLING

help: `:h scrolling`

## Scrolling Vertically

Key                                | Result
---------------------------------- | -------------------------------------------
`{N}<C-{E/Y}>`                     | Scroll window **N** lines upward / downward
`<C-{U/D}>`                        | Scroll window up / down half a page
`<C-{B/F}>` , `<S-{⇡/⇣}>`, `{⇞/⇟}` | Scroll window back / forward a page

## Scrolling Relative To Cursor

Key         | Result
----------- | -----------------------------------------------------------------------------------------------------
`{N}z.`     | Redraw, line **N** (default: current line) at center of window. put cursor at first non-blank in line
`{N}zz`     | Redraw, line **N** (default: current line) at center of window.
`{N}z{-/+}` | Redraw, line **N** (default: current line) at bottom / top of window.

# INSERT

help: `:h insert`

## Entering Insert Mode

Key  | Result
---- | ------------------------------------------------------------------------
`a`  | Append text after the cursor [count] times.
`A`  | Append text at the end of the line [count] times.
`i`  | Insert text before the cursor [count] times.
`I`  | Insert text before the first non-blank in the line [count] times.
`gI` | Insert text in column 1 [count] times.
`o`  | Begin a new line below the cursor and insert text, repeat [count] times.
`O`  | Begin a new line above the cursor and insert text, repeat [count] times.

## Insert completion

Key              | Result
---------------- | -----------------------------------------------
`<C-X><C-L>`     | Line completion
`<C-X><C-{N/P}>` | Keyword completion: search forwards / backwards
`<C-N>`          | Everything completion

## Insert Mode Commands

Key           | Result
------------- | -----------------------------------------------------------------------------------------------------------------------------------------------
`<C-W>`       | Delete word before cursor
`<C-U>`       | Delete all entered characters before cursor in current line. if no entered characters, delete all characters before the cursor in current line.
`<C-V>x{hex}` | Insert character with hex value **hex**
`<C-M>`       | Begin a new line
`<C-D>`       | Delete one level of indent in current line.
`<C-{E/Y}`    | Insert the character that is above / below the cursor
`<C-O>`       | do one command and go back into insert mode.

# CHANGE

help `:h change`

# COMMAND LINE MAPPING

Key     | Result
------- | ------------
`<C-A>` | Home
`<C-E>` | End
`<C-K>` | Undo?
`<C-P>` | prev command
`<C-N>` | next command

## Search

`:h substitute`

- Search word under cursor
- Replace next few occurences: `*` = search for next occurence `N` = go back to previous occurence `ciw` = change inner word `type` replacement then escape `n` = move to next occurence `.` repeat change

## Other Useful Stuff

- Join block of lines:

# MACROS

key                      | mapped to
------------------------ | ------------------------------
`q{register}{commands}q` | Record macro in **register**
`@{register}`            | Playback macro in **register**

# MARKS

key           | mapped to
------------- | --------------------------
`m{register}` | store mark in **register**
`{register}`  | go to mark in **register**

# Systastic

key | Cmd       | Result
--- | --------- | ------------------
    | `:Errors` | Open errors window

# SURROUNDS

## Commands

Key                              | Result
-------------------------------- | --------------------------------------------------------
`ds{surround}`                   | Delete surrounding **surround**
`cs{surround_old}{surround_new}` | Change surrounding **surround_old** for **surround_new**

## Targets

Key               | Result
----------------- | -----------------------------------------
`"`, `'`, `` ` `` | surround in / select in pair of character
`<{tag}>` / t     | Surround in / select balanced tags
                  | `(`

# Netrw

Stolen from <https://gist.github.com/t-mart/610795fcf7998559ea80> Also `:help netrw-quickmap`

Key     | Result
------- | --------------------------------------------------------------------------------------------------------------------------------------------------------
`<F1>`  | Causes Netrw to issue help
`<cr>`  | Netrw will enter the directory or read the file
`<del>` | Netrw will attempt to remove the file/directory
`-`     | Makes Netrw go up one directory
`a`     | Toggles between normal display, hiding (suppress display of files matching g:netrw_list_hide) showing (display only files which match g:netrw_list_hide)
`c`     | Make browsing directory the current directory
`C`     | Setting the editing window
`d`     | Make a directory
`D`     | Attempt to remove the file(s)/directory(ies)
`gb`    | Go to previous bookmarked directory
`gh`    | Quick hide/unhide of dot-files
`<c-h>` | Edit file hiding list
`i`     | Cycle between thin, long, wide and tree listings
`<c-l>` | Causes Netrw to refresh the directory listing
`mb`    | Bookmark current directory
`mc`    | Copy marked files to marked-file target directory
`md`    | Apply diff to marked files (up to 3)
`me`    | Place marked files on arg list and edit them
`mf`    | Mark a file
`mh`    | Toggle marked file suffices' presence on hiding list
`mm`    | Move marked files to marked-file target directory
`mp`    | Print marked files
`mr`    | Mark files satisfying a shell-style regexp
`mt`    | Current browsing directory becomes markfile target
`mT`    | Apply ctags to marked files
`mu`    | Unmark all marked files
`mx`    | Apply arbitrary shell command to marked files
`mz`    | Compress/decompress marked files
`o`     | Enter the file/directory under the cursor in a new browser window. A horizontal split is used.
`O`     | Obtain a file specified by cursor
`p`     | Preview the file
`P`     | Browse in the previously used window
`qb`    | List bookmarked directories and history
`qf`    | Display information on file
`r`     | Reverse sorting order
`R`     | Rename the designed file(s)/directory(ies)
`s`     | Select sorting style: by name, time or file size
`S`     | Specify suffix priority for name-sorting
`t`     | Enter the file/directory under the cursor in a new tab
`u`     | Change to recently-visited directory
`U`     | Change to subsequently-visited directory
`v`     | Enter the file/directory under the cursor in a new browser window. A vertical split is used.
`x`     | View file with an associated program
`X`     | Execute filename under cursor via system()
`%`     | Open a new file in netrw's current directory

# NERDTREE

handy lil cheatsheet: <https://www.cheatography.com/stepk/cheat-sheets/vim-nerdtree/>

Key         | Cmd               | Result
----------- | ----------------- | ------------------------------------------------
`,nn`       | `:NERDTreeToggle` |
`?`         |                   | Show nerdtree help
`m a`       |                   | open Filesystem Menu, Add child node
`s <C-W> r` |                   | open file in new split window, swap window order

# BUFFEXPLORER

Key        | Cmd           | Result
---------- | ------------- | ----------------------------------------
`★be`,`★o` | :BuffExplorer | Opens BuffExplorer in current window
`★bs`      | :BuffExplorer | Opens BuffExplorer in newly split window
`★bv`      | :BuffExplorer | Opens BuffExplorer in newly split window

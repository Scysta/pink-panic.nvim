--
-- Built with,
--
--        ,gggg,
--       d8" "8I                         ,dPYb,
--       88  ,dP                         IP'`Yb
--    8888888P"                          I8  8I
--       88                              I8  8'
--       88        gg      gg    ,g,     I8 dPgg,
--  ,aa,_88        I8      8I   ,8'8,    I8dP" "8I
-- dP" "88P        I8,    ,8I  ,8'  Yb   I8P    I8
-- Yb,_,d88b,,_   ,d8b,  ,d8b,,8'_   8) ,d8     I8,
--  "Y8P"  "Y888888P'"Y88P"`Y8P' "YY8P8P88P     `Y8
--

-- This is a starter colorscheme for use with Lush,
-- for usage guides, see :h lush or :LushRunTutorial

--
-- Note: Because this is a lua file, vim will append it to the runtime,
--       which means you can require(...) it in other lua code (this is useful),
--       but you should also take care not to conflict with other libraries.
--
--       (This is a lua quirk, as it has somewhat poor support for namespacing.)
--
--       Basically, name your file,
--
--       "super_theme/lua/lush_theme/super_theme_dark.lua",
--
--       not,
--
--       "super_theme/lua/dark.lua".
--
--       With that caveat out of the way...
--

-- Enable lush.ify on this file, run:
--
--  `:Lushify`
--
--  or
--
--  `:lua require('lush').ify()`

local lush = require('lush')
local hsl = lush.hsl

-- LSP/Linters mistakenly show `undefined global` errors in the spec, they may
-- support an annotation like the following. Consult your server documentation.
---@diagnostic disable: undefined-global
local theme = lush(function()
  return {
    -- The following are the Neovim (as of 0.8.0-dev+100-g371dfb174) highlight
    -- groups, mostly used for styling UI elements.
    -- Comment them out and add your own properties to override the defaults.
    -- An empty definition `{}` will clear all styling, leaving elements looking
    -- like the 'Normal' group.
    -- To be able to link to a group, it must already be defined, so you may have
    -- to reorder items as you go.
    --
    -- See :h highlight-groups
    Normal       { bg = hsl(330, 100, 93), fg = hsl(285, 90, 25) }, -- Normal text
    CursorLine   { bg = Normal.bg.li(30) }, -- Screen-line at the cursor, when 'cursorline' is set. Low-priority if foreground (ctermfg OR guifg) is not set.
    Folded       { bg = Normal.bg.da(10) }, -- Line used for closed folds
    CursorColumn { CursorLine }, -- Screen-column at the cursor, when 'cursorcolumn' is set.
    Search       { fg = Normal.fg.da(10), bg = hsl(283, 80, 80) }, -- Last search pattern highlighting (see 'hlsearch'). Also used for similar items that need to stand out.
    Substitute   { Search }, -- |:substitute| replacement text highlighting
    VertSplit    { bg = Search.fg }, -- Column separating vertically split windows
    IncSearch    { Search }, -- 'incsearch' highlighting; also used for the text replaced with ":s///c"
    CursorLineNr { fg = Folded.bg.da(20), gui = "bold" }, -- Like LineNr when 'cursorline' or 'relativenumber' is set for the cursor line.
    LineNr       { fg = CursorLineNr.fg.li(40) }, -- Line number for ":number" and ":#" commands, and when 'number' or 'relativenumber' option is set.
    MatchParen   { fg = hsl("#11A19C").li(50), bg = hsl("#11A19C") }, -- Character under the cursor or just before it, if it is a paired bracket, and its match. |pi_paren.txt|
    Visual       { fg = hsl("#A9331B"), bg = hsl("#FD7096") }, -- Visual mode selection
    Winseparator { fg = Folded.bg.da(2) }, -- Separator between window splits. Inherts from |hl-VertSplit| by default, which it will replace eventually.
    SignColumn   { bg = Normal.bg.da(3) }, -- Column where |signs| are displayed
    Whitespace   { LineNr }, -- "nbsp", "space", "tab" and "trail" in 'listchars'
    EndOfBuffer  { LineNr }, -- Filler lines (~) after the end of the buffer. By default, this is highlighted like |hl-NonText|.
    Directory    { fg = Visual.bg }, -- Directory names (and other special names in listings)

    StatusLine   { bg = Normal.bg }, -- Status line of current window
    StatusLineNC { }, -- Status lines of not-current windows. Note: If this is equal to "StatusLine" Vim will use "^^^" in the status line of the current window.
    NormalFloat  { bg = Folded.bg.li(20) }, -- Normal text in floating windows.
    Pmenu        { bg = Folded.bg.li(20) }, -- Popup menu: Normal item.
    PmenuSel     { bg = Pmenu.bg.li(20) }, -- Popup menu: Selected item.
    TabLineSel   { Visual }, -- Tab pages line, active tab page label
    DiffDelete   { fg = hsl("#FF70B5").da(15) }, -- Diff mode: Deleted line |diff.txt|
    DiffAdd      { fg = DiffDelete.fg.desaturate(60).da(15) }, -- Diff mode: Added line |diff.txt|
    DiffChange   { fg = DiffDelete.fg.saturate(82).li(30) }, -- Diff mode: Changed line |diff.txt|

    -- ColorColumn  { }, -- Columns set with 'colorcolumn'
    -- Conceal      { }, -- Placeholder characters substituted for concealed text (see 'conceallevel')
    -- Cursor       { }, -- Character under the cursor
    -- lCursor      { }, -- Character under the cursor when |language-mapping| is used (see 'guicursor')
    -- CursorIM     { }, -- Like Cursor, but used when in IME mode |CursorIM|
    -- DiffText     { }, -- Diff mode: Changed text within a changed line |diff.txt|
    -- TermCursor   { }, -- Cursor in a focused terminal
    -- TermCursorNC { }, -- Cursor in an unfocused terminal
    -- ErrorMsg     { }, -- Error messages on the command line
    -- FoldColumn   { }, -- 'foldcolumn'
    -- ModeMsg      { }, -- 'showmode' message (e.g., "-- INSERT -- ")
    -- MsgArea      { }, -- Area for messages and cmdline
    -- MsgSeparator { }, -- Separator for scrolled messages, `msgsep` flag of 'display'
    -- MoreMsg      { }, -- |more-prompt|
    -- NonText      { }, -- '@' at the end of the window, characters from 'showbreak' and other characters that do not really exist in the text (e.g., ">" displayed when a double-wide character doesn't fit at the end of the line). See also |hl-EndOfBuffer|.
    -- NormalNC     { }, -- normal text in non-current windows
    -- PmenuSbar    { }, -- Popup menu: Scrollbar.
    -- PmenuThumb   { }, -- Popup menu: Thumb of the scrollbar.
    -- Question     { }, -- |hit-enter| prompt and yes/no questions
    -- QuickFixLine { }, -- Current |quickfix| item in the quickfix window. Combined with |hl-CursorLine| when the cursor is there.
    -- SpecialKey   { }, -- Unprintable characters: text displayed differently from what it really is. But not 'listchars' whitespace. |hl-Whitespace|
    -- SpellBad     { }, -- Word that is not recognized by the spellchecker. |spell| Combined with the highlighting used otherwise.
    -- SpellCap     { }, -- Word that should start with a capital. |spell| Combined with the highlighting used otherwise.
    -- SpellLocal   { }, -- Word that is recognized by the spellchecker as one that is used in another region. |spell| Combined with the highlighting used otherwise.
    -- SpellRare    { }, -- Word that is recognized by the spellchecker as one that is hardly ever used. |spell| Combined with the highlighting used otherwise.
    -- TabLine      { }, -- Tab pages line, not active tab page label
    -- TabLineFill  { }, -- Tab pages line, where there are no labels
    -- Title        { }, -- Titles for output from ":set all", ":autocmd" etc.
    -- VisualNOS    { }, -- Visual mode selection when vim is "Not Owning the Selection".
    -- WarningMsg   { }, -- Warning messages
    -- WildMenu     { }, -- Current match in 'wildmenu' completion

    -- Common vim syntax groups used for all kinds of code and markup.
    -- Commented-out groups should chain up to their preferred (*) group
    -- by default.
    --
    -- See :h group-name
    --
    -- Uncomment and edit if you want more specific syntax highlighting.

    -- Comment        { }, -- Any comment

    Constant       { fg = hsl("#CDF0EA").rotate(160).da(30) }, -- (*) Any constant
    -- String         { }, --   A string constant: "this is a string"
    -- Character      { }, --   A character constant: 'c', '\n'
    Number         { fg = Normal.fg.rotate(18).li(30) }, --   A number constant: 234, 0xff
    -- Boolean        { }, --   A boolean constant: TRUE, false
    -- Float          { }, --   A floating point constant: 2.3e10

    Identifier     { fg = Normal.fg.li(35) }, -- (*) Any variable name
    -- Function       { }, --   Function name (also: methods for classes)

    Statement      { fg = hsl("#E90C7A") }, -- (*) Any statement
    -- Conditional    { }, --   if, then, else, endif, switch, etc.
    -- Repeat         { }, --   for, do, while, etc.
    Label          { CursorLineNr }, --   case, default, etc.
    -- Operator       { }, --   "sizeof", "+", "*", etc.
    -- Keyword        { }, --   any other keyword
    -- Exception      { }, --   try, catch, throw

    PreProc        { fg = hsl("#FFAAF5").da(20) }, -- (*) Generic Preprocessor
    -- Include        { }, --   Preprocessor #include
    -- Define         { }, --   Preprocessor #define
    -- Macro          { }, --   Same as Define
    -- PreCondit      { }, --   Preprocessor #if, #else, #endif, etc.

    Type           { fg = hsl("#E90CDE") }, -- (*) int, long, char, etc.
    -- StorageClass   { }, --   static, register, volatile, etc.
    -- Structure      { }, --   struct, union, enum, etc.
    -- Typedef        { }, --   A typedef

    Special        { fg = Visual.fg }, -- (*) Any special symbol
    -- SpecialChar    { }, --   Special character in a constant
    -- Tag            { }, --   You can use CTRL-] on this
    -- Delimiter      { }, --   Character that needs attention
    -- SpecialComment { }, --   Special things inside a comment (e.g. '\n')
    -- Debug          { }, --   Debugging statements

    Underlined     { gui = "underline, italic" }, -- Text that stands out, HTML links
    -- Ignore         { }, -- Left blank, hidden |hl-Ignore| (NOTE: May be invisible here in template)
    -- Error          { }, -- Any erroneous construct
    -- Todo           { }, -- Anything that needs extra attention; mostly the keywords TODO FIXME and XXX

    -- These groups are for the native LSP client and diagnostic system. Some
    -- other LSP clients may use these groups, or use their own. Consult your
    -- LSP client's documentation.

    -- See :h lsp-highlight, some groups may not be listed, submit a PR fix to lush-template!
    --
    -- LspReferenceText            { } , -- Used for highlighting "text" references
    -- LspReferenceRead            { } , -- Used for highlighting "read" references
    -- LspReferenceWrite           { } , -- Used for highlighting "write" references
    -- LspCodeLens                 { } , -- Used to color the virtual text of the codelens. See |nvim_buf_set_extmark()|.
    -- LspCodeLensSeparator        { } , -- Used to color the seperator between two or more code lens.
    -- LspSignatureActiveParameter { } , -- Used to highlight the active parameter in the signature help. See |vim.lsp.handlers.signature_help()|.

    -- See :h diagnostic-highlights, some groups may not be listed, submit a PR fix to lush-template!
    --
    DiagnosticError            { fg = hsl("#FF5301") } , -- Used as the base highlight group. Other Diagnostic highlights link to this by default (except Underline)
    DiagnosticWarn             { fg = hsl("#015892") } , -- Used as the base highlight group. Other Diagnostic highlights link to this by default (except Underline)
    DiagnosticInfo             { fg = hsl("#B4AEE8") } , -- Used as the base highlight group. Other Diagnostic highlights link to this by default (except Underline)
    DiagnosticHint             { fg = hsl("#FFC23D").da(35) } , -- Used as the base highlight group. Other Diagnostic highlights link to this by default (except Underline)
    -- DiagnosticVirtualTextError { } , -- Used for "Error" diagnostic virtual text.
    -- DiagnosticVirtualTextWarn  { } , -- Used for "Warn" diagnostic virtual text.
    -- DiagnosticVirtualTextInfo  { } , -- Used for "Info" diagnostic virtual text.
    -- DiagnosticVirtualTextHint  { } , -- Used for "Hint" diagnostic virtual text.
    DiagnosticUnderlineError   { sp = DiagnosticError.fg, gui = "underline" } , -- Used to underline "Error" diagnostics.
    DiagnosticUnderlineWarn    { sp = DiagnosticWarn.fg.li(20), gui = "underline" } , -- Used to underline "Warn" diagnostics.
    DiagnosticUnderlineInfo    { sp = DiagnosticInfo.fg, gui = "underline" } , -- Used to underline "Info" diagnostics.
    DiagnosticUnderlineHint    { sp = DiagnosticHint.fg, gui = "underline" } , -- Used to underline "Hint" diagnostics.
    -- DiagnosticFloatingError    { } , -- Used to color "Error" diagnostic messages in diagnostics float. See |vim.diagnostic.open_float()|
    -- DiagnosticFloatingWarn     { } , -- Used to color "Warn" diagnostic messages in diagnostics float.
    -- DiagnosticFloatingInfo     { } , -- Used to color "Info" diagnostic messages in diagnostics float.
    -- DiagnosticFloatingHint     { } , -- Used to color "Hint" diagnostic messages in diagnostics float.
    -- DiagnosticSignError        { } , -- Used for "Error" signs in sign column.
    -- DiagnosticSignWarn         { } , -- Used for "Warn" signs in sign column.
    -- DiagnosticSignInfo         { } , -- Used for "Info" signs in sign column.
    -- DiagnosticSignHint         { } , -- Used for "Hint" signs in sign column.

    -- Tree-Sitter syntax groups. Most link to corresponding
    -- vim syntax groups (e.g. TSKeyword => Keyword) by default.
    --
    -- See :h nvim-treesitter-highlights, some groups may not be listed, submit a PR fix to lush-template!

    TSBoolean            { fg = hsl(240, 100, 70), gui = "bold" } , -- Boolean literals: `True` and `False` in Python.
    TSComment            { fg = Normal.fg.li(55), gui = "italic" } , -- Line comments and block comments.
    TSCharacter          { Constant } , -- Character literals: `'a'` in C.
    TSString             { TSCharacter } , -- String literals.
    TSConditional        { fg = Normal.fg.rotate(45).li(30), gui = "bold" } , -- Keywords related to conditionals: `if`, `when`, `cond`, etc.
    TSConstant           { fg = hsl("#9ADCFF").da(40), gui = "italic" } , -- Constants identifiers. These might not be semantically constant. E.g. uppercase variables in Python.
    TSKeywordFunction    { fg = Normal.fg.rotate(18).li(30), gui = "bold" } , -- Keywords used to define a function: `function` in Lua, `def` and `lambda` in Python.
    TSDefine             { TSKeywordFunction } , -- Preprocessor #define statements.
    TSFloat              { fg = TSKeywordFunction.fg.da(10), gui = "italic" } , -- Floating-point number literals.
    TSFunction           { fg = TSConstant.fg.rotate(71).li(23), gui = "italic" } , -- Function calls and definitions.
    TSMethod             { TSFunction } , -- Method calls and definitions.
    TSFuncBuiltin        { fg = hsl("#F43C86") } , -- Built-in functions: `print` in Lua.
    TSKeyword            { fg = TSKeywordFunction.fg.li(20) } , -- Keywords that don't fit into other categories.
    TSNumber             { TSFloat } , -- Numeric literals that don't fit into other categories.
    TSOperator           { fg = hsl("#CFFFFE").da(60) } , -- Binary or unary operators: `+`, and also `->` and `*` in C.
    TSParameter          { fg = TSConditional.fg.li(35) } , -- Parameters of a function.
    TSPunctBracket       { fg = Normal.bg.da(30), gui = "bold" } , -- Brackets, braces, parentheses, etc.
    TSRepeat             { TSConditional } , -- Keywords related to loops: `for`, `while`, etc.
    TSVariableBuiltin    { fg = Normal.fg.li(35), gui = "bold" } , -- Variable names defined by the language: `this` or `self` in Javascript.
    TSTypeBuiltin        { fg = TSCharacter.fg.li(20) } , -- Built-in types: `i32` in Rust.
    TSType               { TSRepeat } , -- Type (and class) definitions and annotations.
    TSField              { fg = TSDefine.fg.da(5) } , -- Object and struct fields.
    TSInclude            { fg = TSParameter.fg, gui = "bold" } , -- File or module inclusion keywords: `#include` in C, `use` or `extern crate` in Rust.
    TSConstructor        { TSPunctBracket } , -- Constructor calls and definitions: `{}` in Lua, and Java constructors.
    TSPunctDelimiter     { } , -- Punctuation delimiters: Periods, commas, semicolons, etc.
    TSConstBuiltin       { fg = TSConstant.fg.da(25) } , -- Built-in constant values: `nil` in Lua.
    TSStrong             { fg = TSRepeat.fg, gui = "bold" } , -- Text to be represented in bold.
    TSEmphasis           { fg = TSDefine.fg, gui = "italic" } , -- Text to be represented with emphasis.
    TSUnderline          { fg = TSEmphasis.fg, gui = "italic, underline" } , -- Text to be represented with an underline.
    TSStrike             { fg = TSStrong.fg, gui = "strikethrough, bold" } , -- Strikethrough text.
    TSAttribute          { TSInclude } , -- Annotations that can be attached to the code to denote some kind of meta information. e.g. C++/Dart attributes.
    TSCharacterSpecial   { TSOperator } , -- Special characters.
    TSConstMacro         { TSConstructor } , -- Constants defined by macros: `NULL` in C.
    TSException          { TSConstBuiltin } , -- Exception related keywords: `try`, `except`, `finally` in Python.
    TSKeywordOperator    { TSConstructor } , -- Unary and binary operators that are English words: `and`, `or` in Python; `sizeof` in C.
    TSKeywordReturn      { TSStrong } , -- Keywords like `return` and `yield`.
    TSStringEscape       { fg = TSVariableBuiltin.fg.li(40) } , -- Escape characters within a string: `\n`, `\t`, etc.
    TSStringSpecial      { TSConstructor } , -- Strings with special meaning that don't fit into the previous categories.
    TSSymbol             { TSOperator } , -- Identifiers referring to symbols or atoms.
    TSTag                { fg = TSStrong.fg.da(20) } , -- Tags like HTML tag names.
    TSTagAttribute       { TSConstructor } , -- HTML tag attributes.
    TSTagDelimiter       { fg = TSTag.fg.rotate(180).da(30) } , -- Tag delimiters like `<` `>` `/`.
    TSText               { fg = Normal.fg.li(15) } , -- Non-structured text. Like text in a markup language.
    TSTitle              { TSStrong } , -- Text that is part of a title.
    TSLiteral            { TSText } , -- Literal or verbatim text.
    TSURI                { fg = TSException.fg, gui = "underline, bold" } , -- URIs like hyperlinks or email addresses.
    TSMath               { fg = TSStringEscape.fg.rotate(29).da(50) } , -- Math environments like LaTeX's `$ ... $`
    TSTextReference      { fg = TSText.fg.rotate(10).li(20) } , -- Footnotes, text references, citations, etc.
    TSEnvironment        { TSText } , -- Text environments of markup languages.
    TSEnvironmentName    { TSStringSpecial } , -- Text/string indicating the type of text environment. Like the name of a `\begin` block in LaTeX.
    TSNote               { fg = TSStrong.fg } , -- Text representation of an informational note.
    TSWarning            { fg = TSNote.fg.rotate(70).li(10) } , -- Text representation of a warning note.
    TSDanger             { fg = TSNote.fg.rotate(20).li(10) } , -- Text representation of a danger note.

    -- TSLabel              { } , -- GOTO labels: `label:` in C, and `::label::` in Lua.
    -- TSDebug              { } , -- Debugging statements.
    -- TSError              { } , -- Syntax/parser errors. This might highlight large sections of code while the user is typing still incomplete code, use a sensible highlight.
    -- TSFuncMacro          { } , -- Macro defined functions (calls and definitions): each `macro_rules` in Rust.
    -- TSNamespace          { } , -- Identifiers referring to modules and namespaces.
    -- TSNone               { } , -- No highlighting (sets all highlight arguments to `NONE`). this group is used to clear certain ranges, for example, string interpolations. Don't change the values of this highlight group.
    -- TSParameterReference { } , -- References to parameters of a function.
    -- TSPreProc            { } , -- Preprocessor #if, #else, #endif, etc.
    -- TSProperty           { } , -- Same as `TSField`.
    -- TSPunctSpecial       { } , -- Special punctuation that doesn't fit into the previous categories.
    -- TSStorageClass       { } , -- Keywords that affect how a variable is stored: `static`, `comptime`, `extern`, etc.
    -- TSStringRegex        { } , -- Regular expression literals.
    -- TSVariable           { } , -- Variable names that don't fit into other categories.
  }
end)

-- Return our parsed theme for extension or use elsewhere.
return theme

-- vi:nowrap

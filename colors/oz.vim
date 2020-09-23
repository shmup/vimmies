" oz.vim -- Vim color scheme.
" Author:      Jared Miller (pissss@pm.me)
" Webpage:     https://github.com/shmup/oz
" Description: forked vim-rnb and made it black and lime
" Last Change: 2019-11-27

hi clear
if exists("syntax_on")
  syntax reset
endif

let colors_name = "oz"

if ($TERM =~ '256' || &t_Co >= 256) || has("gui_running")
    hi Normal ctermbg=0 ctermfg=10 cterm=NONE guibg=#000000 guifg=#00ff00 gui=NONE

    set background=dark

    hi NonText ctermbg=NONE ctermfg=10 cterm=NONE guibg=NONE guifg=#00ff00 gui=NONE
    hi EndOfBuffer ctermbg=NONE ctermfg=10 cterm=NONE guibg=NONE guifg=#00ff00 gui=NONE
    hi LineNr ctermbg=0 ctermfg=10 cterm=NONE guibg=#000000 guifg=#00ff00 gui=NONE
    hi FoldColumn ctermbg=0 ctermfg=10 cterm=NONE guibg=#000000 guifg=#00ff00 gui=NONE
    hi Folded ctermbg=0 ctermfg=10 cterm=NONE guibg=#000000 guifg=#00ff00 gui=NONE
    hi MatchParen ctermbg=0 ctermfg=10 cterm=NONE guibg=#000000 guifg=#00ff00 gui=NONE
    hi SignColumn ctermbg=0 ctermfg=10 cterm=NONE guibg=#000000 guifg=#00ff00 gui=NONE
    hi Comment ctermbg=NONE ctermfg=10 cterm=NONE guibg=NONE guifg=#00ff00 gui=NONE
    hi Conceal ctermbg=NONE ctermfg=10 cterm=NONE guibg=NONE guifg=#00ff00 gui=NONE
    hi Constant ctermbg=NONE ctermfg=10 cterm=NONE guibg=NONE guifg=#00ff00 gui=NONE
    hi Error ctermbg=NONE ctermfg=10 cterm=reverse guibg=NONE guifg=#00ff00 gui=reverse
    hi Identifier ctermbg=NONE ctermfg=10 cterm=NONE guibg=NONE guifg=#00ff00 gui=NONE
    hi Ignore ctermbg=NONE ctermfg=NONE cterm=NONE guibg=NONE guifg=NONE gui=NONE
    hi PreProc ctermbg=NONE ctermfg=10 cterm=NONE guibg=NONE guifg=#00ff00 gui=NONE
    hi Special ctermbg=NONE ctermfg=10 cterm=NONE guibg=NONE guifg=#00ff00 gui=NONE
    hi Statement ctermbg=NONE ctermfg=10 cterm=NONE guibg=NONE guifg=#00ff00 gui=NONE
    hi String ctermbg=NONE ctermfg=10 cterm=NONE guibg=NONE guifg=#00ff00 gui=NONE
    hi Todo ctermbg=NONE ctermfg=NONE cterm=reverse guibg=NONE guifg=NONE gui=reverse
    hi Type ctermbg=NONE ctermfg=10 cterm=NONE guibg=NONE guifg=#00ff00 gui=NONE
    hi Underlined ctermbg=NONE ctermfg=10 cterm=underline guibg=NONE guifg=#00ff00 gui=underline
    hi Pmenu ctermbg=0 ctermfg=10 cterm=NONE guibg=#000000 guifg=#00ff00 gui=NONE
    hi PmenuSbar ctermbg=0 ctermfg=NONE cterm=NONE guibg=#000000 guifg=NONE gui=NONE
    hi PmenuSel ctermbg=0 ctermfg=10 cterm=NONE guibg=#000000 guifg=#00ff00 gui=NONE
    hi PmenuThumb ctermbg=0 ctermfg=10 cterm=NONE guibg=#000000 guifg=#00ff00 gui=NONE
    hi ErrorMsg ctermbg=0 ctermfg=10 cterm=NONE guibg=#000000 guifg=#00ff00 gui=NONE
    hi ModeMsg ctermbg=0 ctermfg=10 cterm=NONE guibg=#000000 guifg=#00ff00 gui=NONE
    hi MoreMsg ctermbg=NONE ctermfg=10 cterm=NONE guibg=NONE guifg=#00ff00 gui=NONE
    hi Question ctermbg=NONE ctermfg=10 cterm=NONE guibg=NONE guifg=#00ff00 gui=NONE
    hi WarningMsg ctermbg=NONE ctermfg=10 cterm=NONE guibg=NONE guifg=#00ff00 gui=NONE
    hi TabLine ctermbg=0 ctermfg=10 cterm=NONE guibg=#000000 guifg=#00ff00 gui=NONE
    hi TabLineFill ctermbg=0 ctermfg=10 cterm=NONE guibg=#000000 guifg=#00ff00 gui=NONE
    hi TabLineSel ctermbg=0 ctermfg=10 cterm=NONE guibg=#000000 guifg=#00ff00 gui=NONE
    hi ToolbarLine ctermbg=0 ctermfg=NONE cterm=NONE guibg=#000000 guifg=NONE gui=NONE
    hi ToolbarButton ctermbg=0 ctermfg=10 cterm=NONE guibg=#000000 guifg=#00ff00 gui=NONE
    hi Cursor ctermbg=0 ctermfg=NONE cterm=NONE guibg=#000000 guifg=NONE gui=NONE
    hi CursorColumn ctermbg=0 ctermfg=NONE cterm=NONE guibg=#000000 guifg=NONE gui=NONE
    hi CursorLineNr ctermbg=0 ctermfg=10 cterm=NONE guibg=#000000 guifg=#00ff00 gui=NONE
    hi CursorLine ctermbg=0 ctermfg=NONE cterm=NONE guibg=#000000 guifg=NONE gui=NONE
    hi helpLeadBlank ctermbg=NONE ctermfg=NONE cterm=NONE guibg=NONE guifg=NONE gui=NONE
    hi helpNormal ctermbg=NONE ctermfg=NONE cterm=NONE guibg=NONE guifg=NONE gui=NONE
    hi StatusLine ctermbg=0 ctermfg=10 cterm=NONE guibg=#000000 guifg=#00ff00 gui=NONE
    hi StatusLineNC ctermbg=0 ctermfg=10 cterm=NONE guibg=#000000 guifg=#00ff00 gui=NONE
    hi StatusLineTerm ctermbg=0 ctermfg=10 cterm=NONE guibg=#000000 guifg=#00ff00 gui=NONE
    hi StatusLineTermNC ctermbg=0 ctermfg=10 cterm=NONE guibg=#000000 guifg=#00ff00 gui=NONE
    hi Visual ctermbg=0 ctermfg=10 cterm=reverse guibg=#000000 guifg=#00ff00 gui=reverse
    hi VisualNOS ctermbg=NONE ctermfg=NONE cterm=underline guibg=NONE guifg=NONE gui=underline
    hi VertSplit ctermbg=0 ctermfg=10 cterm=NONE guibg=#000000 guifg=#00ff00 gui=NONE
    hi WildMenu ctermbg=0 ctermfg=10 cterm=NONE guibg=#000000 guifg=#00ff00 gui=NONE
    hi Function ctermbg=NONE ctermfg=10 cterm=NONE guibg=NONE guifg=#00ff00 gui=NONE
    hi SpecialKey ctermbg=NONE ctermfg=10 cterm=NONE guibg=NONE guifg=#00ff00 gui=NONE
    hi Title ctermbg=NONE ctermfg=10 cterm=NONE guibg=NONE guifg=#00ff00 gui=NONE
    hi DiffAdd ctermbg=0 ctermfg=10 cterm=reverse guibg=#000000 guifg=#00ff00 gui=reverse
    hi DiffChange ctermbg=0 ctermfg=10 cterm=reverse guibg=#000000 guifg=#00ff00 gui=reverse
    hi DiffDelete ctermbg=0 ctermfg=10 cterm=reverse guibg=#000000 guifg=#00ff00 gui=reverse
    hi DiffText ctermbg=0 ctermfg=10 cterm=reverse guibg=#000000 guifg=#00ff00 gui=reverse
    hi IncSearch ctermbg=0 ctermfg=10 cterm=reverse guibg=#000000 guifg=#00ff00 gui=reverse
    hi Search ctermbg=0 ctermfg=10 cterm=reverse guibg=#000000 guifg=#00ff00 gui=reverse
    hi Directory ctermbg=NONE ctermfg=10 cterm=NONE guibg=NONE guifg=#00ff00 gui=NONE
    hi debugPC ctermbg=0 ctermfg=NONE cterm=NONE guibg=#000000 guifg=NONE gui=NONE
    hi debugBreakpoint ctermbg=0 ctermfg=NONE cterm=NONE guibg=#000000 guifg=NONE gui=NONE
    hi SpellBad ctermbg=NONE ctermfg=10 cterm=undercurl guibg=NONE guifg=#00ff00 gui=undercurl guisp=#00ff00
    hi SpellCap ctermbg=NONE ctermfg=10 cterm=undercurl guibg=NONE guifg=#00ff00 gui=undercurl guisp=#00ff00
    hi SpellLocal ctermbg=NONE ctermfg=10 cterm=undercurl guibg=NONE guifg=#00ff00 gui=undercurl guisp=#00ff00
    hi SpellRare ctermbg=NONE ctermfg=10 cterm=undercurl guibg=NONE guifg=#00ff00 gui=undercurl guisp=#00ff00
    hi ColorColumn ctermbg=0 ctermfg=NONE cterm=NONE guibg=#000000 guifg=NONE gui=NONE

elseif &t_Co == 8 || $TERM !~# '^linux' || &t_Co == 16
    set t_Co=16

    hi Normal ctermbg=black ctermfg=lime cterm=NONE

    set background=dark

    hi NonText ctermbg=NONE ctermfg=lime cterm=NONE
    hi EndOfBuffer ctermbg=NONE ctermfg=lime cterm=NONE
    hi LineNr ctermbg=black ctermfg=lime cterm=NONE
    hi FoldColumn ctermbg=black ctermfg=lime cterm=NONE
    hi Folded ctermbg=black ctermfg=lime cterm=NONE
    hi MatchParen ctermbg=black ctermfg=lime cterm=NONE
    hi SignColumn ctermbg=black ctermfg=lime cterm=NONE
    hi Comment ctermbg=NONE ctermfg=lime cterm=NONE
    hi Conceal ctermbg=NONE ctermfg=lime cterm=NONE
    hi Constant ctermbg=NONE ctermfg=lime cterm=NONE
    hi Error ctermbg=NONE ctermfg=lime cterm=reverse
    hi Identifier ctermbg=NONE ctermfg=lime cterm=NONE
    hi Ignore ctermbg=NONE ctermfg=NONE cterm=NONE
    hi PreProc ctermbg=NONE ctermfg=lime cterm=NONE
    hi Special ctermbg=NONE ctermfg=lime cterm=NONE
    hi Statement ctermbg=NONE ctermfg=lime cterm=NONE
    hi String ctermbg=NONE ctermfg=lime cterm=NONE
    hi Todo ctermbg=NONE ctermfg=NONE cterm=reverse
    hi Type ctermbg=NONE ctermfg=lime cterm=NONE
    hi Underlined ctermbg=NONE ctermfg=lime cterm=underline
    hi Pmenu ctermbg=black ctermfg=lime cterm=NONE
    hi PmenuSbar ctermbg=black ctermfg=NONE cterm=NONE
    hi PmenuSel ctermbg=black ctermfg=lime cterm=NONE
    hi PmenuThumb ctermbg=black ctermfg=lime cterm=NONE
    hi ErrorMsg ctermbg=black ctermfg=lime cterm=NONE
    hi ModeMsg ctermbg=black ctermfg=lime cterm=NONE
    hi MoreMsg ctermbg=NONE ctermfg=lime cterm=NONE
    hi Question ctermbg=NONE ctermfg=lime cterm=NONE
    hi WarningMsg ctermbg=NONE ctermfg=lime cterm=NONE
    hi TabLine ctermbg=black ctermfg=lime cterm=NONE
    hi TabLineFill ctermbg=black ctermfg=lime cterm=NONE
    hi TabLineSel ctermbg=black ctermfg=lime cterm=NONE
    hi ToolbarLine ctermbg=black ctermfg=NONE cterm=NONE
    hi ToolbarButton ctermbg=black ctermfg=lime cterm=NONE
    hi Cursor ctermbg=black ctermfg=NONE cterm=NONE
    hi CursorColumn ctermbg=black ctermfg=NONE cterm=NONE
    hi CursorLineNr ctermbg=black ctermfg=lime cterm=NONE
    hi CursorLine ctermbg=black ctermfg=NONE cterm=NONE
    hi helpLeadBlank ctermbg=NONE ctermfg=NONE cterm=NONE
    hi helpNormal ctermbg=NONE ctermfg=NONE cterm=NONE
    hi StatusLine ctermbg=black ctermfg=lime cterm=NONE
    hi StatusLineNC ctermbg=black ctermfg=lime cterm=NONE
    hi StatusLineTerm ctermbg=black ctermfg=lime cterm=NONE
    hi StatusLineTermNC ctermbg=black ctermfg=lime cterm=NONE
    hi Visual ctermbg=black ctermfg=lime cterm=reverse
    hi VisualNOS ctermbg=NONE ctermfg=NONE cterm=underline
    hi VertSplit ctermbg=black ctermfg=lime cterm=NONE
    hi WildMenu ctermbg=black ctermfg=lime cterm=NONE
    hi Function ctermbg=NONE ctermfg=lime cterm=NONE
    hi SpecialKey ctermbg=NONE ctermfg=lime cterm=NONE
    hi Title ctermbg=NONE ctermfg=lime cterm=NONE
    hi DiffAdd ctermbg=black ctermfg=lime cterm=reverse
    hi DiffChange ctermbg=black ctermfg=lime cterm=reverse
    hi DiffDelete ctermbg=black ctermfg=lime cterm=reverse
    hi DiffText ctermbg=black ctermfg=lime cterm=reverse
    hi IncSearch ctermbg=black ctermfg=lime cterm=reverse
    hi Search ctermbg=black ctermfg=lime cterm=reverse
    hi Directory ctermbg=NONE ctermfg=lime cterm=NONE
    hi debugPC ctermbg=black ctermfg=NONE cterm=NONE
    hi debugBreakpoint ctermbg=black ctermfg=NONE cterm=NONE
    hi SpellBad ctermbg=NONE ctermfg=lime cterm=undercurl
    hi SpellCap ctermbg=NONE ctermfg=lime cterm=undercurl
    hi SpellLocal ctermbg=NONE ctermfg=lime cterm=undercurl
    hi SpellRare ctermbg=NONE ctermfg=lime cterm=undercurl
    hi ColorColumn ctermbg=black ctermfg=NONE cterm=NONE
endif

hi link Terminal Normal
hi link Number Constant
hi link CursorIM Cursor
hi link Boolean Constant
hi link Character Constant
hi link Conditional Statement
hi link Debug Special
hi link Define PreProc
hi link Delimiter Special
hi link Exception Statement
hi link Float Number
hi link HelpCommand Statement
hi link HelpExample Statement
hi link Include PreProc
hi link Keyword Statement
hi link Label Statement
hi link Macro PreProc
hi link Number Constant
hi link Operator Statement
hi link PreCondit PreProc
hi link Repeat Statement
hi link SpecialChar Special
hi link SpecialComment Special
hi link StorageClass Type
hi link Structure Type
hi link Tag Special
hi link Terminal Normal
hi link Typedef Type
hi link htmlEndTag htmlTagName
hi link htmlLink Function
hi link htmlSpecialTagName htmlTagName
hi link htmlTag htmlTagName
hi link htmlBold Normal
hi link htmlItalic Normal
hi link xmlTag Statement
hi link xmlTagName Statement
hi link xmlEndTag Statement
hi link markdownItalic Preproc
hi link asciidocQuotedEmphasized Preproc
hi link diffBDiffer WarningMsg
hi link diffCommon WarningMsg
hi link diffDiffer WarningMsg
hi link diffIdentical WarningMsg
hi link diffIsA WarningMsg
hi link diffNoEOL WarningMsg
hi link diffOnly WarningMsg
hi link diffRemoved WarningMsg
hi link diffAdded String
hi link QuickFixLine Search

let g:terminal_ansi_colors = [
        \ '#000000',
        \ '#00ff00',
        \ '#00ff00',
        \ '#00ff00',
        \ '#00ff00',
        \ '#00ff00',
        \ '#00ff00',
        \ '#00ff00',
        \ '#00ff00',
        \ '#00ff00',
        \ '#00ff00',
        \ '#00ff00',
        \ '#00ff00',
        \ '#00ff00',
        \ '#00ff00',
        \ '#00ff00',
        \ ]

" Generated with RNB (https://github.com/romainl/vim-rnb)

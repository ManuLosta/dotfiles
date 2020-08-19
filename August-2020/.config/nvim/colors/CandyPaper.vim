" Color Scheme: CandyPaper
" Author: DF_XYZ
" License: MIT
" Source: http://github.com/dfxyz/CandyPaper.vim

highlight clear
if exists("syntax_on")
    syntax reset
endif
let colors_name = "CandyPaper"

" Convert HSV to RGB; returns an RGB triple
" See also: https://en.wikipedia.org/wiki/HSL_and_HSV#From_HSV
function! s:hsv2rgb(hsv) "{{{
    let l:h = a:hsv[0] / 60.0
    let l:s = a:hsv[1] / 100.0
    let l:v = a:hsv[2] / 100.0

    let l:c = l:s * l:v
    let l:x = l:c * (1 - abs(float2nr(l:h) % 2 + l:h - float2nr(l:h) - 1))

    if 0 <= l:h && l:h < 1
        let l:rgb = [l:c, l:x, 0]
    elseif 1 <= l:h && l:h < 2
        let l:rgb = [l:x, l:c, 0]
    elseif 2 <= l:h && l:h < 3
        let l:rgb = [0, l:c, l:x]
    elseif 3 <= l:h && l:h < 4
        let l:rgb = [0, l:x, l:c]
    elseif 4 <= l:h && l:h < 5
        let l:rgb = [l:x, 0, l:c]
    elseif 5 <= l:h && l:h < 6
        let l:rgb = [l:c, 0, l:x]
    else
        let l:rgb = [0, 0, 0]
    endif

    let l:m = l:v - l:c
    let l:rgb[0] = float2nr(round(255 * (l:rgb[0] + l:m)))
    let l:rgb[1] = float2nr(round(255 * (l:rgb[1] + l:m)))
    let l:rgb[2] = float2nr(round(255 * (l:rgb[2] + l:m)))

    return l:rgb
endfunction "}}}

" Convert RGB triple to a hex string
function! s:rgb2hex(rgb) "{{{
    return printf("#%02x%02x%02x", a:rgb[0], a:rgb[1], a:rgb[2])
endfunction "}}}

" Converts given grey level to approximate grey number
" Available grey levels in 256-color pallete: [0, 8, 18, 28, ..., 238, 255]
function! s:grey_number(grey_level) "{{{
    if a:grey_level <= 4
        return 0
    elseif a:grey_level >= 247
        return 24
    endif

    let l:i = 1
    let l:n = 13
    while 1
        if a:grey_level <= l:n
            return l:i > 23 ? 23 : l:i
        endif
        let l:i += 1
        let l:n += 10
    endwhile
endfunction "}}}

" Converts given grey number to grey level
function! s:grey_level(grey_number) "{{{
    if a:grey_number == 0
        return 0
    elseif a:grey_number > 23
        return 255
    else
        return (a:grey_number - 1) * 10 + 8
    endif
endfunction "}}}

" Converts given grey number to 256-color palette index
function! s:grey_index(grey_number) "{{{
    if a:grey_number == 0
        return 16 " black
    elseif a:grey_number > 23
        return 231 " white
    else
        return 231 + a:grey_number " grey
    endif
endfunction "}}}

" Converts given color level to approximate color number
" Available color levels in 256-color palette: [0, 95, 135, 175, 215, 255]
function! s:color_number(color_level) "{{{
    if a:color_level <= 48
        return 0
    endif

    let l:i = 1
    let l:n = 115
    while 1
        if a:color_level <= l:n
            return l:i
        endif
        let l:i += 1
        let l:n += 40
    endwhile
endfunction "}}}

" Converts given color number to color level
function! s:color_level(color_number) "{{{
    if a:color_number == 0
        return 0
    else
        return 55 + a:color_number * 40
    endif
endfunction "}}}

" Converts given color numbers to 256-color palette index
function! s:color_index(r_number, g_number, b_number) "{{{
    return 16 + 36 * a:r_number + 6 * a:g_number + a:b_number
endfunction "}}}

" Converts RGB triple to 256-color palette index
function! s:rgb2index(rgb) "{{{
    let [l:r, l:g, l:b] = a:rgb

    let l:grey_number_r = s:grey_number(l:r)
    let l:grey_number_g = s:grey_number(l:g)
    let l:grey_number_b = s:grey_number(l:b)

    let l:color_number_r = s:color_number(l:r)
    let l:color_number_g = s:color_number(l:g)
    let l:color_number_b = s:color_number(l:b)

    if l:grey_number_r == l:grey_number_g && l:grey_number_g == l:grey_number_b
        let l:diff_r = s:grey_level(l:grey_number_r) - l:r
        let l:diff_g = s:grey_level(l:grey_number_g) - l:g
        let l:diff_b = s:grey_level(l:grey_number_b) - l:b
        let l:diff_grey = (l:diff_r * l:diff_r) + (l:diff_g * l:diff_g)
                    \ + (l:diff_b * l:diff_b)

        let l:diff_r = s:color_level(l:color_number_r) - l:r
        let l:diff_g = s:color_level(l:color_number_g) - l:g
        let l:diff_b = s:color_level(l:color_number_b) - l:b
        let l:diff_color = (l:diff_r * l:diff_r) + (l:diff_g * l:diff_g)
                    \ + (l:diff_b * l:diff_b)

        if l:diff_grey < l:diff_color
            return s:grey_index(l:grey_number_r)
        endif
    endif

    return s:color_index(l:color_number_r, l:color_number_g, l:color_number_b)
endfunction "}}}

" Scheme related functions and variables
" {{{
let s:light_scheme = {}
let s:dark_scheme = {}
function! s:register(map, group, settings) "{{{
    if type(a:settings) == v:t_string " link {group} to {settings}
        let a:map[a:group] = a:settings
        return
    endif

    let a:map[a:group] = {}
    if has_key(a:settings, "fg")
        let l:fg = a:settings["fg"]
        if type(l:fg) == v:t_string " use same settings from registered group
            let a:map[a:group]["guifg"] = a:map[l:fg]["guifg"]
            let a:map[a:group]["ctermfg"] = a:map[l:fg]["ctermfg"]
        else
            let l:rgb = s:hsv2rgb(l:fg)
            let a:map[a:group]["guifg"] = s:rgb2hex(l:rgb)
            let a:map[a:group]["ctermfg"] = s:rgb2index(l:rgb)
        endif
    endif
    if has_key(a:settings, "bg")
        let l:bg = a:settings["bg"]
        if type(l:bg) == v:t_string " use same settings from registered group
            let a:map[a:group]["guibg"] = a:map[l:bg]["guibg"]
            let a:map[a:group]["ctermbg"] = a:map[l:bg]["ctermbg"]
        else
            let l:rgb = s:hsv2rgb(l:bg)
            let a:map[a:group]["guibg"] = s:rgb2hex(l:rgb)
            let a:map[a:group]["ctermbg"] = s:rgb2index(l:rgb)
        endif
    endif
    if has_key(a:settings, "attr")
        let l:attr = a:settings["attr"]
        let a:map[a:group]["gui"] = l:attr
        let a:map[a:group]["cterm"] = l:attr
    endif
endfunction "}}}

function! s:light(group, settings) "{{{
    call s:register(s:light_scheme, a:group, a:settings)
endfunction "}}}

function! s:dark(group, settings) "{{{
    call s:register(s:dark_scheme, a:group, a:settings)
endfunction "}}}

function! s:apply_scheme() "{{{
    if &background == "light"
        let l:scheme = s:light_scheme
    else
        let l:scheme = s:dark_scheme
    endif

    for [group, settings] in items(l:scheme)
        exec "highlight clear " . group
        if type(settings) == v:t_string " link {group} to {settings}
            exec "highlight! link " . group . " " . settings
            continue
        endif

        let l:cmd = "highlight " . group
        for key in ["guifg", "guibg", "gui", "ctermfg", "ctermbg", "cterm"]
            if has_key(settings, key)
                let l:cmd = l:cmd . " " . key . "=" . settings[key]
            endif
        endfor
        exec l:cmd
    endfor
endfunction "}}}
" }}}

" Light Scheme - Standard Syntax Groups
" {{{
    call s:light("Normal", {"fg": [210, 50, 50], "bg": [75, 5, 100]})
    call s:light("Comment", {"fg": [90, 50, 50]})
    call s:light("Constant", {"fg": [300, 80, 80]})
    call s:light("String", {"fg": [180, 80, 60]})
    call s:light("Character", "String")
    call s:light("Number", {"fg": [30, 80, 70]})
    call s:light("Identifier", {"fg": [210, 80, 80]})
    call s:light("Statement", {"fg": [120, 80, 50]})
    call s:light("Operator", {"fg": "Normal"})
    call s:light("PreProc", {"fg": [270, 80, 80]})
    call s:light("Type", {"fg": "Statement"})
    call s:light("Special", {"fg": "PreProc"})
    call s:light("Underlined", {"fg": [240, 80, 80], "attr": "underline"})
    call s:light("Error", {"bg": [0, 20, 100]})
    call s:light("Todo", {"bg": [60, 100, 90]})
    call s:light("MatchParen", {"bg": [150, 20, 90]})
" }}}
" Light Scheme - Standard Highlighting Groups
" {{{
    call s:light("SpecialKey", {"fg": "Special"})
    call s:light("NonText", {"fg": [210, 30, 60]})
    call s:light("Directory", {"fg": "Identifier"})
    call s:light("Question", {"fg": "Statement"})
    call s:light("Title", {"fg": "Normal"})
    call s:light("Conceal", {"fg": "PreProc"})

    call s:light("ErrorMsg", {"fg": [0, 80, 80]})
    call s:light("WarningMsg", {"fg": [60, 80, 50]})
    call s:light("MoreMsg", {"fg": "Statement"})
    call s:light("ModeMsg", {"fg": "Normal"})

    call s:light("IncSearch", {"bg": [60, 100, 90], "attr": "underline"})
    call s:light("Search", {"bg": [120, 30, 90]})

    call s:light("CursorLine", {"bg": [75, 5, 95]})
    call s:light("LineNr", {"fg": "NonText"})
    call s:light("CursorLineNr", {"fg": "NonText", "bg": "CursorLine"})
    call s:light("CursorColumn", "CursorLine")
    call s:light("ColorColumn", {"bg": [75, 5, 90]})

    call s:light("StatusLine", {"bg": [120, 5, 90]})
    call s:light("StatusLineNC", {"fg": [120, 5, 70], "bg": "StatusLine"})
    call s:light("StatusLineTerm", "StatusLine")
    call s:light("StatusLineTermNC", "StatusLineNC")
    call s:light("VertSplit", {"bg": "StatusLine"})

    call s:light("Visual", {"bg": [90, 30, 90]})
    call s:light("VisualNOS", "Visual")

    call s:light("WildMenu", {"bg": "Search"})

    call s:light("Folded", {"fg": [210, 50, 80], "bg": [150, 10, 90]})
    call s:light("FoldColumn", {"fg": "NonText"})

    call s:light("DiffAdd", {"bg": [120, 20, 90]})
    call s:light("DiffDelete", {"fg": "NonText", "bg": [75, 5, 85]})
    call s:light("DiffChange", {"bg": [210, 10, 100]})
    call s:light("DiffText", {"bg": [210, 20, 100]})

    call s:light("SignColumn", {"fg": "ErrorMsg"})

    call s:light("Pmenu", {"bg": "StatusLine"})
    call s:light("PmenuSel", {"bg": "Search"})
    call s:light("PmenuSbar", {"bg": "StatusLine"})
    call s:light("PmenuThumb", {"bg": [120, 5, 80]})

    call s:light("TabLine", {"fg": "NonText", "bg": "ColorColumn"})
    call s:light("TabLineSel", {"fg": "Normal"})
    call s:light("TabLineFill", {"bg": "ColorColumn"})
" }}}
" Light Scheme - Other Groups
" {{{
    call s:light("htmlTag", "Statement")
    call s:light("htmlEndTag", "Statement")
    call s:light("htmlArg", "Identifier")
    call s:light("htmlSpecialChar", "Number")

    call s:light("xmlTag", "Statement")
    call s:light("xmlEndTag", "Statement")
    call s:light("xmlTagName", "Statement")
    call s:light("xmlDocTypeDecl", "Statement")
    call s:light("xmlAttrib", "Identifier")
    call s:light("xmlAttribPunct", "Identifier")
    call s:light("xmlEntity", "Number")
    call s:light("xmlEntityPunct", "Number")
" }}}

" Dark Scheme - Standard Syntax Groups
" {{{
    call s:dark("Normal", {"fg": [90, 20, 70], "bg": [210, 20, 20]})
    call s:dark("Comment", {"fg": [45, 20, 70]})
    call s:dark("Constant", {"fg": [330, 30, 80]})
    call s:dark("String", {"fg": [180, 50, 70]})
    call s:dark("Character", "String")
    call s:dark("Number", {"fg": [30, 50, 70]})
    call s:dark("Identifier", {"fg": [210, 50, 80]})
    call s:dark("Statement", {"fg": [120, 50, 70]})
    call s:dark("Operator", {"fg": "Normal"})
    call s:dark("PreProc", {"fg": [270, 30, 80]})
    call s:dark("Type", {"fg": "Statement"})
    call s:dark("Special", {"fg": [270, 30, 80]})
    call s:dark("Underlined", {"fg": [210, 50, 80], "attr": "underline"})
    call s:dark("Error", {"bg": [0, 50, 30]})
    call s:dark("Todo", {"fg": [60, 50, 70]})
    call s:dark("MatchParen", {"bg": [150, 30, 40]})
" }}}
" Dark Scheme - Standard Highlighting Groups
" {{{
    call s:dark("SpecialKey", "Special")
    call s:dark("NonText", {"fg": [90, 10, 60]})
    call s:dark("Directory", {"fg": "Identifier"})
    call s:dark("Question", {"fg": "Statement"})
    call s:dark("Title", {"fg": "Normal"})
    call s:dark("Conceal", {"fg": "PreProc"})

    call s:dark("ErrorMsg", {"fg": [0, 50, 80]})
    call s:dark("WarningMsg", {"fg": [60, 50, 60]})
    call s:dark("MoreMsg", {"fg": "Statement"})
    call s:dark("ModeMsg", {"fg": "Normal"})

    call s:dark("IncSearch", {"bg": [60, 100, 40], "attr":"underline"})
    call s:dark("Search", {"bg": [90, 100, 40]})

    call s:dark("CursorLine", {"bg": [210, 20, 25]})
    call s:dark("LineNr", {"fg": "NonText"})
    call s:dark("CursorLineNr", {"fg": "NonText", "bg": "CursorLine"})
    call s:dark("CursorColumn", "CursorLine")
    call s:dark("ColorColumn", {"bg": [210, 20, 40]})

    call s:dark("StatusLine", {"bg": [210, 40, 40]})
    call s:dark("StatusLineNC", {"fg": [90, 10, 50], "bg": "StatusLine"})
    call s:dark("StatusLineTerm", "StatusLine")
    call s:dark("StatusLineTermNC", "StatusLineNC")
    call s:dark("VertSplit", {"bg": "StatusLine"})

    call s:dark("Visual", {"bg": [210, 50, 40]})
    call s:dark("VisualNOS", "Visual")

    call s:dark("WildMenu", {"bg": "Search"})

    call s:dark("Folded", {"fg": [90, 40, 60], "bg": [180, 30, 30]})
    call s:dark("FoldColumn", {"fg": "NonText"})

    call s:dark("DiffAdd", {"bg": [120, 30, 30]})
    call s:dark("DiffDelete", {"fg": "NonText", "bg": [0, 0, 30]})
    call s:dark("DiffChange", {"bg": [210, 25, 40]})
    call s:dark("DiffText", {"bg": [210, 50, 40]})

    call s:dark("SignColumn", {"fg": "ErrorMsg"})

    call s:dark("Pmenu", {"fg": "Normal", "bg": "StatusLine"})
    call s:dark("PmenuSel", {"fg": "Normal", "bg": "Search"})
    call s:dark("PmenuSbar", {"bg": "StatusLine"})
    call s:dark("PmenuThumb", {"bg": [210, 20, 50]})

    call s:dark("TabLine", {"fg": "NonText", "bg": "ColorColumn"})
    call s:dark("TabLineSel", {"fg": "Normal"})
    call s:dark("TabLineFill", {"bg": "ColorColumn"})
" }}}
" Dark Scheme - Other Groups
" {{{
    call s:dark("htmlTag", "Statement")
    call s:dark("htmlEndTag", "Statement")
    call s:dark("htmlArg", "Identifier")
    call s:dark("htmlSpecialChar", "Number")

    call s:dark("xmlTag", "Statement")
    call s:dark("xmlEndTag", "Statement")
    call s:dark("xmlTagName", "Statement")
    call s:dark("xmlDocTypeDecl", "Statement")
    call s:dark("xmlAttrib", "Identifier")
    call s:dark("xmlAttribPunct", "Identifier")
    call s:dark("xmlEntity", "Number")
    call s:dark("xmlEntityPunct", "Number")
" }}}

call s:apply_scheme()

" vim: fdm=marker fmr={{{,}}}

" Colorshceme

set background=dark
hi clear
if exists("syntax_on")
	syntax reset
endif

let g:colors_name = "colors"

let s:t_Co = exists('&t_Co') && !empty(&t_Co) && &t_Co > 1 ? &t_Co : 2

if (has('termguicolors') && &termguicolors) || has('gui_running')
  let g:terminal_ansi_colors = ['#282a36', '#f37f97', '#5ae6b4', '#f7ca7a',
        \ '#8297f4', '#f59cff', '#79e6f3', '#fdfdfd', '#414458', '#ffa3c3',
        \ '#9be6cb', '#ffe7a9', '#8ab1ff', '#f59cff', '#a2ffff', '#fdfdfd']
  if has('nvim')
    let g:terminal_color_0 = '#282a36'
    let g:terminal_color_1 = '#f37f97'
    let g:terminal_color_2 = '#5ae6b4'
    let g:terminal_color_3 = '#f7ca7a'
    let g:terminal_color_4 = '#8297f4'
    let g:terminal_color_5 = '#f59cff'
    let g:terminal_color_6 = '#79e6f3'
    let g:terminal_color_7 = '#fdfdfd'
    let g:terminal_color_8 = '#414458'
    let g:terminal_color_9 = '#ffa3c3'
    let g:terminal_color_10 = '#9be6cb'
    let g:terminal_color_11 = '#ffe7a9'
    let g:terminal_color_12 = '#8ab1ff'
    let g:terminal_color_13 = '#f59cff'
    let g:terminal_color_14 = '#a2ffff'
    let g:terminal_color_15 = '#bebec1'
  endif
  if !exists('g:xcodedark_green_comments')
    let g:xcodedark_green_comments = 0
  endif
  if !exists('g:xcodedark_emph_types')
    let g:xcodedark_emph_types = 1
  endif
  if !exists('g:xcodedark_emph_funcs')
    let g:xcodedark_emph_funcs = 0
  endif
  if !exists('g:xcodedark_emph_idents')
    let g:xcodedark_emph_idents = 0
  endif
  if !exists('g:xcodedark_match_paren_style')
    let g:xcodedark_match_paren_style = 0
  endif
  if !exists('g:xcodedark_dim_punctuation')
    let g:xcodedark_dim_punctuation = 1
  endif
  hi Normal guifg=#fdfdfd guibg=#1d1f28 guisp=NONE gui=NONE cterm=NONE
  hi Cursor guifg=#292a30 guibg=#fdfdfd guisp=NONE gui=NONE cterm=NONE
  hi None guifg=#fdfdfd guibg=NONE guisp=NONE gui=NONE cterm=NONE
  hi CursorLineNr guifg=#fdfdfd guibg=#2f3037 guisp=NONE gui=NONE cterm=NONE
  hi EndOfBuffer guifg=#1d1f28 guibg=#1d1f28 guisp=NONE gui=NONE cterm=NONE
  hi FoldColumn guifg=#414458 guibg=NONE guisp=NONE gui=NONE cterm=NONE
  hi Folded guifg=#414458 guibg=#393b44 guisp=NONE gui=NONE cterm=NONE
  hi LineNr guifg=#414458 guibg=NONE guisp=NONE gui=NONE cterm=NONE
  hi MatchWord guifg=#fdfdfd guibg=#0f5bca guisp=NONE gui=NONE cterm=NONE
  hi SignColumn guifg=#414458 guibg=NONE guisp=NONE gui=NONE cterm=NONE
  hi Signify guifg=#4484d1 guibg=NONE guisp=NONE gui=NONE cterm=NONE
  hi Ignore guifg=#414458 guibg=NONE guisp=NONE gui=NONE cterm=NONE
  hi Pmenu guifg=#fdfdfd guibg=#393b44 guisp=NONE gui=NONE cterm=NONE
  hi PmenuSbar guifg=#393b44 guibg=#393b44 guisp=NONE gui=NONE cterm=NONE
  hi PmenuSel guifg=#fdfdfd guibg=#0f5bca guisp=NONE gui=NONE cterm=NONE
  hi PmenuThumb guifg=#282a36 guibg=#414453 guisp=NONE gui=NONE cterm=NONE
  hi ErrorMsg guifg=#f37f97 guibg=NONE guisp=NONE gui=NONE cterm=NONE
  hi ModeMsg guifg=#414458 guibg=NONE guisp=NONE gui=NONE cterm=NONE
  hi MoreMsg guifg=#f59cff guibg=NONE guisp=NONE gui=NONE cterm=NONE
  hi Question guifg=#f59cff guibg=NONE guisp=NONE gui=NONE cterm=NONE
  hi WarningMsg guifg=#ffe7a9 guibg=NONE guisp=NONE gui=NONE cterm=NONE
  hi ColorColumn guifg=NONE guibg=#2f3037 guisp=NONE gui=NONE cterm=NONE
  hi CursorColumn guifg=NONE guibg=#2f3037 guisp=NONE gui=NONE cterm=NONE
  hi CursorLine guifg=NONE guibg=#2f3037 guisp=NONE gui=NONE cterm=NONE
  hi QuickFixLine guifg=#fdfdfd guibg=#0f5bca guisp=NONE gui=NONE cterm=NONE
  hi StatusLine guifg=#fdfdfd guibg=#282a36 guisp=NONE gui=NONE cterm=NONE
  hi StatusLineNC guifg=#414458 guibg=#393b44 guisp=NONE gui=NONE cterm=NONE
  hi VertSplit guifg=#393b44 guibg=#393b44 guisp=NONE gui=NONE cterm=NONE
  hi WildMenu guifg=#fdfdfd guibg=#0f5bca guisp=NONE gui=NONE cterm=NONE
  hi IncSearch guifg=#292a30 guibg=#fef937 guisp=NONE gui=NONE cterm=NONE
  hi Search guifg=#fdfdfd guibg=#282a36 guisp=NONE gui=NONE cterm=NONE
  hi Visual guifg=NONE guibg=#414458 guisp=NONE gui=NONE cterm=NONE
  hi DiffAdd guifg=#9be6cb guibg=#243330 guisp=NONE gui=NONE cterm=NONE
  hi DiffChange guifg=#ffe7a9 guibg=NONE guisp=NONE gui=NONE cterm=NONE
  hi DiffDelete guifg=#f37f97 guibg=#3b2d2b guisp=NONE gui=NONE cterm=NONE
  hi DiffText guifg=#ffe7a9 guibg=#382e27 guisp=NONE gui=NONE cterm=NONE
  hi Comment guifg=#7f8c98 guibg=NONE guisp=NONE gui=NONE cterm=NONE
  hi Error guifg=#292a30 guibg=#f37f97 guisp=NONE gui=NONE cterm=NONE
  hi PreProc guifg=#ffe7a9 guibg=NONE guisp=NONE gui=NONE cterm=NONE
  hi Special guifg=#5ae6b4 guibg=NONE guisp=NONE gui=NONE cterm=NONE
  hi Statement guifg=#f59cff guibg=NONE guisp=NONE gui=bold cterm=bold
  hi Character guifg=#f7ca7a guibg=NONE guisp=NONE gui=NONE cterm=NONE
  hi Directory guifg=#8ab1ff guibg=NONE guisp=NONE gui=NONE cterm=NONE
  hi Number guifg=#f7ca7a guibg=NONE guisp=NONE gui=NONE cterm=NONE
  hi SpecialComment guifg=#a3b1bf guibg=NONE guisp=NONE gui=NONE cterm=NONE
  hi String guifg=#f37f97 guibg=NONE guisp=NONE gui=NONE cterm=NONE
  hi Title guifg=#fdfdfd guibg=NONE guisp=NONE gui=bold cterm=bold
  hi Todo guifg=#a3b1bf guibg=NONE guisp=NONE gui=bold cterm=bold
  hi Underlined guifg=#8ab1ff guibg=NONE guisp=NONE gui=underline cterm=underline
  hi SpellBad guifg=NONE guibg=NONE guisp=NONE gui=undercurl ctermfg=NONE ctermbg=NONE cterm=undercurl
  hi SpellCap guifg=NONE guibg=NONE guisp=NONE gui=undercurl ctermfg=NONE ctermbg=NONE cterm=undercurl
  hi SpellLocal guifg=NONE guibg=NONE guisp=NONE gui=undercurl ctermfg=NONE ctermbg=NONE cterm=undercurl
  hi SpellRare guifg=NONE guibg=NONE guisp=NONE gui=undercurl ctermfg=NONE ctermbg=NONE cterm=undercurl
  let g:indentLine_color_gui  = '#414458'
  let g:indentLine_color_term = 59
  let g:limelight_conceal_guifg = '#414458'
  let g:limelight_conceal_ctermfg = 245
  hi! link Terminal Normal
  hi! link TabLine StatusLineNC
  hi! link TabLineFill StatusLineNC
  hi! link TabLineSel StatusLine
  hi! link StatusLineTerm StatusLine
  hi! link StatusLineTermNC StatusLineNC
  hi! link VisualNOS Visual
  hi! link MsgArea Title
  hi! link diffAdded DiffAdd
  hi! link diffBDiffer WarningMsg
  hi! link diffChanged DiffChange
  hi! link diffCommon WarningMsg
  hi! link diffDiffer WarningMsg
  hi! link diffFile Directory
  hi! link diffIdentical WarningMsg
  hi! link diffIndexLine Number
  hi! link diffIsA WarningMsg
  hi! link diffNoEOL WarningMsg
  hi! link diffOnly WarningMsg
  hi! link diffRemoved DiffDelete
  hi! link Constant LibraryIdent
  hi! link Float Number
  hi! link StringDelimiter String
  hi! link Identifier LocalIdent
  hi! link Function LibraryFunc
  hi! link Boolean Statement
  hi! link Conditional Statement
  hi! link Exception Statement
  hi! link Include Statement
  hi! link Keyword Statement
  hi! link Label Statement
  hi! link Repeat Statement
  hi! link StorageClass Statement
  hi! link Structure Statement
  hi! link Define PreProc
  hi! link Macro PreProc
  hi! link PreCondit PreProc
  hi! link Type LibraryType
  hi! link Debug Special
  hi! link SpecialChar Special
  hi! link Tag Special
  hi! link Noise Delimiter
  hi! link Quote StringDelimiter
  hi! link Conceal Ignore
  hi! link NonText Ignore
  hi! link SpecialKey Ignore
  hi! link Whitespace Ignore
  hi! link Searchlight IncSearch
  hi! link SignifySignAdd Signify
  hi! link SignifySignChange Signify
  hi! link SignifySignDelete Signify
  hi! link bibEntryKw LibraryIdent
  hi! link bibKey IdentifierDef
  hi! link bibType LibraryType
  hi! link cssAtRule Keyword
  hi! link cssAttr Keyword
  hi! link cssBraces cssNoise
  hi! link cssClassName LocalIdent
  hi! link cssColor cssAttr
  hi! link cssFunction None
  hi! link cssIdentifier LocalIdent
  hi! link cssProp LibraryType
  hi! link cssPseudoClassId LibraryIdent
  hi! link cssSelectorOp Operator
  hi! link gitcommitHeader Todo
  hi! link gitcommitOverflow Error
  hi! link gitcommitSummary Title
  hi! link goField LocalIdent
  hi! link goFunction FunctionDef
  hi! link goFunctionCall LibraryFunc
  hi! link goVarAssign LocalIdent
  hi! link goVarDefs IdentifierDef
  hi! link helpCommand helpExample
  hi! link helpExample markdownCode
  hi! link helpHeadline Title
  hi! link helpHyperTextEntry Comment
  hi! link helpHyperTextJump Underlined
  hi! link helpSectionDelim Ignore
  hi! link helpURL helpHyperTextJump
  hi! link helpVim Title
  hi! link htmlArg Special
  hi! link htmlEndTag Delimiter
  hi! link htmlLink Underlined
  hi! link htmlSpecialTagName htmlTagName
  hi! link htmlTag Delimiter
  hi! link htmlTagName Statement
  hi! link jinjaBlockName Typedef
  hi! link jinjaFilter LibraryFunc
  hi! link jinjaNumber Number
  hi! link jinjaOperator Operator
  hi! link jinjaRawDelim PreProc
  hi! link jinjaSpecial Keyword
  hi! link jinjaString String
  hi! link jinjaTagDelim Delimiter
  hi! link jinjaVarDelim Delimiter
  hi! link jsBuiltins LibraryFunc
  hi! link jsClassDefinition Typedef
  hi! link jsDomErrNo LibraryIdent
  hi! link jsDomNodeConsts LibraryIdent
  hi! link jsExceptions LibraryType
  hi! link jsFuncArgCommas jsNoise
  hi! link jsFuncName FunctionDef
  hi! link jsFunction jsStatement
  hi! link jsGlobalNodeObjects jsGlobalObjects
  hi! link jsGlobalObjects LibraryType
  hi! link jsObjectProp LocalIdent
  hi! link jsOperatorKeyword jsStatement
  hi! link jsThis jsStatement
  hi! link jsVariableDef IdentifierDef
  hi! link jsonKeyword jsonString
  hi! link jsonKeywordMatch Operator
  hi! link jsonQuote StringDelimiter
  hi! link rsForeignConst LibraryIdent
  hi! link rsForeignFunc LibraryFunc
  hi! link rsForeignType LibraryType
  hi! link rsFuncDef FunctionDef
  hi! link rsIdentDef IdentifierDef
  hi! link rsLibraryConst LibraryIdent
  hi! link rsLibraryFunc LibraryFunc
  hi! link rsLibraryType LibraryType
  hi! link rsLifetimeDef IdentifierDef
  hi! link rsSpecialLifetime LibraryIdent
  hi! link rsUserConst LocalIdent
  hi! link rsUserFunc LocalFunc
  hi! link rsUserLifetime LocalIdent
  hi! link rsUserMethod LibraryFunc
  hi! link rsUserType LocalType
  hi! link scssAttribute cssNoise
  hi! link scssInclude Keyword
  hi! link scssMixin Keyword
  hi! link scssMixinName LocalFunc
  hi! link scssMixinParams cssNoise
  hi! link scssSelectorName cssClassName
  hi! link scssVariableAssignment Operator
  hi! link scssVariableValue Operator
  hi! link swiftFuncDef FunctionDef
  hi! link swiftIdentDef IdentifierDef
  hi! link swiftLibraryFunc LibraryFunc
  hi! link swiftLibraryProp LibraryIdent
  hi! link swiftLibraryType LibraryType
  hi! link swiftUserFunc LocalFunc
  hi! link swiftUserProp LocalIdent
  hi! link swiftUserType LocalType
  hi! link typescriptArrayMethod LibraryFunc
  hi! link typescriptArrowFunc Operator
  hi! link typescriptAssign Operator
  hi! link typescriptBOM LibraryType
  hi! link typescriptBOMWindowCons LibraryType
  hi! link typescriptBOMWindowMethod LibraryFunc
  hi! link typescriptBOMWindowProp LibraryType
  hi! link typescriptBinaryOp Operator
  hi! link typescriptBraces Delimiter
  hi! link typescriptCall None
  hi! link typescriptClassHeritage Type
  hi! link typescriptClassName TypeDef
  hi! link typescriptDOMDocMethod LibraryFunc
  hi! link typescriptDOMDocProp LibraryIdent
  hi! link typescriptDOMEventCons LibraryType
  hi! link typescriptDOMEventMethod LibraryFunc
  hi! link typescriptDOMEventMethod LibraryFunc
  hi! link typescriptDOMEventProp LibraryIdent
  hi! link typescriptDOMEventTargetMethod LibraryFunc
  hi! link typescriptDOMNodeMethod LibraryFunc
  hi! link typescriptDOMStorageMethod LibraryIdent
  hi! link typescriptEndColons Delimiter
  hi! link typescriptExport Keyword
  hi! link typescriptFuncName FunctionDef
  hi! link typescriptFuncTypeArrow typescriptArrowFunc
  hi! link typescriptGlobal typescriptPredefinedType
  hi! link typescriptIdentifier Keyword
  hi! link typescriptInterfaceName Typedef
  hi! link typescriptMember LocalFunc
  hi! link typescriptObjectLabel LocalIdent
  hi! link typescriptOperator Keyword
  hi! link typescriptParens Delimiter
  hi! link typescriptPredefinedType LibraryType
  hi! link typescriptTypeAnnotation Delimiter
  hi! link typescriptTypeReference typescriptUserDefinedType
  hi! link typescriptUserDefinedType LocalType
  hi! link typescriptVariable Keyword
  hi! link typescriptVariableDeclaration IdentifierDef
  hi! link vimAutoCmdSfxList LibraryType
  hi! link vimAutoEventList LocalIdent
  hi! link vimCmdSep Special
  hi! link vimCommentTitle SpecialComment
  hi! link vimContinue Delimiter
  hi! link vimFuncName LibraryFunc
  hi! link vimFunction FunctionDef
  hi! link vimHighlight Statement
  hi! link vimMapModKey vimNotation
  hi! link vimNotation LibraryType
  hi! link vimOption LibraryIdent
  hi! link vimUserFunc LocalFunc
  hi! link markdownBoldDelimiter markdownDelimiter
  hi! link markdownBoldItalicDelimiter markdownDelimiter
  hi! link markdownCodeBlock markdownCode
  hi! link markdownCodeDelimiter markdownDelimiter
  hi! link markdownHeadingDelimiter markdownDelimiter
  hi! link markdownItalicDelimiter markdownDelimiter
  hi! link markdownLinkDelimiter markdownDelimiter
  hi! link markdownLinkText None
  hi! link markdownLinkTextDelimiter markdownDelimiter
  hi! link markdownListMarker markdownDelimiter
  hi! link markdownRule markdownDelimiter
  hi! link markdownUrl Underlined
  hi markdownDelimiter guifg=#5ae6b4 guibg=NONE guisp=NONE gui=NONE cterm=NONE
  hi markdownCode guifg=#a2ffff guibg=#393b44 guisp=NONE gui=NONE cterm=NONE
  if g:xcodedark_green_comments
    hi Comment guifg=#84b360 guibg=NONE guisp=NONE gui=NONE cterm=NONE
    hi SpecialComment guifg=#b0e687 guibg=NONE guisp=NONE gui=NONE cterm=NONE
    hi Todo guifg=#b0e687 guibg=NONE guisp=NONE gui=bold cterm=bold
  endif
  if g:xcodedark_emph_types
    hi Typedef guifg=#8ab1ff guibg=NONE guisp=NONE gui=NONE cterm=NONE
    hi LocalType guifg=#9be6cb guibg=NONE guisp=NONE gui=NONE cterm=NONE
    hi LibraryType guifg=#a2ffff guibg=NONE guisp=NONE gui=NONE cterm=NONE
  else
    hi Typedef guifg=#8297f4 guibg=NONE guisp=NONE gui=NONE cterm=NONE
    hi LocalType guifg=#5ae6b4 guibg=NONE guisp=NONE gui=NONE cterm=NONE
    hi LibraryType guifg=#79e6f3 guibg=NONE guisp=NONE gui=NONE cterm=NONE
  endif
  if g:xcodedark_emph_funcs
    hi FunctionDef guifg=#8ab1ff guibg=NONE guisp=NONE gui=NONE cterm=NONE
    hi LocalFunc guifg=#9be6cb guibg=NONE guisp=NONE gui=NONE cterm=NONE
    hi LibraryFunc guifg=#a2ffff guibg=NONE guisp=NONE gui=NONE cterm=NONE
  else
    hi FunctionDef guifg=#8297f4 guibg=NONE guisp=NONE gui=NONE cterm=NONE
    hi LocalFunc guifg=#5ae6b4 guibg=NONE guisp=NONE gui=NONE cterm=NONE
    hi LibraryFunc guifg=#79e6f3 guibg=NONE guisp=NONE gui=NONE cterm=NONE
  endif
  if g:xcodedark_emph_idents
    hi IdentifierDef guifg=#8ab1ff guibg=NONE guisp=NONE gui=NONE cterm=NONE
    hi LocalIdent guifg=#9be6cb guibg=NONE guisp=NONE gui=NONE cterm=NONE
    hi LibraryIdent guifg=#a2ffff guibg=NONE guisp=NONE gui=NONE cterm=NONE
  else
    hi IdentifierDef guifg=#8297f4 guibg=NONE guisp=NONE gui=NONE cterm=NONE
    hi LocalIdent guifg=#5ae6b4 guibg=NONE guisp=NONE gui=NONE cterm=NONE
    hi LibraryIdent guifg=#79e6f3 guibg=NONE guisp=NONE gui=NONE cterm=NONE
  endif
  if g:xcodedark_match_paren_style
    hi MatchParen guifg=#292a30 guibg=#fef937 guisp=NONE gui=NONE cterm=NONE
  else
    hi MatchParen guifg=#fdfdfd guibg=#0f5bca guisp=NONE gui=NONE cterm=NONE
  endif
  if g:xcodedark_dim_punctuation
    hi Delimiter guifg=#a3b1bf guibg=NONE guisp=NONE gui=NONE cterm=NONE
    hi Operator guifg=#a3b1bf guibg=NONE guisp=NONE gui=NONE cterm=NONE
  else
    hi Delimiter guifg=#fdfdfd guibg=NONE guisp=NONE gui=NONE cterm=NONE
    hi Operator guifg=#fdfdfd guibg=NONE guisp=NONE gui=NONE cterm=NONE
  endif
  unlet s:t_Co
  finish
endif

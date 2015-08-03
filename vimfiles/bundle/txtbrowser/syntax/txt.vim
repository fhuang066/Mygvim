"Script_name: txt.vim
"Author: guoyoooping@163.com
"Date: 2011/08/07
"Release: 1.3.5
"Description: syntax for plain/text.
"Language: text/plain :)
"Location: $HOME/.vim/syntax or $VIMRUNTIME/syntax/
"Install_detail:
        "1. put this file in $HOME/.vim/syntax or $VIMRUNTIME/syntax/ 
        "2. Add the following line in your .vimrc:
        "syntax on "syntax highlighting on
        "filetype plugin on
        "au BufRead,BufNewFile *.txt setlocal ft=txt "syntax highlight for txt.vim 

"set case insensitive.
syn case ignore

"This script is encoded as utf8, and will convert to appropriate value when running.
scriptencoding utf-8

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" key words definition.
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"Keywords
syn keyword txtTodo todo fixme note debug comment notice
syn keyword txtError error bug caution dropped

"txtComment: Lines that start with '#'
"ä»¥#å·æ‰“å¤´çš„è¡Œä¸ºæ³¨é‡Šæ–‡æœ¬
syn match   txtComment '^#.*$' contains=txtTodo

"txtTitle: Lines start with digit and '.'
"æ ‡é¢˜æ–‡æœ¬: å‰é¢æœ‰ä»»æ„ä¸ªç©ºæ ¼,æ•°å­—.[æ•°å­—.]æ‰“å¤´, å¹¶ä¸”è¯¥è¡Œé‡Œä¸å«æœ‰,.ã€‚ï¼Œç­‰æ ‡ç‚¹ç¬¦å·
"
syn match txtTitle "^\(\d\+ \)\+\s*[^,ã€‚ï¼Œ]\+$"
syn match txtTitle "^\(\d\+ \)\+\s*[^,ã€‚ï¼Œ]\+$"
"
syn match txtTitle "^\(\d\+\.\)\+\s*[^,ã€‚ï¼Œ]\+$"
syn match txtTitle "^\(\d\+\.\)\+\s*[^,ã€‚ï¼Œ]\+,"

"txtTitle: Lines start with Chinese digit and '.'
"æ ‡é¢˜æ–‡æœ¬: æ±‰å­—æ•°å­—åŠ '.ã€'æ‰“å¤´ï¼Œä¸”è¯¥è¡Œä¸å«,.ã€‚ï¼Œæ ‡ç‚¹ç¬¦å·
syn match txtTitle "^\([ä¸€äºŒä¸‰å››äº”å…­ä¸ƒå…«ä¹å][ã€.]\)\+\s*[^,ã€‚ï¼Œ]\+$"
syn match txtTitle "^\([ä¸€äºŒä¸‰å››äº”å…­ä¸ƒå…«ä¹å][ã€.]\)\+\s*[^,ã€‚ï¼Œ]\+,"
"txtTitle: Lines start with Chinese digit and '.'
"±êÌâÎÄ±¾: ºº×ÖÊı×Ö¼Ó'.¡¢'´òÍ·£¬ÇÒ¸ÃĞĞ²»º¬,.¡££¬±êµã·ûºÅ
syn match txtTitle "^\([Ò»¶şÈıËÄÎåÁùÆß°Ë¾ÅÊ®][¡¢.]\)\+\s*[^,¡££¬]\+$"
syn match txtTitle "^\([Ò»¶şÈıËÄÎåÁùÆß°Ë¾ÅÊ®][¡¢.]\)\+\s*[^,¡££¬]\+,"
syn match txtTitle "^\(\s*£¨\)*\([Ò»¶şÈıËÄÎåÁùÆß°Ë¾ÅÊ®]\+£©*[¡¢. ]\)\+\s*[^,¡££¬]\+$"
syn match txtTitle "^\(\s*£¨\)*\([Ò»¶şÈıËÄÎåÁùÆß°Ë¾ÅÊ®]\+[¡¢. ]\)\+\s*[^,¡££¬]\+[£¬,]"
syn match txtTitle "^£¨\([Ò»¶şÈıËÄÎåÁùÆß°Ë¾ÅÊ®]\+£©*[¡¢. ]\)\+\s*[^,¡££¬]\+$"
syn match txtTitle "^£¨\([Ò»¶şÈıËÄÎåÁùÆß°Ë¾ÅÊ®]\+[¡¢. ]\)\+\s*[^,¡££¬]\+[£¬,]"
syn match txtTitle "^.*µÚ\?\([Ò»¶şÈıËÄÎåÁùÆß°Ë¾ÅÊ®°ÙÇ§Áã]\)\+ÕÂ\s*[^,¡££¬]\+$"
syn match txtTitle "^.*µÚ\([0-9]\)\+ÕÂ.*$"
syn match txtTitle "^.*[ĞòĞ¨]\+\s*[^,¡££¬]\+$"
"txtTitle: Lines start with digit
"±êÌâÎÄ±¾: ÒÔÊı×Ö´òÍ·, ÖĞ¼äÓĞ¿Õ¸ñ, ºó¸úÈÎÒâÎÄ×Ö. ÇÒ¸ÃĞĞ²»º¬ÓĞ,.¡££¬±êµã·ûºÅ

"txtTitle: Lines start with digit
"æ ‡é¢˜æ–‡æœ¬: ä»¥æ•°å­—æ‰“å¤´, ä¸­é—´æœ‰ç©ºæ ¼, åè·Ÿä»»æ„æ–‡å­—. ä¸”è¯¥è¡Œä¸å«æœ‰,.ã€‚ï¼Œæ ‡ç‚¹ç¬¦å·
syn match txtTitle "^\d\s\+.\+\s*[^,ã€‚ï¼Œ]$"
syn match txtTitle "^\d\s\+.\+\s*[^,ã€‚ï¼Œ],"

"txtList: Lines start with space and then '-+*.'
"åˆ—è¡¨æ–‡æœ¬: ä»»æ„ç©ºæ ¼æ‰“å¤´, åè·Ÿä¸€ä¸ª[-+*.]
syn match txtList    '^\s*\zs[-+*.] [^ ]'me=e-1

"txtList: Lines start with space and then digit
"åˆ—è¡¨æ–‡æœ¬: ä»»æ„ç©ºæ ¼æ‰“å¤´, åè·Ÿä¸€ä¸ª(æ•°å­—) æˆ– (å­—æ¯) æ‰“å¤´çš„æ–‡æœ¬è¡Œ
syn match txtList    '^\s*\zs(\=\([0-9]\+\|[a-zA-Z]\))'

"txtList: Lines start with space and then digit and '.'
"åˆ—è¡¨æ–‡æœ¬: è‡³å°‘ä¸€ä¸ªç©ºæ ¼æ‰“å¤´, [æ•°å­—.]æ‰“å¤´, ä½†éšåä¸èƒ½è·Ÿæ•°å­—(æ’é™¤æŠŠ5.5è¿™æ ·çš„æ–‡
"æœ¬å½“æˆåˆ—è¡¨) 
syn match txtList "^\s\+\zs\d\+\.\d\@!"

"txtApostrophe: text in the apostrophe
"å•å¼•å·å†…æ–‡å­—, ä½œç”¨èŒƒå›´æœ€å¤šä¸¤è¡Œ.
syn match   txtApostrophe  '\(\n\|[^a-zA-Z]\)\'[^\']\+\(\n\)\=[^\']\+\'\(\n\|[^a-zA-Z]\)' contains=txtUrl,txtReference

"txtQuotes: text in the quotoes
"åŒå¼•å·å†…æ–‡å­—, åŒ…æ‹¬å…¨è§’åŠè§’, ä½œç”¨èŒƒå›´æœ€å¤šä¸¤è¡Œ
syn match   txtQuotes     '["â€œ][^"â€]\+\(\n\)\=[^"â€]*["â€]' contains=txtUrl,txtReference

"txtParentesis: text in the parentesis
"æ‹¬å·å†…æ–‡å­—, ä¸åœ¨è¡Œé¦–(ä¸ºäº†å’ŒtxtListåŒºåˆ«), ä½œç”¨èŒƒå›´æœ€å¤šä¸¤è¡Œ
syn match   txtParentesis "[(ï¼ˆ][^)ï¼‰]\+\(\n\)\=[^)ï¼‰]*[)ï¼‰]" contains=txtUrl,txtReference

"txtBrackets: text in the brackets
"å…¶å®ƒæ‹¬å·å†…æ–‡å­—, ä½œç”¨èŒƒå›´æœ€å¤šä¸¤è¡Œ, å¤§æ‹¬å·æ— è¡Œæ•°é™åˆ¶
syn match txtBrackets     '<[^<]\+\(\n\)\=[^<]*>' contains=txtUrl,txtReference
syn match txtBrackets     '\[[^\[]\+\(\n\)\=[^\[]*\]' contains=txtUrl,txtReference
"syn region txtBrackets    matchgroup=txtOperator start="{"        end="}" contains=txtUrl,txtReference

"link url
syn match txtUrl '\<[A-Za-z0-9_.-]\+@\([A-Za-z0-9_-]\+\.\)\+[A-Za-z]\{2,4}\>\(?[A-Za-z0-9%&=+.,@*_-]\+\)\='
syn match txtUrl   '\<\(\(https\=\|ftp\|news\|telnet\|gopher\|wais\)://\([A-Za-z0-9._-]\+\(:[^ @]*\)\=@\)\=\|\(www[23]\=\.\|ftp\.\)\)[A-Za-z0-9%._/~:,=$@-]\+\>/*\(?[A-Za-z0-9/%&=+.,@*_-]\+\)\=\(#[A-Za-z0-9%._-]\+\)\='

"email text:
syn match txtEmailMsg '^\s*\(From\|De\|Sent\|To\|Para\|Date\|Data\|Assunto\|Subject\):.*'
"reference from reply email, quotes, etc.
syn match   txtReference '^[|>:]\(\s*[|>:]\)*'

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"ç±»htmlæ–‡æœ¬
"syn match   txtBold       '\*[^*[:blank:]].\{-}\*'hs=s+1,he=e-1
"syn match txtItalic "^\s\+.\+$" "æ–œä½“æ–‡æœ¬

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" color definitions (specific)
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"hi txtUrl        term=bold        cterm=bold  ctermfg=blue    gui=underline     guifg=blue
"hi txtTitle     term=bold       cterm=bold      ctermfg=black   gui=bold        guifg=black
hi link txtUrl      Underlined"ModeMsg"Tabline"PmenuSbar
hi link txtTitle      Title"ModeMsg"Tabline"PmenuSbar
hi link txtList         SignColumn"Pmenu"DiffText"Statement
hi link txtComment      Special "Comment
hi link txtReference    DiffAdd "Comment
hi link txtQuotes       MoreMsg"String
hi link txtApostrophe    MoreMsg"Special
hi link txtParentesis   Special "Comment
hi link txtBrackets  Special
hi link txtError  ErrorMsg
hi link txtTodo  Todo
hi link txtEmailMsg     Structure

let b:current_syntax = 'txt'
" vim:tw=0:et

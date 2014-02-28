" Vim syntax file
" Language: Mu
" Maintainer:  
" Last Change: Jul 30, 2009
" URL:         

" Use :syn w/in a buffer to see language element breakdown

if version < 600
 syntax clear
elseif exists("b:current_syntax")
 finish
endif

syn keyword muPreCondit require use
syn keyword muStatement break continue return assert
syn keyword muStatement operator struct datatype
syn keyword muStatement lazy output this of
syn keyword muStatement print assert
syn match muStatement "documentation\:"
syn match muStatement "function\:" nextgroup=muFunction skipwhite
syn match muStatement "method\:" nextgroup=muFunction skipwhite
syn match muStatement "\\\:" nextgroup=muFunction skipwhite
syn match muFunction "[a-zA-Z_][a-zA-Z0-9_]*" contained

syn match muOperator "(\|)\|:=\|:\|;"
syn keyword muOperator neq eq

syn keyword muRepeat for while do for_each for_index repeat
syn keyword muConditional if else then
syn keyword muLabel case

syn keyword muStorageClass const global
syn keyword muExceptions throw try catch
syn keyword muAccess public protected private virtual 

syn keyword muType bool byte char
syn keyword muType half double float float64
syn keyword muType int short int16 int32 int64 int128
syn keyword muType object string regex void nil
syn keyword muType istream ostream ifstream ofstream
syn keyword muType sstream osstream isstream
syn keyword muType vector quaternion optional let

syn keyword muConstant nil true false

syn match muStructure "module\:" nextgroup=muIdentifier skipwhite
syn match muStructure "class\:" nextgroup=muIdentifier skipwhite
syn match muStructure "union\:" nextgroup=muIdentifier skipwhite
syn match muIdentifier "[a-zA-Z_][a-zA-Z0-9_]*" contained

syn match muComment "//.*$" contains=muTodo,@Spell
syn region muComment start="/\*" end="\*/" contains=muTodo,@Spell

" Mu Strings
syn match muEscape display "\\\(u\x\{4}\)" contained
syn match muFormat display "%\(\d\+\$\)\=[-+' #0*]*\(\d*\|\*\|\*\d\+\$\)\(\.\(\d*\|\*\|\*\d\+\$\)\)\=\([hlLjzt]\|ll\|hh\)\=\([aAbdiuoxXDOUfFeEgGcCsSpn]\|\[\^\=.[^]]*\]\)" contained
syn match muFormat display "%%" contained
syn match muCharacter "L\='[^\\]'"
syn match muCharacter "L'[^']*'" contains=muEscape
syn region muString matchgroup=Normal start=+[uU]\="+ end=+"+ skip=+\\\\\|\\"+ contains=muEscape,muFormat,@Spell
syn region muString matchgroup=Normal start=+[uU]\="""+ end=+"""+ contains=muEscape,muFormat,@Spell fold

" Mu Numbers
syn case ignore
syn match muNumbers display transparent "\<\d\|\.\d" contains=muNumber,muFloat,muOctalError,muOctal
syn match muNumber display contained "\d\+\(u\=l\{0,2}\|ll\=u\)\>"
syn match muNumber display contained "0x\x\+\(u\=l\{0,2}\|ll\=u\)\>"
syn match muOctal display contained "0\o\+\(u\=l\{0,2}\|ll\=u\)\>" contains=muOctalZero
syn match muOctalZero display contained "\<0"
syn match muOctalError display contained "0\o*[89]\d*"
syn match muFloat display contained "\d\+f"
syn match muFloat display contained "\d\+\.\d*\(e[-+]\=\d\+\)\=[fl]\="
syn match muFloat display contained "\.\d\+\(e[-+]\=\d\+\)\=[fl]\=\>"
syn match muFloat display contained "\d\+e[-+]\=\d\+[fl]\=\>"
syn match muFloat display contained "0x\x*\.\x\+p[-+]\=\d\+[fl]\=\>"
syn match muFloat display contained "0x\x\+\.\=p[-+]\=\d\+[fl]\=\>"
syn case match

syn match muSpaceError display excludenl "\S\s\+$"ms=s+1

" Mu Markup
syn keyword muTodo TODO FIXME XXX contained

syn region muBlock start="{" end="}" transparent fold

syn sync minlines=2000

" Default highlighting
if version >= 508 || !exists("did_mu_syntax_inits")
 if version < 508
   let did_mu_syntax_inits = 1
   command -nargs=+ HiLink hi link <args>
 else
   command -nargs=+ HiLink hi def link <args>
 endif
 HiLink muPreCondit PreCondit
 HiLink muFunction Function
 HiLink muIdentifier Identifier
 HiLink muStatement Statement
 HiLink muStorageClass StorageClass
 HiLink muExceptions Exception
 HiLink muOperator Operator
 HiLink muType Type
 HiLink muStructure Structure
 HiLink muConstant Constant
 HiLink muComment Comment
 HiLink muString String
 HiLink muCharacter Character
 HiLink muTodo Todo
 HiLink muRepeat Repeat
 HiLink muConditional Conditional
 HiLink muLabel Label
 HiLink muAccess Statement
 HiLink muSpaceError Error
 HiLink muEscape Special
 HiLink muFormat Special
 HiLink muNumber Number
 HiLink muOctal Number
 HiLink muOctalZero PreProc
 HiLink muFloat Float
 HiLink muOctalError Error
 delcommand HiLink
endif

let b:current_syntax = "mu"

" vim: ts=8

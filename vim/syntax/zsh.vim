" Vim syntax file
" Language:     Zsh shell script
" Maintainer:     Nikolai Weibull <source@xxxxxxxxxxxxx>
" URL:        http://www.pcppopper.org/vim/syntax/pcp/zsh/
" Latest Revision:  2004-12-04
" arch-tag:     2e2c7097-99cb-4b87-a771-3a819b69995e

if version < 600
  syntax clear
elseif exists("b:current_syntax")
  finish
endif

" Set iskeyword since we need `-' (and potentially others) in keywords.
" For version 5.x: Set it globally
" For version 6.x: Set it locally
if version >= 600
  command -nargs=1 SetIsk setlocal iskeyword=<args>
else
  command -nargs=1 SetIsk set iskeyword=<args>
endif
SetIsk @,48-57,_,-
delcommand SetIsk

" Todo
syn keyword zshTodo         contained TODO FIXME XXX NOTE

" Comments
syn region  zshComment      matchgroup=zshComment start='\(^\|\s\)#' end='$' contains=zshTodo

" Strings
syn match   zshQuoted       '\\.'
syn region  zshString       matchgroup=zshString start=+"+ skip=+\\"+ end=+"+ contains=zshQuoted
syn region  zshString       matchgroup=zshString start=+'+ end=+'+
syn match   zshJobSpec      '%\(\d\+\|?\=\w\+\|[%+-]\)'

" Precommand Modifiers
syn keyword zshPrecommand   noglob nocorrect exec command builtin
syn match   zshPrecommand   '\<-\s'

" Delimiters
syn keyword zshDelimiter    do done

" Conditionals
syn keyword zshConditional  if then elif else fi case in esac select

" Exceptions
syn keyword zshException    always

" Loops
syn keyword zshRepeat       for while until repeat foreach

" Keywords
syn keyword zshKeyword      function time

" Functions
syn match   zshFunction     '\k\+\s*\ze()'

" Redirections
syn match   zshRedir        '\d\=\(<\|<>\|<<<\|<&\s*[0-9p-]\=\)'
syn match   zshRedir        '\d\=\(>\|>>\|>&\s*[0-9p-]\=\|&>\|>>&\|&>>\)[|!]\='
syn match   zshRedir        '|&\='

" Here Documents
if version < 600
    " Do nothing for now TODO: do something
else
    syn region  zshHereDoc  matchgroup=zshRedir start='<<\s*\z(\S*\)' end='^\z1$'
    syn region  zshHereDoc  matchgroup=zshRedir start='<<-\s*\z(\S*\)' end='^\s*\z1$'
    syn region  zshHereDoc  matchgroup=zshRedir start='<<\s*\z(["'\\]\S*\)'  end='^\z1$'
    syn region  zshHereDoc  matchgroup=zshRedir start='<<-\s*\z(["'\\]\S*\)' end='^\s*\z1$'
endif

" Variables
syn match   zshShellVar     '\$[!#$*@?_-]\w\@!'
syn match   zshShellVar     '\$\d\+\>'
"syn match   zshShellVar     '$\(ARGC\|argv\|status\|pipestatus\|CPUTYPE\|EGID\|EUID\|ERRNO\|GID\|HOST\|

" Commands
syn match   zshCommands     '\s[.:]\s'
syn keyword zshCommands     alias autoload bg bindkey break bye cap cd chdir
syn keyword zshCommands     clone comparguments compcall compctl compdescribe
syn keyword zshCommands     compfiles compgroups compquote comptags comptry
syn keyword zshCommands     compvalues continue declare dirs disable disown
syn keyword zshCommands     echo echotc echoti emulate enable eval exec exit
syn keyword zshCommands     export false fc fg functions getcap getln
syn keyword zshCommands     getopts hash history jobs kill let limit
syn keyword zshCommands     log logout popd print printf pushd pushln
syn keyword zshCommands     pwd r read readonly rehash return sched set
syn keyword zshCommands     setcap setopt shift source stat suspend test times
syn keyword zshCommands     trap true ttyctl type ulimit umask unalias
syn keyword zshCommands     unfunction unhash unlimit unset unsetopt vared
syn keyword zshCommands     wait whence where which zcompile zformat zftp zle
syn keyword zshCommands     zmodload zparseopts zprof zpty zregexparse zsocket
syn keyword zshCommands     zstyle ztcp

" Types
syn keyword zshTypes        float integer local typeset

" Switches
" XXX: this may be too much
syn match   zshSwitches     '\s\zs--\=[a-zA-Z0-9-]\+'

" Numbers
syn match   zshNumber       '\<-\=\(\d\+#\|0x\=\)\=\d\+\>'
syn match   zshNumber       '\<-\=\d\+.\d\+\>'

" Substitution
syn region  zshSubst        matchgroup=zshShellVar transparent start='\$(' end=')'
syn region  zshSubst        matchgroup=zshShellVar transparent start='\$((' end='))'
syn region  zshSubst      matchgroup=zshShellVar start='\${' skip='\\}' end='}' contains=zshSubst

" Define the default highlighting.
" For version 5.7 and earlier: only when not done already
" For version 5.8 and later: only when an item doesn't have highlighting yet
if version >= 508 || !exists("did_zsh_syn_inits")
  if version < 508
    let did_zsh_syn_inits = 1
    command -nargs=+ HiLink hi link <args>
  else
    command -nargs=+ HiLink hi def link <args>
  endif

  HiLink zshTodo          Todo
  HiLink zshComment       Comment
  HiLink zshQuoted        SpecialChar
  HiLink zshString        String
  HiLink zshJobSpec       Special
  HiLink zshPrecommand    Special
  HiLink zshDelimiter     Keyword
  HiLink zshConditional   Conditional
  HiLink zshException   Exception
  HiLink zshRepeat        Repeat
  HiLink zshKeyword       Keyword
  HiLink zshFunction      Function
  HiLink zshHereDoc   String
  HiLink zshRedir         Operator
  HiLink zshShellVar      Identifier
  HiLink zshCommands      Keyword
  HiLink zshTypes         Type
  HiLink zshSwitches      Special
  HiLink zshNumber        Number
  HiLink zshSubst   Identifier

  delcommand HiLink
endif

let b:current_syntax = "zsh"

" vim: set sts=2 sw=2:

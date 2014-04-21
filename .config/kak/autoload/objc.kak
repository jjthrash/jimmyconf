hook global BufCreate .*\.(m) %{
    set buffer filetype objc
}

# For now cpp.kak and objc.kak do not coexist, since there isn't currently a way to figure out if a header file
# is objc or c++ or c. Vim does it somehow.
hook global BufSetOption mimetype=text/x-c(\+\+)? %{
    set buffer filetype objc
}

defhl objc
addhl -def-group objc regex "\<(TRUE|FALSE|YES|NO|NULL)\>|\<-?\d+[fdiu]?|'((\\.)?|[^'\\])'" 0:value
addhl -def-group objc regex "\<(void|int|char|unsigned|float|bool|size_t)\>" 0:type
addhl -def-group objc regex "\<(while|for|if|else|do|switch|case|default|goto|break|continue|return|using|try|catch|throw|new|delete|and|or|not|operator|explicit)\>" 0:keyword
addhl -def-group objc regex "\<(const|mutable|auto|namespace|inline|static|volatile|class|struct|enum|union|public|protected|private|template|typedef|virtual|friend|extern|typename|override|final)\>" 0:attribute

addhl -def-group objc regex "\<(self|nil|id|super)\>" 0:value
addhl -def-group objc regex "@(\d+|NO|YES|TRUE|FALSE)\>" 0:value
addhl -def-group objc regex "\<(instancetype)\>" 0:type
addhl -def-group objc regex "\<(NSInteger|NSUInteger|CGFloat|NSString)\>" 0:type
addhl -def-group objc regex "\<(nonatomic|assign|copy|strong|retain|weak|readonly)\>" 0:attribute
addhl -def-group objc regex "@(property|interface|implementation|protocol|end|selector|autoreleasepool|try|catch)\>" 0:attribute
addhl -def-group objc regex "\<(IBAction|IBOutlet)\>" 0:attribute

addhl -def-group objc regex "^\h*?#.*?(?<!\\)$" 0:macro
addhl -def-group objc region %{@?(?<!')"} %{(?<!\\)(\\\\)*"} string
addhl -def-group objc region /\* \*/ comment
addhl -def-group objc regex "(//[^\n]*\n)" 0:comment

hook global WinSetOption filetype=objc %{
    addhl ref objc
}

hook global WinSetOption filetype=(?!objc).* %{
    rmhl objc
}

decl str-list alt_dirs ".;.."

def alt -docstring "Jump to the alternate file (header/implementation)" %{ %sh{
    alt_dirs=$(echo ${kak_opt_alt_dirs} | sed -e 's/;/ /g')
    file=$(basename ${kak_buffile})
    dir=$(dirname ${kak_buffile})

    case ${file} in
         *.m|*.c|*.cc|*.cpp|*.cxx|*.C)
             for alt_dir in ${alt_dirs}; do
                 for ext in h hh hpp hxx H; do
                     altname="${dir}/${alt_dir}/${file%.*}.${ext}"
                     [ -f ${altname} ] && break
                 done
                 [ -f ${altname} ] && break
             done
         ;;
         *.h|*.hh|*.hpp|*.hxx|*.H)
             for alt_dir in ${alt_dirs}; do
                 for ext in m c cc cpp cxx C; do
                     altname="${dir}/${alt_dir}/${file%.*}.${ext}"
                     [ -f ${altname} ] && break
                 done
                 [ -f ${altname} ] && break
             done
         ;;
    esac
    if [ -f ${altname} ]; then
       echo edit "'${altname}'"
    else
       echo echo "'alternative file not found'"
    fi
}}


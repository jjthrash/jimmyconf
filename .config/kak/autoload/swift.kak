hook global BufCreate .*\.(swift) %{
    set buffer filetype swift
}

addhl -group / regions -default code swift \
    string %{(?<!')"} %{(?<!\\)(\\\\)*"} '' \
    comment /\* \*/ '' \
    comment // $ ''

addhl -group /swift/string fill string
addhl -group /swift/comment fill comment

addhl -group /swift/comment regex "\<(TODO|XXX)\>" 0:red

addhl -group /swift/code regex %{\<(true|false|nil)\>|\<-?\d+[fdiu]?|'((\\.)?|[^'\\])'} 0:value
#addhl -group /swift/code regex "\<(void|int|char|unsigned|float|bool|size_t)\>" 0:type
addhl -group /swift/code regex "\<(let|var|as|while|in|for|if|else|do|switch|case|default|break|continue|return|try|catch|throw|new|delete|and|or|not|operator|explicit|func|import|return)\>" 0:keyword
addhl -group /swift/code regex "\<(const|mutable|auto|namespace|inline|static|volatile|class|struct|enum|union|public|protected|private|typedef|virtual|friend|extern|typename|override|final)\>" 0:attribute

addhl -group /swift/code regex "\<(self|nil|id|super)\>" 0:value
#addhl -group /swift/code regex "@(\d+|NO|YES|TRUE|FALSE)\>" 0:value
#addhl -group /swift/code regex "\<(instancetype)\>" 0:type
addhl -group /swift/code regex "\<(Bool|String|UInt|UInt16|UInt32|UInt64|UInt8)\>" 0:type
#addhl -group /swift/code regex "\<(nonatomic|assign|copy|strong|retain|weak|readonly)\>" 0:attribute
#addhl -group /swift/code regex "\<(__block)\>" 0:attribute
#addhl -group /swift/code regex "@(property|synthesize|interface|implementation|protocol|end|selector|autoreleasepool|try|catch|class|synchronized)\>" 0:attribute
addhl -group /swift/code regex "\<(IBAction|IBOutlet)\>" 0:attribute

hook global WinSetOption filetype=swift %{
    addhl ref swift
}

hook global WinSetOption filetype=(?!swift).* %{
    rmhl swift
}

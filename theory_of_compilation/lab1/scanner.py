import sys
from sly import Lexer
from sly.lex import Token


class Scanner(Lexer):

    tokens = {
        ID, INTNUM, FLOATNUM, STRING,
        DOTADD, DOTSUB, DOTMUL, DOTDIV,
        ADDASSIGN, SUBASSIGN, MULASSIGN, DIVASSIGN,
        EQ, NEQ, LE, GE,
        IF, ELSE, FOR, WHILE,
        BREAK, CONTINUE, RETURN,
        EYE, ZEROS, ONES,
        PRINT,
    }

    literals = {
        # binary operators
        '+', '-', '*', '/',
        # assignment operator
        '=',
        # relational operators
        '<', '>',
        # brackets
        '(', ')', '[', ']', '{', '}',
        # range, transpose, comma, semicolon
        ':', "'", ',', ';',
    }

    # whitespace and comments
    ignore = ' \t'
    ignore_comment = r'\#.*'

    @_(r'\n+')
    def ignore_newline(self, t: Token) -> None:
        self.lineno += t.value.count('\n')

    # matrix binary operators
    DOTADD = r'\.\+'
    DOTSUB = r'\.-'
    DOTMUL = r'\.\*'
    DOTDIV = r'\./'

    # assignment operators
    ADDASSIGN = r'\+='
    SUBASSIGN = r'-='
    MULASSIGN = r'\*='
    DIVASSIGN = r'/='

    # relational operators
    EQ = r'=='
    NEQ = r'!='
    LE = r'<='
    GE = r'>='
    
    # @_ is SLY syntax sugar attaches the regexp to the function below 
    # numbers: float before int, 60.500, 60., .500, 60.52E2  https://regex101.com/r/Obq7Y4/1
    @_(r'(\d+\.\d*|\.\d+)([eE][+-]?\d+)?')
    def FLOATNUM(self, t: Token) -> Token:
        return t

    @_(r'\d+')
    def INTNUM(self, t: Token) -> Token:
        return t

    # strings, single line
    @_(r'"[^"\n]*"')
    def STRING(self, t: Token) -> Token:
        t.value = t.value[1:-1]
        return t

    # identifiers and keywords
    ID = r'[a-zA-Z_][a-zA-Z0-9_]*'
    ID['if'] = IF
    ID['else'] = ELSE
    ID['for'] = FOR
    ID['while'] = WHILE
    ID['break'] = BREAK
    ID['continue'] = CONTINUE
    ID['return'] = RETURN
    ID['eye'] = EYE
    ID['zeros'] = ZEROS
    ID['ones'] = ONES
    ID['print'] = PRINT

    def error(self, t: Token) -> None:
        print(f"Line {self.lineno}: illegal character '{t.value[0]}'")
        self.index += 1


if __name__ == '__main__':

    try:
        filename = sys.argv[1] if len(sys.argv) > 1 else "examples/example.txt"
        file = open(filename, "r")
    except IOError:
        print("Cannot open {0} file".format(filename))
        sys.exit(0)

    text = file.read()
    lexer = Scanner()

    for tok in lexer.tokenize(text):
        print(f"({tok.lineno}): {tok.type}({tok.value})")

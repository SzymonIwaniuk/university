from sly import Parser
from scanner import Scanner


class Mparser(Parser):

    tokens = Scanner.tokens


    # lower priority first; IFX/ELSE resolve dangling else (shift over reduce)
    precedence = (
        ("nonassoc", 'IFX'),
        ("nonassoc", 'ELSE'),
        ("nonassoc", '<', '>', 'LE', 'GE', 'EQ', 'NEQ'),
        ("left", '+', '-', 'DOTADD', 'DOTSUB'),
        ("left", '*', '/', 'DOTMUL', 'DOTDIV'),
        ("right", 'UMINUS'),
        ("left", "'"),
    )


    @_('instructions_opt')
    def program(self, p):
        pass

    @_('instructions')
    def instructions_opt(self, p):
        pass

    @_('')
    def instructions_opt(self, p):
        pass

    @_('instructions instruction')
    def instructions(self, p):
        pass

    @_('instruction')
    def instructions(self, p):
        pass


    # compound instruction
    @_('"{" instructions "}"')
    def instruction(self, p):
        pass

    # if-else
    @_('IF "(" expr ")" instruction %prec IFX',
       'IF "(" expr ")" instruction ELSE instruction')
    def instruction(self, p):
        pass

    # loops
    @_('WHILE "(" expr ")" instruction')
    def instruction(self, p):
        pass

    @_('FOR ID "=" range instruction')
    def instruction(self, p):
        pass

    @_('expr ":" expr')
    def range(self, p):
        pass

    # break, continue, return
    @_('BREAK ";"',
       'CONTINUE ";"',
       'RETURN ";"',
       'RETURN expr ";"')
    def instruction(self, p):
        pass

    # print
    @_('PRINT expr_list ";"')
    def instruction(self, p):
        pass

    # assignment
    @_('lvalue assign_op expr ";"')
    def instruction(self, p):
        pass

    @_('"="', 'ADDASSIGN', 'SUBASSIGN', 'MULASSIGN', 'DIVASSIGN')
    def assign_op(self, p):
        pass

    @_('ID',
       'ID "[" index_list "]"')
    def lvalue(self, p):
        pass

    # indexes, optionally ranges: A[1, 2:4]
    @_('index_list "," index',
       'index')
    def index_list(self, p):
        pass

    @_('expr',
       'expr ":" expr')
    def index(self, p):
        pass

    # binary expressions, including element-wise matrix operations
    @_('expr "+" expr',
       'expr "-" expr',
       'expr "*" expr',
       'expr "/" expr',
       'expr DOTADD expr',
       'expr DOTSUB expr',
       'expr DOTMUL expr',
       'expr DOTDIV expr')
    def expr(self, p):
        pass

    # relational expressions
    @_('expr "<" expr',
       'expr ">" expr',
       'expr LE expr',
       'expr GE expr',
       'expr EQ expr',
       'expr NEQ expr')
    def expr(self, p):
        pass

    # unary negation
    @_('"-" expr %prec UMINUS')
    def expr(self, p):
        pass

    # matrix transpose
    @_('expr "\'"')
    def expr(self, p):
        pass

    @_('"(" expr ")"')
    def expr(self, p):
        pass

    # matrix special functions
    @_('EYE "(" expr_list ")"',
       'ZEROS "(" expr_list ")"',
       'ONES "(" expr_list ")"')
    def expr(self, p):
        pass

    # matrix initialization: [[1, 2], [3, 4]] or rows separated by ';': [1, 2; 3, 4]
    @_('"[" rows "]"')
    def expr(self, p):
        pass

    @_('rows ";" expr_list',
       'expr_list')
    def rows(self, p):
        pass

    # variables, indexing, constants
    @_('ID',
       'ID "[" index_list "]"',
       'INTNUM',
       'FLOATNUM',
       'STRING')
    def expr(self, p):
        pass

    @_('expr_list "," expr',
       'expr')
    def expr_list(self, p):
        pass

    # error recovery: skip bad fragment and keep parsing
    @_('"(" error ")"')
    def expr(self, p):
        pass

    @_('IF "(" error ")" instruction %prec IFX',
       'IF "(" error ")" instruction ELSE instruction',
       'WHILE "(" error ")" instruction',
       'error ";"')
    def instruction(self, p):
        pass

    def error(self, p):
        if p:
            print(f"Syntax error at line {p.lineno}: unexpected {p.type}('{p.value}')")
        else:
            print("Syntax error: unexpected end of input")

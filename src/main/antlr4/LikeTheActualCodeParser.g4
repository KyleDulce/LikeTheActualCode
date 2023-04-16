/**
    Lexer Grammar file for LikeTheActualCode (Ltac) language
*/

parser grammar LikeTheActualCodeParser;

options {
    caseInsensitive = false;
    tokenVocab = LikeTheActualCodeLexer;
}

prog
    : HI identifier LETS statement_block IM_DAD EOF
    ;

identifier
    : LETTERS (LETTERS | INTEGER_LITERAL | SCORES) *
    ;

//statements
statement_block
    : statement *
    ;

//TODO finish
statement
    : var_declaration_statement
    | var_assignment_statement
    | if_statement
    | letHimCook_loop_statement
    | everytime_loop_statement
    | function_call_statement
    | function_declare_statement
    | break_statement
    | return_statement
    | error_statement
    | empty_statement
    ;

empty_statement
    : AM_I_RIGHT
    ;

var_declaration_statement
    : var_declaration AM_I_RIGHT
    ;

var_assignment_statement
    : var_assignment AM_I_RIGHT
    ;

break_statement
    : STOP_IT
    | OHHH
    ;

return_statement
    : I_GOT_CLASS conditional_expression AM_I_RIGHT
    ;

if_statement
    : WHAT_IF conditional_expression THEN statement_block if_parts
    ;

function_call_statement
    : function_call AM_I_RIGHT
    ;

function_declare_statement
    : HEY_I_GOT_A_QUESTION (type | HONK) identifier OPEN_PARENTHESIS function_declare_args CLOSE_PARENTHESIS
        statement_block HOW_DO_I_DO_IT
    ;

letHimCook_loop_statement
    : LET_HIM_COOK conditional_expression WHEN statement_block DUNDUNDUN
    ;

everytime_loop_statement
    : EVERYTIME var_declaration SAYS conditional_expression SOMETHING_HAPPENS statement_block THEN_IT_BREAKS
    ;

error_statement
    : LETS_TRY statement_block HOW_DOES_THAT_EVEN_HAPPEN error_parts
    ;

//other parts
var_declaration
    : I_REQUIRE type identifier (WHICH_IS var_intializer)?
    ;

var_assignment
    : settable_value var_assignment_part
    ;

var_assignment_part
    : WHICH_IS var_intializer
    | WHICH_IS_WHY numeric_expression
    | WHICH_IS_FREAK numeric_expression
    ;

var_intializer
    : conditional_expression
    | array_intializer
    ;

if_parts
    : OTHERWISE_I_WOULD_THINK conditional_expression THEN statement_block if_parts
    | IF_NOT_THEN statement_block I_DISAGREE
    | I_DISAGREE
    ;

error_parts
    : WHY_DOES identifier DO_THAT statement_block error_parts
    | SADGE
    ;

array_intializer
    : ARRAY_OPEN INTEGER_LITERAL ARRAY_CLOSE
    ;

callable_value
    : identifier callable_value_prime
    | function_call
    ;

callable_value_prime
    : ARRAY_OPEN numeric_expression ARRAY_CLOSE callable_value_prime
    | //epsilon
    ;

settable_value
    : identifier settable_value_prime
    ;

settable_value_prime
    : ARRAY_OPEN numeric_expression ARRAY_CLOSE settable_value_prime
    | //epsilon
    ;

//function call
function_call
    : DID_I identifier OPEN_PARENTHESIS function_call_args CLOSE_PARENTHESIS
    ;

function_call_args
    : conditional_expression function_call_args_prime
    | //epsilon
    ;

function_call_args_prime
    : COMMA conditional_expression function_call_args_prime
    | //epsilon
    ;

function_declare_args
    : function_declare_args_part function_declare_args_prime
    | //epsilon
    ;

function_declare_args_prime
    : COMMA function_declare_args_part function_declare_args_prime
    | //epsilon
    ;

function_declare_args_part
    : type identifier
    ;

//conditional expression
conditional_expression
    : conditional_term conditional_expression_prime
    ;

conditional_expression_prime
    : OR conditional_term conditional_expression_prime
    | //epsilon
    ;

conditional_term
    : conditional_unary_factor conditional_term_prime
    ;

conditional_term_prime
    : AND conditional_unary_factor conditional_term_prime
    | //epsilon
    ;

conditional_unary_factor
    : PLEASENOT conditional_factor
    | conditional_factor
    ;

conditional_factor
    : comparative_expression
    | OPEN_PARENTHESIS conditional_expression CLOSE_PARENTHESIS
    ;

//comparative expression
comparative_expression
    : casting_expression comparative_expression_prime
    ;

comparative_expression_prime
    : generic_comparison_operator casting_expression
    | numeric_comparision_operator casting_expression
    | IS_A type OR_IS_IT
    | //epsilon
    ;

//cast expression
casting_expression
    : string_expression
    | WHY_ARENT_YOU_A type string_expression
    ;

//string expression
string_expression
    : string_fragment
    ;

string_expression_prime
    : IT_GETS_WORSE string_fragment string_expression_prime
    | //epsilon
    ;

string_fragment
    : numeric_expression
    | STRING_LITERAL
    | BOOLEAN_LITERAL
    | IDK_LITERAL
    ;

//numeric expression
numeric_expression
    : term expression_prime
    ;

expression_prime
    : ROGUE_COUPLE term expression_prime
    | DESTROY term expression_prime
    | //epsilon
    ;

term
    : exponential term_prime
    ;

term_prime
    : BOATY exponential term_prime
    | TAKETAKETAKE exponential term_prime
    | GOOSENOISES exponential term_prime
    | //epsilon
    ;

exponential
    : factor exponential_prime
    ;

exponential_prime
    : CROISSANT factor exponential_prime
    | //epsilon
    ;

factor
    : numeric_literal
    | callable_value
    | OPEN_PARENTHESIS numeric_expression CLOSE_PARENTHESIS
    ;

//groups
type
    : SUSTENANCE
    | LOGIC
    | COUNTING_SKILLS
    | WHAT_IS_A_DECIMAL
    | LET_HIM_SPEAK
    | TRASHY
    ;

numeric_literal
    : INTEGER_LITERAL
    | FLOAT_LITERAL
    ;

//operators
generic_comparison_operator
    : IS_MAYBE_TO
    | IS_TOTALLY
    ;

numeric_comparision_operator
    : IS_OTRAIN_TO
    | IS_FOOD_TO
    | IS_SITE_TO
    | IS_POTATO_TO
    ;



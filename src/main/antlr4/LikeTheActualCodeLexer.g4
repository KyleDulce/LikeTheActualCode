/**
    Lexer Grammar file for LikeTheActualCode (Ltac) language
*/

lexer grammar LikeTheActualCodeLexer;

options {
    caseInsensitive=false;
}

// Keywords
AM_I_RIGHT: 'amIRight?';
COUNTING_SKILLS: 'countingSkills';
DID_I: 'didI';
DO_THAT: 'doThat';
DUNDUNDUN: 'dundundun';
EVERYTIME: 'everytime';
HEAR_ME_OUT: 'hearMeOut';
HEY_I_GOT_A_QUESTION: 'heyIGotAQuestion';
HI: 'Hi';
HONK: 'honk';
HOW_DOES_THAT_EVEN_HAPPEN: 'howDoesThatEvenHappen';
HOW_DO_I_DO_IT: 'howDoIDoIt';
IF_NOT_THEN: 'ifNotThen';
IM_DAD: 'imDad';
I_DISAGREE: 'iDisagree';
I_GOT_CLASS: 'iGotClass';
I_REQUIRE: 'iRequire';
LETS: 'lets';
LETS_TRY: 'letsTry';
LET_HIM_COOK: 'letHimCook';
LET_HIM_SPEAK: 'letHimSpeak';
LOGIC: 'logic';
LOOK: 'look';
OHHH: 'ohhh';
OTHERWISE_I_WOULD_THINK: 'otherwiseIWouldThink';
PLEASE_JUST: 'pleaseJust';
RIGHT: 'right?';
SADGE: 'sadge';
SAYS: 'says';
SOMETHING_HAPPENS: 'somethingHappens';
STOP_IT: 'stopIt';
SUSTENANCE: 'sustenance';
THEN: 'then';
THEN_IT_BREAKS: 'thenItBreaks';
TRASHY: 'trashy';
WHAT_IF: 'whatIf';
WHAT_IS_A_DECIMAL: 'whatIsADecimal';
WHEN: 'when';
WHY_DOES: 'whyDoes';
WORK: 'work';

//operators
WHICH_IS: 'whichIs';

ROGUE_COUPLE: 'rogueCouple';
DESTROY: 'destroy';
BOATY: 'boaty';
TAKETAKETAKE: 'taketaketake';
GOOSENOISES: 'gooseNoises';
CROISSANT: 'croissant';
WHICH_IS_WHY: 'whichIsWhy';
WHICH_IS_FREAK: 'whichIsFreak';

AND: 'AND';
OR: 'OR';
PLEASENOT: 'PLEASENOT';

IS_OTRAIN_TO: 'isOTrainTo';
IS_FOOD_TO: 'isFoodTo';
IS_SITE_TO: 'isSiteTo';
IS_POTATO_TO: 'isPotatoTo';
IS_MAYBE_TO: 'isMaybeTo';
IS_TOTALLY: 'isTotally';

IS_A: 'isA';
OR_IS_IT: 'orIsIt?';

IT_GETS_WORSE: 'itGetsWorse';
WHY_ARENT_YOU_A: 'whyArentYouA';

// Fragments
LETTERS: ('A' .. 'Z' | 'a' .. 'z') +;
fragment DIGIT: ('0' .. '9');

// Separators
SCORES: '_'
      | '-';
QUOTE_DOUBLE: '"';
QUOTE_SINGLE: '\'';
ARRAY_OPEN: '[';
ARRAY_CLOSE: ']';
COMMA: ',';
OPEN_PARENTHESIS: '(';
CLOSE_PARENTHESIS: ')';

/** Literals */

TRUE_LITERAL: ':>';
FALSE_LITERAL: ':<';

BOOLEAN_LITERAL: TRUE_LITERAL
               | FALSE_LITERAL
               ;

IDK_LITERAL: 'idk';

INTEGER_LITERAL
    : DIGIT +
    ;

FLOAT_LITERAL
    : INTEGER_LITERAL '.' INTEGER_LITERAL
    ;

STRING_LITERAL
    : QUOTE_DOUBLE ~[\r\n]* QUOTE_DOUBLE
    | QUOTE_SINGLE ~[\r\n]* QUOTE_SINGLE
    ;

// Comments whitespace

SL_COMMENT
    : LOOK ~[\r\n]* -> channel(HIDDEN)
    ;

ML_COMMENT
    : HEAR_ME_OUT .*? RIGHT -> channel(HIDDEN)
    ;

WHITESPACE
    : [ \r\n\t] + -> channel (HIDDEN)
    ;

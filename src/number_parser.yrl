%% src/number_parser.yrl
Nonterminals
document
values value
list list_items.

Terminals
int float '[' ']'.

Rootsymbol document.


document -> values : '$1'.

values -> value : ['$1'].
values -> value values : ['$1'] ++ '$2'.

value -> int : {int, unwrap('$1')}.
value -> float : {float, unwrap('$1')}.
value -> list : '$1'.

list -> '[' list_items ']' : '$2'.
list_items -> value : ['$1'].
list_items -> value list_items: ['$1'] ++ '$2'.



Erlang code.

unwrap({_,_,V}) -> V.

-module(streams).
-import(lists, [map/2, foldl/3, foreach/2]).
-export([main/1]).

printList(List) when List =:= [] -> io:fwrite(".~n");
printList([Head | Tail]) ->
	io:fwrite("~w ", [Head]),
	printList(Tail).


epicForeach(List) ->
	foreach(fun(X) -> io:fwrite("EPIC! ~w ", [X]) end, List),
	io:fwrite("~n").
	

main(Numbers) ->
	Transformed = map(fun(X) -> X * 2 end, Numbers),
	io:fwrite("The transformed list: ~n"),
	printList(Transformed),
	SumOfElements = foldl(fun(Element, Accumulator) -> Accumulator + Element end, 0, Transformed),
	io:fwrite("The sum of the elements: ~w~n", [SumOfElements]),
	epicForeach(Transformed).

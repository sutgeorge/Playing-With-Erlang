-module(streams).
-import(lists, [map/2, foldl/3]).
-export([main/1]).

printList(List) when List =:= [] -> io:fwrite(".~n");
printList([Head | Tail]) ->
	io:fwrite("~w ", [Head]),
	printList(Tail).
	

main(Numbers) ->
	Transformed = map(fun(X) -> X * 2 end, Numbers),
	io:fwrite("The transformed list: ~n"),
	printList(Transformed),
	SumOfElements = foldl(fun(Element, Accumulator) -> Accumulator + Element end, 0, Transformed),
	io:fwrite("The sum of the elements: ~w~n", [SumOfElements]).


:- [library(csv)] .
:- [library(lists)] .

:- op(1,'xfy','csv_') .

start:-
     clear,
     csv('C:/Users/aayus/Desktop/aiassignment2/roaddistance.csv'),
     write('Road Map System'),nl,
     write('Please select one of the implemented Search Algorithms to find the route from one city to another.'),nl,
     write('1. Depth First Search'),tab(4),write('2. Best First Search'),nl,
     read(Choice),
     write('Source :'),
     read(Start),
     write('Goal :'),
     read(Goal),
     solve_route_distance(Start, Goal, SolutionRoute, DistanceSum, Choice).


solve_route_distance(Start, Goal, SolutionRoute, DistanceSum, Choice):-
    (

         Choice =:= 1 -> (dfs(Start, Goal, [] , SolutionRoute, [], Distance),
                         distance(Distance, DistanceSum),
                         reverse(SolutionRoute, Route),
                         write("Route traversed using DFS is "),nl,
                         write(Route),nl,
                         write("Distance is :"),
                         write(DistanceSum) );
         Choice =:= 2 -> (bfs(Start, Goal, SolutionRoute, DistanceSum),
                          write("Route traversed using Best First Search is "),nl,
                         write(SolutionRoute),nl,
                         write("Distance is :"),
                         write(DistanceSum) )

     ).

dfs(Goal,Goal,Path,[Goal|Path] , Distance , Distance).


dfs(Start,Goal,Path,Solroute , Distance , Soldistance):-
    pathcost(Start,Nextnode,Dist),
    \+ member(Nextnode,Path),
    dfs(Nextnode,Goal,[Start|Path],Solroute ,[Dist|Distance],Soldistance).


distance([], 0).
distance([H|T] , Distancesum):-
     distance(T , Sum) ,
     Distancesum is H + Sum.


%Lists reversal
nextstep(_,_,[],L1,L2,List1,List2):-
    reverse(L1,List1),
    reverse(L2,List2).

%List of the Path and the Distance is created separately
nextstep(Start, Goal,[H1|T],L1,L2,List1,List2):-
    pathcost(Start,H1,DIST1),
    pathcost(H1,Goal,DIST2),
    Sum is DIST1+DIST2-50,
    nextstep(Start,Goal,T,[Sum|L1],[(Start,H1,Goal)|L2],List1,List2).

%List1 and List2 Concatenation
find_list([],[],H,Heuristic):-
    reverse(H,Heuristic).

find_list([H1|T1],[H2|T2],H,[(H1:H2)|Heuristic]):-
    find_list(T1,T2,H,Heuristic).


%Creating Heuristic
find_h(Start,Goal,Heuristic):-
    csv_read_file('C:/Users/aayus/Desktop/aiassignment2/roaddistance.csv',[Head|_]),
    rows(Head,H),
    H = [_|T],
    nextstep(Start,Goal,T,[],[],List1,List2),
    find_list(List1,List2,[],Heuristic).

%If list has only one element with minimum value
min_value([(A:B)],(A:B),A,B).

%if the minimum value is of the Head of the list
min_value([(A:B)|T],(A:B),A,B):-
    min_value(T,(X:Y),X,Y), A < X.

%If Head of list has greater value than the next element
min_value([(A:_)|T],(X:Y),X,Y):-
    min_value(T,(X:Y),X,Y),A >= X.



%when start and goal city are directly connected, selecting heurustic as actual distance from node to goal - 50
bfs(Start,Goal,[Start,Goal], Distancesum):-
    pathcost(Start,Goal,DIST),
    Distancesum is DIST-50,
    !.

%if there is no direct connection between start and goal node
bfs(Start,Goal,Route ,Distancesum):-
    find_h(Start,Goal,Heuristic),
    min_value(Heuristic,(_:_),Distancesum,Route).

clear:-

    retractall(pathcost(_,_,_)),
    tell('C:/Users/aayus/Desktop/aiassignment2/distancedatabase.pl'),
    told.

save:-

    retractall(pathcost(X,X,-)),
    tell('C:/Users/aayus/Desktop/aiassignment2/distancedatabase.pl'),
    listing(pathcost),
    told.


csv(Citylist):-
(start) csv_ (Citylist).

(start) csv_ (Citylist):-
csv:csv_read_file(Citylist,[HEADER|ROWss]) ,
rows(HEADER,HEADERs) ,
(loop) csv_ (HEADERs,ROWss).

(loop) csv_ (_HEADERs,[]):-
true.

(loop) csv_ (HEADERs,[ROW|ROWss]):-
rows(ROW,ROWs) ,
lists:nth1(1,ROWs,CITY_A) ,
QUERY_A=(lists:nth1(NTH,ROWs,DISTANCE)) ,
QUERY_B=(NTH > 1) ,
QUERY_C=(lists:nth1(NTH,HEADERs,CITY_B)) ,
QUERY=(QUERY_A,QUERY_B,QUERY_C) ,
ASSERT =(assertz(pathcost(CITY_A,CITY_B,DISTANCE)) ,assertz(pathcost(CITY_B,CITY_A,DISTANCE))),
forall(QUERY,ASSERT) ,
(loop) csv_ (HEADERs,ROWss),
save.

rows(ROW,ROWs):-
ROW=..[_|ROWs].

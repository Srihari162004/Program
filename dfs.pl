% Define goal node(s)
goal(g).

% Define graph edges (successor relation)
s(a, b).
s(b, c).
s(c, g).
s(a, d).
s(d, g).

% solve(Node, Solution):
% Solution is an acyclic path (in reverse order) from Node to a goal
solve(Node, Solution) :-
    depthfirst([], Node, Solution).

% depthfirst(Path, Node, Solution):
% extending the path [Node | Path] to a goal gives Solution
depthfirst(Path, Node, [Node | Path]) :-
    goal(Node).

depthfirst(Path, Node, Sol) :-
    s(Node, Node1),
    \+ member(Node1, Path),  % avoid cycles
    depthfirst([Node | Path], Node1, Sol).

output:
?-[file name].
true
?- solve(a,path).
path=[g,f,e,b,a].
?-depthfirst2(a,path,s).
path=[a,b,e,f,g].

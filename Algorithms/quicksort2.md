Quicksort

* v = pivot
* [] = sorted

v
7 4 12 2 14 10 8 6 1 13 5 11 3 9			- O(n)

v				v
4 2 6 1 5 3 [7] 12 14 10 8 13 11 9			- O(n-1) = O(n)

v		  v		  v				 v
2 1 3 [4] 6 5 [7] 10 8 11 9 [12] 14 13		- O(n-3) = O(n)

					  v
[1 2 3] [4] [5 6] [7] 8 9 [10 11] [12] [13 14]

[1 2 3 4 5 6 7 8 9 10]


O(log n) * O(n) == O(n log n)




xxxxxxxxxxxxxxxx
xxxxxxxx xxxxxxxx
xxxx xxxx xxxx xxxx
xx xx xx xx xx xx xx xx
x x x x x x x x x x x x x x x x
log n is sort of opposite of n^2




worst case:

v
1 2 3 4 5 6 7 8 9 10
	v
[1] 2 3 4 5 6 7 8 9 10
	  v
[1 2] 3 4 5 6 7 8 9 10
		v
[1 2 3] 4 5 6 7 8 9 10

etc until the end

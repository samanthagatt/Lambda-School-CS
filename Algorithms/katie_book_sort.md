def katiesort(books):
	empty = []
	alpha = 'abcdefghijklmnopqrstuvwxyz'

	for a in alpha:						- O(26)
		for i, b in enumerate(books):	- O(n)
			if b[0].lower() == a:		- O(1)
				empty.append(b)			- O(1)
				books.pop(i)			- O(1)
	return empty

O(26) * O(n) * ( O(1) + O(1) + O(1) )
O(1) * O(n) * ( O(3) )
O(n) * O(1)
O(n)
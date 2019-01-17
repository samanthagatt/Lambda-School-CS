import math

# [5, 7, 9, 3, 8, 6, 2, 1]

pivot_1 = 5

left_1 = [2, 3, 1]
right_1 = [7, 9, 8, 6]

result_1 = [2, 3, 1,   5,   7, 9, 6]

pivot_2 = 2
left_2 = [1]
right_2 = [3]

result_2 = [1,  2,  3,  5,  7, 9, 6]

pivot_3 = 9
left_3 = [7, 6]
right_3 = []

def partition(l):
    pivot_index = math.floor(len(l) / 2)
    left = l[:pivot_index]
    right = l[pivot_index:]
    return left, l[pivot_index], right

def quicksort(l):
    if len(l) == 0:
        return l[0]
    left, pivot, right = partition(l)
    return quicksort(left) + pivot + quicksort(right)

def list_contains(l, x):
    if l == []:
        return False
    elif l[0] == x:
        return True
    
    return list_contains(l[1:], x)

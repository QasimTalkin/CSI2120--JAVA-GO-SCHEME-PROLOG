# question 7 
# Fill in the python command to produce the output shown

# a)
a = [ 2*x for x in range(10) if x % 3 == 0]
a
# [0, 6, 12, 18]

# b)
d = { 3:'hello', 4:'world', 5:'from', 12:'uOttawa'}
d[4]
# 'world'

# c)
t = [-1,-2,-3,-4]
t[-1]
# -4

# d)
k = ['a', 'b', [1, 2, 3], 'c']
k[1:3]
# ['b', [1, 2, 3]]


# e)
l = [ x*y for x in range(1,3) for y in 'abc' ]
l[3]
# 'aa'

# f)
r1 = [ 1, 2, 3]
r2 = r1
r2[1] = 5
r1
# [ 1, 5, 3]
 

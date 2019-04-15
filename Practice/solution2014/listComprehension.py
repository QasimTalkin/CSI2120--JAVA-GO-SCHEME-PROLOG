numbers = [ 1, 2, 3, 4, 5, 6, 7, 8 ]
letters = [ 'A', 'B', 'C', 'D', 'E', 'F', 'G', 'H' ]
fields = []

for l in letters:
	for n in numbers:
		fields.append((l,n))

print( fields )

		
fields2 = [ (l,n) for l in letters for n in numbers ] 
print( fields2 )
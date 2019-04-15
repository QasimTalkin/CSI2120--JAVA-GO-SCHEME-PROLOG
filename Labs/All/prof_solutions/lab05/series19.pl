seriesNM(0,M,M).
seriesNM(N,M,Y) :- N > 0,
				N1 is N-1,
				seriesNM(N1,M,Y1),
				Y is 0.5 * (Y1 + 9/Y1).
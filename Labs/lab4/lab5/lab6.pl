seriesNM(0,_,0).
    seriesNM(N,M,Y) :- N > 0,
			seriesNM(n-1,M,y1),
			seriesNM(n-2,M,Y2),
			Y is (n-1)*Y1+(n-2)*Y2.

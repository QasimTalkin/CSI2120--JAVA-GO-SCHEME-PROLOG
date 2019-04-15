% Source:
% http://www.anselm.edu/internet/compsci/Faculty_Staff/mmalita/HOMEPAGE/logic/beds1.txt
% brain teaser of unknown origin
										  
bunkbeds(L):- L=[[N1,C1],[N2,C2],[kayla,C3],[N4,C4],[N5,C5],[N6,C6]],
    ((N1=reeva,N2=haley);(N2=reeva,N1=haley)),  /* 1.*/
    member(C1,[black,blue,brown]), /* 2 */
    member(C3,[black,blue,brown]),
    member(C5,[black,blue,brown]),
    member([blue,red],[[C1,C2],[C3,C4],[C5,C6]]), /* 4 */
    member(liza,[N1,N5]),	 /* 5 */
    member(zoe,[N1,N2,N4,N5,N6]),
    brown=C5, 			/* 8 */
    member([black,yellow],[[C1,C2],[C3,C4],[C5,C6]]), /* 9 */
    member(green,[C1,C2,C3,C4,C5,C6]),
    member([beth,C],Sol),member(C,[red,yellow,green]),   /* 3 */
    not(N4=zoe). /* 7 */		

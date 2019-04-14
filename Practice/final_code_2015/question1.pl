% question 1: The curriculum comittee is working on new pre-requisites for co-op. The comittee is considering a student elgible for co-op if
% 1) Student is at least in second year
% 2) Student has passed ITI1121 with at least D+
% 3) Student has passed CSI2120 with at least B
% 4) Student is fulltime
% Design a rule elgible
% Given the following facts:

% Name, Year, full-time/part-time, [ (Course, Letter Grade), ...]
student( jane, 2, ft, [ (iti1120,'B'), (iti1121,'B+'), (csi2120,'A+'), (csi2372,'A-') ]).
student( joe, 3, pt, [ (iti1120,'A'), (iti1121,'B'), (csi2120,'C'), (csi2372,'C'), (csi3105,'F')]).
student( mary, 1, ft, [ (iti1100, 'A+'), (iti1120,'A+'), (iti1121,'A+') ] ).

% true if Course is listed in L with at least MinGrade
grade(Course, MinGrade, [(Course,Grade)|_] ) :- Grade @=< MinGrade.
grade(Course, MinGrade, [_|L]) :- grade(Course, MinGrade, L). 

eligible( Name ) :- student( Name, Year, Status, L ),
		    Year >= 2,
		    Status = ft,
		    grade( iti1121, 'D+', L ),
		    grade( csi2120, 'B', L ).


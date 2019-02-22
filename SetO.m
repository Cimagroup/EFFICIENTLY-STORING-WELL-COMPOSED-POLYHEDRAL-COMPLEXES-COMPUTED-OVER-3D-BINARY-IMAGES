%--------------------------------------------------------------------------------------
%SETS O_0, O_1 AND O_2
%--------------------------------------------------------------------------------------
%INPUT:  p = position [i;j;k] in a 3D matrix. 
%        v = coordinates of the minimum vertex of the cubical complex Q(I).
%OUTPUT: k = 0,1,2 or -1 if the coordinates of the 3D point of the 
%        position p in the matrix J belong to the set O_0, O_1, O_2 or none. 
%--------------------------------------------------------------------------------------

function k = SetO( p,v )

q = [v(1)+p(1)-1;v(2)+p(2)-1;v(3)+p(3)-1];

if mod(q(1),2) == 1 && mod(q(2),2) == 1 && mod(q(3),2) == 1
    k = 0;
elseif (mod(q(1),2) == 1 && mod(q(2),2) == 1 && mod(q(3),2) == 0) || (mod(q(1),2) == 1 && mod(q(2),2) == 0 && mod(q(3),2) == 1) || (mod(q(1),2) == 0 && mod(q(2),2) == 1 && mod(q(3),2) == 1)
    k = 1;
elseif (mod(q(1),2) == 1 && mod(q(2),2) == 0 && mod(q(3),2) == 0) || (mod(q(1),2) == 0 && mod(q(2),2) == 1 && mod(q(3),2) == 0) || (mod(q(1),2) == 0 && mod(q(2),2) == 0 && mod(q(3),2) == 1)
    k = 2;
else
    k = -1;
end


%--------------------------------------------------------------------------------------
%SETS E_0, E_1, E_2 AND E_3
%--------------------------------------------------------------------------------------
%INPUT:  p = position [i;j;k] in a 3D matrix. 
%        v = coordinates of the minimum vertex of the cubical complex Q(I).
%OUTPUT: k = 0,1,2,3 or -1 if the coordinates of the 3D point of the 
%        position p in the matrix J belong to the set E0, E1, E2, E3 or none. 
%--------------------------------------------------------------------------------------

function k = SetE( p,v )

q = coord( p,v );

if mod(q(1),4) == 2 && mod(q(2),4) == 2 && mod(q(3),4) == 2
    k = 0;
elseif (mod(q(1),4) == 2 && mod(q(2),4) == 2 && mod(q(3),4) == 0) || (mod(q(1),4) == 2 && mod(q(2),4) == 0 && mod(q(3),4) == 2) || (mod(q(1),4) == 0 && mod(q(2),4) == 2 && mod(q(3),4) == 2)
    k = 1;
elseif (mod(q(1),4) == 2 && mod(q(2),4) == 0 && mod(q(3),4) == 0) || (mod(q(1),4) == 0 && mod(q(2),4) == 2 && mod(q(3),4) == 0) || (mod(q(1),4) == 0 && mod(q(2),4) == 0 && mod(q(3),4) == 2)
    k = 2;
elseif mod(q(1),4) == 0 && mod(q(2),4) == 0 && mod(q(3),4) == 0
    k = 3;
else
    k = -1;
end


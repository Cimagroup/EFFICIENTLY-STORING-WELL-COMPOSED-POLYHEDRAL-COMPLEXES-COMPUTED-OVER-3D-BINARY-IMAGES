%--------------------------------------------------------------------------------------
%COORDINATES OF THE 3D POINTS IN THE POSITION P OF A MATRIX
%--------------------------------------------------------------------------------------
%INPUT:  p = position in a matrix.
%        v = coordinates of the minimum vertex of the cubical complex Q(I).
%OUTPUT: w = coordinates of the 3D points in the position p.
%--------------------------------------------------------------------------------------

function w = coord( p,v )

w = [v(1)+p(1)-1;v(2)+p(2)-1;v(3)+p(3)-1];

end


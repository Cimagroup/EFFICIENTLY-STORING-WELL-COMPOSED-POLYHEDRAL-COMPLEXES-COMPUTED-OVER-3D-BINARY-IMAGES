%--------------------------------------------------------------------------------------
%Binary ECM OF Q(I) => binary image J = (Z^3, F_J)
%--------------------------------------------------------------------------------------
%INPUT:  I = matrix of dimension 3 x n, where n is the number of points of a 
%            3D binary digital image I.  Each column of I represents the coordinates of 
%            the points of the image rescaled with factor 4.
%OUTPUT: J = 3D binary digital image that encodes Q(I), being Q(I) the
%            cubical complex associated to I.
%        v = coordinates of the minimum vertex of the cubical complex Q(I). 
%--------------------------------------------------------------------------------------

function [J,v] = generate_encoding_Q( I )

M = [1 0 1 0 1;0 0 0 0 0;1 0 1 0 1;0 0 0 0 0;1 0 1 0 1];

min_coord = [min(I(1,:));min(I(2,:));min(I(3,:))];
max_coord = [max(I(1,:));max(I(2,:));max(I(3,:))];

diff = 4;

s = single( 4* ( ( max_coord' - min_coord' ) / diff + 1 ) + 1 ); %rescale

%Inicialize J
J = zeros ( s(1),s(2),s(3) );

v = min_coord + [-2;-2;-2]; 
t = [1;1;1] - v; %vector to place the vertex v in the position [1,1,1].

%For each point p of I (moved by the vector t), add to J the matrix of the table 1.a.3) centered at p. 
for i = 1:size(I,2)
    p = I(:,i) + t;    
    J(p(1)-2:p(1)+2,p(2)-2:p(2)+2,p(3)) = M;
    J(p(1)-2:p(1)+2,p(2)-2:p(2)+2,p(3)-2) = M;
    J(p(1)-2:p(1)+2,p(2)-2:p(2)+2,p(3)+2) = M;
end

end


%------------------------------------------------------------------------------------------------------
%PROCEDURE 1:
%------------------------------------------------------------------------------------------------------
%ENCODING OF P(I) from the binary image J = (Z^3, F_J)(encoding of Q(I)) => binary image L = (Z^3, F_L)
%------------------------------------------------------------------------------------------------------
%INPUT:  J = enconding of Q(I).
%        v = coordinates of the minimum vertex of the cubical complex Q(I).
%OUTPUT: L = enconding of P(I).
%        R = critical vertices of Q(I).
%-----------------------------------------------------------------------------------------------------

function [L,R] = generate_encoding_P( J2,v2 )

J  = extend_boundary( J2 );
v = v2 - [2;2;2];

%Inicialize L
L = J;

%Compute the set of critical vertices R
R = critical_vertices(J,v);

for t = 1:size(R,2)
    p = R(:,t); %p is a vertex, then p \in E_0 = {(4i+2,4j+2,4k+2)}
    i = p(1);
    j = p(2);
    k = p(3);
    
    L(i-1:i+1,j-1:j+1,k-1:k+1) = 1; %S_0-block centered at p
    
    %Add to L the S-blocks centered at the critical cells (edges, faces and cubes)
    
    %6 edges 
    if J(i+2,j,k) == 1 %p + [2,0,0] is a critical edge
        L(i+2,j-1:j+1,k-1:k+1) = 1; %S1-block centered at p + [2,0,0]    
    end
    
    if J(i-2,j,k) == 1 %p + [-2,0,0] is a critical edge
        L(i-2,j-1:j+1,k-1:k+1) = 1; %S1-block centered at p + [-2,0,0]    
    end
    
    if J(i,j+2,k) == 1 %p + [0,2,0] is a critical edge
        L(i-1:i+1,j+2,k-1:k+1) = 1; %S1-block centered at p + [0,2,0]    
    end
    
    if J(i,j-2,k) == 1 %p + [0,-2,0] is a critical edge
        L(i-1:i+1,j-2,k-1:k+1) = 1; %S1-block centered at p + [0,-2,0]    
    end
    
    if J(i,j,k+2) == 1 %p + [0,0,2] is a critical edge
        L(i-1:i+1,j-1:j+1,k+2) = 1; %S1-block centered at p + [0,0,2]    
    end
    
    if J(i,j,k-2) == 1 %p + [0,0,-2] is a critical edge
        L(i-1:i+1,j-1:j+1,k-2) = 1; %S1-block centered at p + [0,0,-2]    
    end
    
    %12 faces 
    if J(i+2,j+2,k) == 1 %p + [2,2,0] is a critical face
        L(i+2,j+2,k-1:k+1) = 1; %S2-block centered at p + [2,2,0]    
    end
    
    if J(i+2,j-2,k) == 1 %p + [2,-2,0] is a critical face
        L(i+2,j-2,k-1:k+1) = 1; %S2-block centered at p + [2,-2,0]    
    end
    
    if J(i-2,j+2,k) == 1 %p + [-2,2,0] is a critical face
        L(i-2,j+2,k-1:k+1) = 1; %S2-block centered at p + [-2,2,0]    
    end
    
    if J(i-2,j-2,k) == 1 %p + [-2,-2,0] is a critical face
        L(i-2,j-2,k-1:k+1) = 1; %S2-block centered at p + [-2,-2,0]    
    end
    
    if J(i+2,j,k+2) == 1 %p + [2,0,2] is a critical face
        L(i+2,j-1:j+1,k+2) = 1; %S2-block centered at p + [2,0,2]    
    end
    
    if J(i+2,j,k-2) == 1 %p + [2,0,-2] is a critical face
        L(i+2,j-1:j+1,k-2) = 1; %S2-block centered at p + [2,0,-2]    
    end
    
    if J(i-2,j,k+2) == 1 %p + [-2,0,2] is a critical face
        L(i-2,j-1:j+1,k+2) = 1; %S2-block centered at p + [-2,0,2]    
    end
    
    if J(i-2,j,k-2) == 1 %p + [-2,0,-2] is a critical face
        L(i-2,j-1:j+1,k-2) = 1; %S2-block centered at p + [-2,0,-2]    
    end
    
    if J(i,j+2,k+2) == 1 %p + [0,2,2] is a critical face
        L(i-1:i+1,j+2,k+2) = 1; %S2-block centered at p + [0,2,2]    
    end
    
    if J(i,j+2,k-2) == 1 %p + [0,2,-2] is a critical face
        L(i-1:i+1,j+2,k-2) = 1; %S2-block centered at p + [0,2,-2]    
    end
    
    if J(i,j-2,k+2) == 1 %p + [0,-2,2] is a critical face
        L(i-1:i+1,j-2,k+2) = 1; %S2-block centered at p + [0,-2,2]    
    end
    
    if J(i,j-2,k-2) == 1 %p + [0,-2,-2] is a critical face
        L(i-1:i+1,j-2,k-2) = 1; %S2-block centered at p + [0,-2,-2]    
    end
    
    %8 cubes
    
    if J(i+2,j+2,k+2) == 1 %p + [2,2,2] is a critical cube
        L(i+2,j+2,k+2) = 1; %S3-block centered at p + [2,2,2]    
    end
    
    if J(i+2,j+2,k-2) == 1 %p + [2,2,-2] is a critical cube
        L(i+2,j+2,k-2) = 1; %S3-block centered at p + [2,2,-2]    
    end
    
    if J(i+2,j-2,k+2) == 1 %p + [2,-2,2] is a critical cube
        L(i+2,j-2,k+2) = 1; %S3-block centered at p + [2,-2,2]    
    end
    
    if J(i-2,j+2,k+2) == 1 %p + [-2,2,2] is a critical cube
        L(i-2,j+2,k+2) = 1; %S3-block centered at p + [-2,2,2]    
    end
    
    if J(i+2,j-2,k-2) == 1 %p + [2,-2,-2] is a critical cube
        L(i+2,j-2,k-2) = 1; %S3-block centered at p + [2,-2,-2]    
    end
    
    if J(i-2,j+2,k-2) == 1 %p + [-2,2,-2] is a critical cube
        L(i-2,j+2,k-2) = 1; %S3-block centered at p + [-2,2,-2]    
    end
    
    if J(i-2,j-2,k+2) == 1 %p + [-2,-2,2] is a critical cube
        L(i-2,j-2,k+2) = 1; %S3-block centered at p + [-2,-2,2]    
    end
    
    if J(i-2,j-2,k-2) == 1 %p + [-2,-2,-2] is a critical cube
        L(i-2,j-2,k-2) = 1; %S3-block centered at p + [-2,-2,-2]    
    end
    
end

end


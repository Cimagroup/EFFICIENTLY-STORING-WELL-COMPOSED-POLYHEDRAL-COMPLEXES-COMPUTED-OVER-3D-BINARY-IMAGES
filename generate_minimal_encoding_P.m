%--------------------------------------------------------------------------------------
%PROCEDURE 3:
%--------------------------------------------------------------------------------------
%MINIMAL ENCODING OF P(I) => binary image M = (Z^3, F_M)
%--------------------------------------------------------------------------------------
%INPUT:  J = 3D binary digital image that encodes Q(I), being Q(I) the
%            cubical complex associated to a 3D binary digital image I.
%        CV = critical vertices.
%        v = coordinates of the minimum vertex of the cubical complex Q(I).
%OUTPUT: M = minimal enconding of P(I).
%--------------------------------------------------------------------------------------

function M = generate_minimal_encoding_P(J2,R,v2 )

J  = extend_boundary( J2 );
v = v2 - [2;2;2];

M = zeros(size(J,1),size(J,2),size(J,3));

for k = 1:size(J,3)
    for j = 1:size(J,2)
        for i = 1:size(J,1)
            p = [i;j;k];
            if J(i,j,k) == 1 && SetE(p,v) == 3
                M(i,j,k) = 1; %center of the cubes
            end
        end
    end
end

for t = 1:size(R,2)
    p = R(:,t);
    i = p(1);
    j = p(2);
    k = p(3);
    
    M(i,j,k) = 1;
    
    %6-neighbors of p to distance 2
    v1 = [i+2;j;k];
    v2 = [i-2;j;k];
    v3 = [i;j+2;k];
    v4 = [i;j-2;k];
    v5 = [i;j;k+2];                                 
    v6 = [i;j;k-2];               
                
    V6 = [v1 v2 v3 v4 v5 v6];
    
    for l=1:6
        w = V6(:,l);                    
        if J(w(1),w(2),w(3)) == 1 && SetE(w,v) == 1
            M(w(1),w(2),w(3)) = 1;    
        end
    end
    
    %12-neighbors of p to distance 2
    v1 = [i+2;j+2;k];
    v2 = [i-2;j-2;k];
    v3 = [i-2;j+2;k];
    v4 = [i+2;j-2;k];
    v5 = [i+2;j;k+2];
    v6 = [i-2;j;k-2];
    v7 = [i+2;j;k-2];
    v8 = [i-2;j;k+2];
    v9 = [i;j+2;k+2];
    v10 = [i;j-2;k-2];
    v11 = [i;j+2;k-2];
    v12 = [i;j-2;k+2];
                
    V12 = [v1 v2 v3 v4 v5 v6 v7 v8 v9 v10 v11 v12];                
                    
    for l=1:12
        w = V12(:,l);
        if J(w(1),w(2),w(3)) == 1 && SetE(w,v) == 2                            
            M(w(1),w(2),w(3)) = 1;   
        end
    end
end


end


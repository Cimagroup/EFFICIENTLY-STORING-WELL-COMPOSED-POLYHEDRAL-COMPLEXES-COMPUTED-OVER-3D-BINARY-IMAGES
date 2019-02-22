%--------------------------------------------------------------------------------------
%CRITICAL VERTICES OF Q(I)
%--------------------------------------------------------------------------------------
%INPUT:  J = 3D binary digital image that encodes Q(I), being Q(I) the
%            cubical complex associated to a 3D binary digital image I. 
%        v = coordinates of the minimum vertex of the cubical complex Q(I).
%OUTPUT: CV = matrix of dimension 3 x n, where n is the number of critical
%             vertices of Q(I). Each column represents the position of the
%             critical vertex in the 3D matrix J.
%Auxiliar functions: 
%     CC = criticalConfigurations(); 
%     k = SetE(p,v);     
%     V = vertices_8(p,d);
%     k = belong(M,m);
%--------------------------------------------------------------------------------------

function CV = critical_vertices(J,v)

s1 = size(J,1) + 1;
s2 = size(J,2) + 1;
s3 = size(J,3) + 1;

CC = criticalConfigurations(); 

CV = [];

for k = 1:size(J,3)
    for i = 1:size(J,1)
        for j = 1:size(J,2)            
            if J(i,j,k) == 1 
                p = [i;j;k];                
                if SetE( p,v ) == 0
                    V1 = vertices_8(p,1); 
                    v1 = [];
                    for t = 1:8
                        w = V1(:,t);
                        if w(1) > 0 && w(2) > 0 && w(3) > 0 && w(1) < s1 && w(2) < s2 && w(3) < s3
                            c = J(w(1),w(2),w(3));
                            v1 = [v1 c];                            
                        else
                            v1 = [v1 0];
                        end
                    end                    
                
                    V2 = vertices_8(p,2); 
                    v2 = [];
                    for t = 1:8
                        w = V2(:,t);
                        if w(1) > 0 && w(2) > 0 && w(3) > 0 && w(1) < s1 && w(2) < s2 && w(3) < s3
                            c = J(w(1),w(2),w(3));
                            v2 = [v2 c];                             
                        else
                            v2 = [v2 0];
                        end
                    end
                
                    if v1 == zeros(1,8) 
                        if belong(CC,v2) > 0                        
                            CV = [CV p];
                        end
                    end
                end
            end             
        end
    end
end
end


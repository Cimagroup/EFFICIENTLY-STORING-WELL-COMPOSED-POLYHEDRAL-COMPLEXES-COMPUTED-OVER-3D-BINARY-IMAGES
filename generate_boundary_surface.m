%--------------------------------------------------------------------------------------
%PROCEDURE 5:
%--------------------------------------------------------------------------------------
%BINARY IMAGE H = (Z^3, F_H) ENCODING THE 2-CELLS OF THE BOUNDARY OF P(I)
%--------------------------------------------------------------------------------------
%INPUT:  M = minimal encoding of P(I).
%        v = coordinates of the minimum vertex of the cubical complex Q(I).
%OUTPUT: H = encoding of boundary of P(I).
%-------------------------------------------------------------------------------------
function H2 = generate_boundary_surface( M,v )

M2  = extend_boundary( M );
v2 = v - [2;2;2];

H2 = zeros(size(M2,1),size(M2,2),size(M2,3));

for k = 1:size(M2,3)
    for j = 1:size(M2,2)
        for i = 1:size(M2,1)
            if M2(i,j,k) == 1
                p = [i;j;k];
                c = coord(p,v2);
                D1 = [p+[1;0;0] p+[-1;0;0] p+[0;1;0] p+[0;-1;0] p+[0;0;1] p+[0;0;-1]];
                D2 = [p+[2;0;0] p+[-2;0;0] p+[0;2;0] p+[0;-2;0] p+[0;0;2] p+[0;0;-2]];
                D4 = [p+[4;0;0] p+[-4;0;0] p+[0;4;0] p+[0;-4;0] p+[0;0;4] p+[0;0;-4]];
                if SetE(p,v) == 3 
                    for t = 1:6 
                        if M2(D2(1,t),D2(2,t),D2(3,t)) == 0 && M2(D4(1,t),D4(2,t),D4(3,t)) == 0
                            H2(D2(1,t),D2(2,t),D2(3,t)) = 1;
                        end 
                    end
                    
                elseif mod(c(1),4) == 2 && mod(c(2),4) == 0 && mod(c(3),4) == 0
                    if M2(i+2,j,k) == 0
                        H2(i+1,j,k) = 1;
                    end
                    if M2(i-2,j,k) == 0
                        H2(i-1,j,k) = 1;
                    end
                    
                elseif mod(c(1),4) == 0 && mod(c(2),4) == 2 && mod(c(3),4) == 0 
                    if M2(i,j+2,k) == 0
                        H2(i,j+1,k) = 1;
                    end
                    if M2(i,j-2,k) == 0
                        H2(i,j-1,k) = 1;
                    end
                    
                elseif mod(c(1),4) == 0 && mod(c(2),4) == 0 && mod(c(3),4) == 2 
                    if M2(i,j,k+2) == 0
                        H2(i,j,k+1) = 1;
                    end
                    if M2(i,j,k-2) == 0
                        H2(i,j,k-1) = 1;
                    end
                    
                elseif mod(c(1),4) == 2 && mod(c(2),4) == 2 && mod(c(3),4) == 0
                    if M2(i+2,j+2,k) == 0
                        H2(i+1,j+1,k) = 1;
                    end
                    if M2(i+2,j-2,k) == 0
                        H2(i+1,j-1,k) = 1;
                    end
                    if M2(i-2,j+2,k) == 0
                        H2(i-1,j+1,k) = 1;
                    end
                    if M2(i-2,j-2,k) == 0
                        H2(i-1,j-1,k) = 1;
                    end
                    
                elseif mod(c(1),4) == 2 && mod(c(2),4) == 0 && mod(c(3),4) == 2 
                    if M2(i+2,j,k+2) == 0
                        H2(i+1,j,k+1) = 1;
                    end
                    if M2(i+2,j,k-2) == 0
                        H2(i+1,j,k-1) = 1;
                    end
                    if M2(i-2,j,k+2) == 0
                        H2(i-1,j,k+1) = 1;
                    end
                    if M2(i-2,j,k-2) == 0
                        H2(i-1,j,k-1) = 1;
                    end
                    
                elseif mod(c(1),4) == 0 && mod(c(2),4) == 2 && mod(c(3),4) == 2 
                    if M2(i,j+2,k+2) == 0
                        H2(i,j+1,k+1) = 1;
                    end
                    if M2(i,j+2,k-2) == 0
                        H2(i,j+1,k-1) = 1;
                    end
                    if M2(i,j-2,k+2) == 0
                        H2(i,j-1,k+1) = 1;
                    end
                    if M2(i,j-2,k-2) == 0
                        H2(i,j-1,k-1) = 1;
                    end
                    
                elseif SetE(p,v2) == 0
                    for t = 1:6 
                        if M2(D2(1,t),D2(2,t),D2(3,t)) == 0 
                            H2(D1(1,t),D1(2,t),D1(3,t)) = 1;
                        end 
                    end                    
                end
            end
        end
    end
    
%H = zeros(size(M,1),size(M,2),size(M,3));

%for s = 1:size(H,3)
%    H(:,:,s) = H2(3:size(M2,2)-2,3:size(M2,2)-2,s+2);
%end

end
                
                
         






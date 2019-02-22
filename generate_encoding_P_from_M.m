%PROCEDURE 4:
%--------------------------------------------------------------------------------------
%ENCODING OF P(I) from the minimal encoding M = (Z^3, F_M) of P(I)
%--------------------------------------------------------------------------------------
%INPUT:  M = minimal encoding of P(I).
%        v = coordinates of the minimum vertex of the cubical complex Q(I).
%OUTPUT: L = enconding of P(I).
%--------------------------------------------------------------------------------------

function L = generate_encoding_P_from_M( M2,v2 )

M  = extend_boundary( M2 );
v = v2 - [2;2;2];

%Inicialize L
L = M;

for k = 1:size(M,3)
    for j = 1:size(M,2)
        for i = 1:size(M,1)
            p = [i;j;k];
            if M(i,j,k) == 1 && SetE(p,v) ~= 3                        
                c = coord(p,v);
                
                if mod(c(1),4) == 2 && mod(c(2),4) == 2 && mod(c(3),4) == 2  %Point of E0 = (4i+2,4j+2,4k+2) 
                    L(i-1:i+1,j-1:j+1,k-1:k+1) = 1; %S0-block
                
                elseif mod(c(1),4) == 2 && mod(c(2),4) == 2 && mod(c(3),4) == 0 %Point of E1 = (4i+2,4j+2,4k)
                    L(i-1:i+1,j-1:j+1,k) = 1; %S1-block                 
                    
                    if M(i,j,k+2) == 0 %v = p + [0;0;2];
                        L(i,j,k+2) = 1;
                    end
                    if M(i,j,k-2) == 0 %w = p + [0;0;-2];
                        L(i,j,k-2) = 1;
                    end
                
                elseif mod(c(1),4) == 2 && mod(c(2),4) == 0 && mod(c(3),4) == 2  %Point of E1 = (4i+2,4j,4k+2)
                    L(i-1:i+1,j,k-1:k+1) = 1; %S1-block
                    
                    if M(i,j+2,k) == 0 
                        L(i,j+2,k) = 1;
                    end
                    if M(i,j-2,k) == 0 
                        L(i,j-2,k) = 1;
                    end
                
                elseif mod(c(1),4) == 0 && mod(c(2),4) == 2 && mod(c(3),4) == 2 %Point of E1 = (4i,4j+2,4k+2)
                    L(i,j-1:j+1,k-1:k+1) = 1; %S1-block
                    
                    if M(i+2,j,k) == 0 
                        L(i+2,j,k) = 1;
                    end
                    if M(i-2,j,k) == 0 
                        L(i-2,j,k) = 1;
                    end
                
                elseif mod(c(1),4) == 2 && mod(c(2),4) == 0 && mod(c(3),4) == 0 %Point of E2 = (4i+2,4j,4k)
                    L(i-1:i+1,j,k) = 1; %S2-block
                    
                    if M(i,j,k-2) == 0
                        L(i,j,k-2) = 1; %edge
                        L(i,j-2,k-2) = 1; %vertex
                        L(i,j+2,k-2) = 1; %vertex
                    end
                    if M(i,j+2,k) == 0
                        L(i,j+2,k) = 1; %edge
                        L(i,j+2,k+2) = 1; %vertex
                        L(i,j+2,k-2) = 1; %vertex
                    end
                    if M(i,j,k+2) == 0
                        L(i,j,k+2) = 1; %edge
                        L(i,j-2,k+2) = 1; %vertex
                        L(i,j+2,k+2) = 1; %vertex
                    end
                    if M(i,j-2,k) == 0
                        L(i,j-2,k) = 1; %edge
                        L(i,j-2,k+2) = 1; %vertex
                        L(i,j-2,k-2) = 1; %vertex
                    end
                
                elseif mod(c(1),4) == 0 && mod(c(2),4) == 2 && mod(c(3),4) == 0 %Point of E2 = (4i,4j+2,4k)
                    L(i,j-1:j+1,k) = 1; %S2-block
                    
                    if M(i,j,k-2) == 0
                        L(i,j,k-2) = 1; %edge
                        L(i-2,j,k-2) = 1; %vertex
                        L(i+2,j,k-2) = 1; %vertex
                    end
                    if M(i+2,j,k) == 0
                        L(i+2,j,k) = 1; %edge
                        L(i+2,j,k+2) = 1; %vertex
                        L(i+2,j,k-2) = 1; %vertex
                    end
                    if M(i,j,k+2) == 0
                        L(i,j,k+2) = 1; %edge
                        L(i-2,j,k+2) = 1; %vertex
                        L(i+2,j,k+2) = 1; %vertex
                    end
                    if M(i-2,j,k) == 0
                        L(i-2,j,k) = 1; %edge
                        L(i-2,j,k+2) = 1; %vertex
                        L(i-2,j,k-2) = 1; %vertex
                    end
                    
                
                elseif mod(c(1),4) == 0 && mod(c(2),4) == 0 && mod(c(3),4) == 2 %Point of E2 E2 = (4i,4j,4k+2)
                    L(i,j,k-1:k+1) = 1; %S2-block
                    
                    if M(i-2,j,k) == 0
                        L(i-2,j,k) = 1; %edge
                        L(i-2,j-2,k) = 1; %vertex
                        L(i-2,j+2,k) = 1; %vertex
                    end
                    if M(i,j+2,k) == 0
                        L(i,j+2,k) = 1; %edge
                        L(i+2,j+2,k) = 1; %vertex
                        L(i-2,j+2,k) = 1; %vertex
                    end
                    if M(i+2,j,k) == 0
                        L(i+2,j,k) = 1; %edge
                        L(i+2,j-2,k) = 1; %vertex
                        L(i+2,j+2,k) = 1; %vertex
                    end
                    if M(i,j-2,k) == 0
                        L(i,j-2,k) = 1; %edge
                        L(i+2,j-2,k) = 1; %vertex
                        L(i-2,j-2,k) = 1; %vertex
                    end
                end
                
            elseif M(i,j,k) == 1 && SetE(p,v) ~= 3
                
                    v1 = p + [-2;-2;2];
                    v2 = p + [-2;2;2];
                    v3 = p + [-2;-2;-2];
                    v4 = p + [-2;2;-2];
                    v5 = p + [2;-2;2];
                    v6 = p + [2;2;2];
                    v7 = p + [2;-2;-2];
                    v8 = p + [2;2;-2];
                    
                    c1234 = (v1 + v2 + v3 + v4)/4;
                    c5687 = (v5 + v6 + v8 + v7)/4;
                    c1375 = (v1 + v3 + v7 + v5)/4;
                    c2486 = (v2 + v4 + v8 + v6)/4;
                    c1265 = (v1 + v2 + v6 + v5)/4;
                    c3487 = (v3 + v4 + v8 + v7)/4;
                    
                    if M(c1234(1),c1234(2),c1234(3)) == 0
                        L(c1234(1),c1234(2),c1234(3)) = 1;
                        a12 = (v1+v2)/2;
                        a24 = (v2+v4)/2;
                        a43 = (v4+v3)/2;
                        a31 = (v3+v1)/2;
                        L(a12(1),a12(2),a12(3)) = 1;
                        L(a24(1),a24(2),a24(3)) = 1;
                        L(a43(1),a43(2),a43(3)) = 1;
                        L(a31(1),a31(2),a31(3)) = 1;
                        L(v1(1),v1(2),v1(3)) = 1;
                        L(v2(1),v2(2),v2(3)) = 1;
                        L(v3(1),v3(2),v3(3)) = 1;
                        L(v4(1),v4(2),v4(3)) = 1;
                    end
                    
                    if M(c5687(1),c5687(2),c5687(3)) == 0
                        L(c5687(1),c5687(2),c5687(3)) = 1;
                        a56 = (v5+v6)/2;
                        a68 = (v6+v8)/2;
                        a87 = (v8+v7)/2;
                        a75 = (v7+v5)/2;
                        L(a56(1),a56(2),a56(3)) = 1;
                        L(a68(1),a68(2),a68(3)) = 1;
                        L(a87(1),a87(2),a87(3)) = 1;
                        L(a75(1),a75(2),a75(3)) = 1;
                        L(v5(1),v5(2),v5(3)) = 1;
                        L(v6(1),v6(2),v6(3)) = 1;
                        L(v7(1),v7(2),v7(3)) = 1;
                        L(v8(1),v8(2),v8(3)) = 1;
                    end
                    
                    if M(c2486(1),c2486(2),c2486(3)) == 0
                        L(c2486(1),c2486(2),c2486(3)) = 1;
                        a48 = (v4+v8)/2;
                        a26 = (v2+v6)/2;
                        a24 = (v2+v4)/2;
                        a68 = (v6+v8)/2;
                        L(a48(1),a48(2),a48(3)) = 1;
                        L(a26(1),a26(2),a26(3)) = 1;
                        L(a24(1),a24(2),a24(3)) = 1;
                        L(a68(1),a68(2),a68(3)) = 1;
                        L(v2(1),v2(2),v2(3)) = 1;
                        L(v4(1),v4(2),v4(3)) = 1;
                        L(v8(1),v8(2),v8(3)) = 1;
                        L(v6(1),v6(2),v6(3)) = 1;
                    end
                    
                    if M(c1375(1),c1375(2),c1375(3)) == 0
                        L(c1375(1),c1375(2),c1375(3)) = 1;
                        a15 = (v1+v5)/2;
                        a37 = (v3+v7)/2;
                        a13 = (v1+v3)/2;
                        a57 = (v5+v7)/2;
                        L(a15(1),a15(2),a15(3)) = 1;
                        L(a37(1),a37(2),a37(3)) = 1;
                        L(a13(1),a13(2),a13(3)) = 1;
                        L(a57(1),a57(2),a57(3)) = 1;
                        L(v1(1),v1(2),v1(3)) = 1;
                        L(v3(1),v3(2),v3(3)) = 1;
                        L(v5(1),v5(2),v5(3)) = 1;
                        L(v7(1),v7(2),v7(3)) = 1;
                    end
                    
                    if M(c1265(1),c1265(2),c1265(3)) == 0
                        L(c1265(1),c1265(2),c1265(3)) = 1;
                        a12 = (v1+v2)/2;
                        a26 = (v2+v6)/2;
                        a65 = (v6+v5)/2;
                        a51 = (v5+v1)/2;
                        L(a12(1),a12(2),a12(3)) = 1;                        
                        L(a26(1),a26(2),a26(3)) = 1;
                        L(a65(1),a65(2),a65(3)) = 1;
                        L(a51(1),a51(2),a51(3)) = 1;
                        L(v1(1),v1(2),v1(3)) = 1;
                        L(v2(1),v2(2),v2(3)) = 1;
                        L(v6(1),v6(2),v6(3)) = 1;
                        L(v5(1),v5(2),v5(3)) = 1;
                    end
                    
                    if M(c3487(1),c3487(2),c3487(3)) == 0
                        L(c3487(1),c3487(2),c3487(3)) = 1;
                        a34 = (v3+v4)/2;
                        a48 = (v4+v8)/2;
                        a87 = (v8+v7)/2;
                        a73 = (v7+v3)/2;
                        L(a34(1),a34(2),a34(3)) = 1;                        
                        L(a48(1),a48(2),a48(3)) = 1;
                        L(a87(1),a87(2),a87(3)) = 1;
                        L(a73(1),a73(2),a73(3)) = 1;
                        L(v3(1),v3(2),v3(3)) = 1;
                        L(v4(1),v4(2),v4(3)) = 1;
                        L(v8(1),v8(2),v8(3)) = 1;
                        L(v7(1),v7(2),v7(3)) = 1;
                    end  
            end
        end
    end
end

end


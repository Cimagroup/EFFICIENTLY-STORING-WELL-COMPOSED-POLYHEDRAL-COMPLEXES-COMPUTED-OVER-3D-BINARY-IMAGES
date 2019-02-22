%------------------------------------------------------------------------------------------------------
%PROCEDURE 2:
%------------------------------------------------------------------------------------------------------
%COMPUTING THE (l-1)-FACES OF A CELL p \in F_L
%------------------------------------------------------------------------------------------------------
%INPUT:  L = enconding of P(I).
%        p = cell of L.
%        l = dimension of the cell p. 
%        v = coordinates of the minimum vertex of the cubical complex Q(I). 
%OUTPUT: Faces = set of (l-1)-cells of p.
%-----------------------------------------------------------------------------------------------------

function Faces = faces_of_cell( L,p,l,v )

%Inicialize Faces
Faces = [];

%N6 = N_6^1(p)
N6 = [p + [1;0;0] p + [-1;0;0] p + [0;1;0] p + [0;-1;0] p + [0;0;1] p + [0;0;-1]];

for i = 1:6
    q = N6(:,i);
    if L(q(1),q(2),q(3)) == 1 && SetO(q,v) == l-1
        Faces = [Faces q];
    elseif L(q(1),q(2),q(3)) == 0
        q1 = p + 2*(q-p);
        if L(q1(1),q1(2),q1(3)) == 1 && SetE(q1,v) == l-1
            Faces = [Faces q1];
        else
            %N8 = N_8^1(q)
            N8 = [q + [1;1;1] q + [-1;1;1] q + [1;-1;1] q + [1;1;-1] q + [-1;-1;1] q + [-1;1;-1] q + [1;-1;-1] q + [-1;-1;-1]];
            for j = 1:8
                q2 = N8(:,j);
                if L(q2(1),q2(2),q2(3)) == 1 && SetE(q2,v) == l-1
                    Faces = [Faces q2];
                end
            end
            
            %N12 = N_12^1(q)
            N12 = [q + [1;1;0] q + [-1;1;0] q + [-1;1;0] q + [-1;-1;0] q + [1;0;1] q + [-1;0;1] q + [1;0;-1] q + [-1;0;-1] q + [0;1;1] q + [0;-1;1] q + [0;1;-1] q + [0;-1;-1]];
            for k = 1:12
                q3 = N12(:,k);
                if L(q3(1),q3(2),q3(3)) == 1 && SetE(q3,v) == l-1
                    Faces = [Faces q3];
                end
            end
        end
    end
    
    
end

end


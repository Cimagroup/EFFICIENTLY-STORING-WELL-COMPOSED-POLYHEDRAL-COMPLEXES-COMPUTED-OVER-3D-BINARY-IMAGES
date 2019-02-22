%--------------------------------------------------------------------------------------
%BELONG P TO M?
%--------------------------------------------------------------------------------------
%INPUT:  M = matrix of dimension n x m. 
%        p = vector of m elements.
%OUTPUT: k = 0 if the vector p is not a row vector of the matrix M; if p is a row vector 
%            of the matrix M, k indicates that row. 
%--------------------------------------------------------------------------------------

function k = belong(M,p)

s = size(M);
n = s(1);
k = 0;

for i = 1:n
    if M(i,:) == p
        k = i;
    end
end

end


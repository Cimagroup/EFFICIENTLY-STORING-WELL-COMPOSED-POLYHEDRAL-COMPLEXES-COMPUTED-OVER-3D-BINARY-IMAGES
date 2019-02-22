function N  = extend_boundary( M )

N = zeros(size(M,1)+4,size(M,2)+4,size(M,1)+4);

for k = 1:size(M,3)
    N(3:size(M,1)+2,3:size(M,2)+2,k+2) = M(:,:,k);
end

end


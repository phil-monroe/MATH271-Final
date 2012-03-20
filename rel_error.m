function [ err ] = rel_error( A, B )
%REL_ERROR Computes the relative L2 error of B from A

a = double(A);
b = double(B);

err = norm(a-b)/norm(a);
end


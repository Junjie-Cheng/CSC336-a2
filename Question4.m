function Question4(~)

Alpha = sqrt(2)/2;
A = zeros(13, 13);

A(1,2) = 1;
A(1,6) = -1;
A(2,3) = 1;
A(3,1) = Alpha;
A(3,4) = -1;
A(3,5) = -Alpha;
A(4,1) = Alpha;
A(4,3) = 1;
A(4,5) = Alpha;
A(5,4) = 1;
A(5,8) = -1;
A(6,7) = 1;
A(7,5) = Alpha;
A(7,6) = 1;
A(7,9) = -Alpha;
A(7,10) = -1;
A(8,5) = Alpha;
A(8,7) = 1;
A(8,9) = Alpha;
A(9,10) = 1;
A(9,13) = -1;
A(10,11) = 1;
A(11,8) = 1;
A(11,9) = Alpha;
A(11,12) = -Alpha;
A(12,9) = Alpha;
A(12,11) = 1;
A(12,12) = Alpha;
A(13,13) = 1;
A(13,12) = Alpha;

b = zeros(13,1);
b(2) = 10;
b(8) = 15;
b(10) = 20;

f = A\b %#ok<NOPRT>

condA = cond(A, 2);

r = b - A*f;
r_residue = norm(r,2) / norm(b,2);
r_error_lower = (1 / condA) *r_residue;
r_error_upper = condA * r_residue;

fprintf('Lower bound of relative error is %e\n', r_error_lower);
fprintf('Upper bound of relative error is %e\n', r_error_upper);

end
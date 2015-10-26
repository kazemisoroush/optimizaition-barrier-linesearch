function [ pk ] = Newton( f, gradientF, xk )
% This function implements Newton algorithm.
%   Returns the right direction.
%   The input function must be differentiable in small neighbourhood of
%   input x[k], plus gradientF must be differentiable as well.

    syms x1 x2 x3;
    hessianF = [
        diff(diff(f, x1), x1) diff(diff(f, x1), x2) diff(diff(f, x1), x3); 
        diff(diff(f, x2), x1) diff(diff(f, x2), x2) diff(diff(f, x2), x3); 
        diff(diff(f, x3), x1) diff(diff(f, x3), x2) diff(diff(f, x3), x3); 
        ];
    
    pk = - (inv(subs(hessianF, [x1, x2, x3], xk)) * subs(gradientF, [x1, x2, x3], xk));

end


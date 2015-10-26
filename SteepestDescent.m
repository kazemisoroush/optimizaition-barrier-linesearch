function [ pk ] = SteepestDescent( f, gradientF, xk )
% This function implements Newton algorithm.
%   Returns the right direction.
%   The input function must be differentiable in small neighbourhood of input x[k].

    syms x1 x2 x3;
    
    pk = double(subs(-1 * gradientF, [x1, x2, x3], xk));

end


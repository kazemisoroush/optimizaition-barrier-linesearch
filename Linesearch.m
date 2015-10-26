function [ finalX ] = Linesearch( f, x_1 )
% This function implements LineSearch algorithm with input parameters.

    k = 1;
    x{1} = x_1;
    iterations = 500;
    
    syms x1 x2 x3;
    gradientF = [ diff(f, x1); diff(f, x2); diff(f, x3) ];
    
    while norm(double(subs(gradientF, [x1, x2, x3], x{k})), 2) > 0 && k <= iterations
        
        %pk = Newton( f, gradientF, x{k} ); % Direction.
        pk = SteepestDescent( f, gradientF, x{k} ); % Direction.
        %disp('____PK, Alpha___begin');
        %disp(pk);
        
        alpha = Backtracking(f, x{k}, pk); % Step size.
        %disp(alpha);
        %disp('____PK, Alpha___end');
        
        x{k + 1} = x{k} + pk * alpha;
        k = k + 1;
        
    end

    % TODO: Check the sufficient conditions?
    
    finalX = x{k};
    
end


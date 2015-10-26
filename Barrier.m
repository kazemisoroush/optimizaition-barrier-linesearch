function [ finalX ] = Barrier( f, x_1, mu, nu, epsilon )
% This function implements Barrier algorithm.
    
    syms x1 x2 x3;
    g = [x1 + x2 - 25; x2 + x3 - 30; x3 - 10; -x1; -x2; -x3];
    
    bx = BarrierFunction( g );
    
    x{1} = x_1;
    k = 1;
    
    while (true)
        phi = f + mu(k) * bx;
        %disp(phi);
        
        x{k + 1} = Linesearch( phi, x{k} );
        %disp(x{k + 1});
        
        mu(k + 1) = nu * mu(k);
        
        %disp(norm(minus(x{k + 1}, x{k}), 2));
        %disp(norm(minus(subs(f, [x1, x2, x3], x{k + 1}), subs(f, [x1, x2, x3], x{k})), 2));
        
        if norm(minus(x{k + 1}, x{k}), 2) > epsilon || norm(minus(subs(f, [x1, x2, x3], x{k + 1}), subs(f, [x1, x2, x3], x{k})), 2) > epsilon
            break;
        end
        %disp('soroush');
        
        k = k + 1;
    end
    
    finalX = x{k + 1};

end

function [ b ] = BarrierFunction( g )
% This function generates barrier function from input g array.

    ret = 0;
    
    for i = 1 : size(g, 1)
        ret = ret - log10(-1 * g(i));
    end
    
    b = ret;
end


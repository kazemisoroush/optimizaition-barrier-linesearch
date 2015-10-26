function [ alpha ] = Backtracking( f, xk, pk )
% This function implements Backtracking algorithm.

    alph = rand(1); %0.5;
    beta = rand(1); %0.5;
    c = rand(1); %0.5;
    
    while (true)
        tetaHat = tetaHat(f, xk, c, alph, pk);
        teta = teta(f, xk, pk, alph);
        
        if teta <= tetaHat
            break;
        end
        
        alph = beta * alph;
    end

    alpha = alph;
end

function [ y ] = teta( f, xk, pk, alph )
% This function calculates teta function.

    syms x1 x2 x3;

    y = subs(f, [x1, x2, x3], xk + alph * pk);
end

function [ y ] = tetaHat( f, xk, c, alph, pk )
% This function calculates tetaHat function.

    syms x1 x2 x3;
    gradientF = [ diff(f, x1); diff(f, x2); diff(f, x3) ];
   
    y = subs(f, [x1, x2, x3], xk) + alph * c * pk' * subs(gradientF, [x1, x2, x3], xk);
end


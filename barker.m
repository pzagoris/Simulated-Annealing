% Implementation of Barker acceptance function
% x, y are points
% t is temprature

function f = barker (x, y, t)

    fx = Rastrigin(x);
    fy = Rastrigin(y);
    result = exp(fy-fx/t);
    
    f = 1/(1+result);
end
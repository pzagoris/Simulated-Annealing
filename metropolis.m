% Implementation of Metropolis acceptance function
% x, y are points
% t is temprature

function f = metropolis (x, y, t)

    fx = Rastrigin(x);
    fy = Rastrigin(y);
    result = exp(-((fy-fx)/t));
    
    f= min(1,result);
end
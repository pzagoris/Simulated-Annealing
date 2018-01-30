% Implementation of Rastrigin function
% x = array with point
% d = dimension of problem 
% pi = 3.1416
function f = Rastrigin(x)

%    result=0;
%     for i=1:d 
% 		result = result + x(i)^2 -10*cos(2*pi*x(i)) ;
%     end
    result = x.^2 -10*cos(2*pi.*x);
    f = 20.0 + sum(result);
end





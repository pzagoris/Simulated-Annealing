% Function Calculate Space of ë of Golden Section 
% Input:
    % dimension: size of search space
    % U: normalized vectior
    % x: previous point (x(k))
% Output: step ë according to Golden Section
function l_i = calculate_space_GS(search_space, steps_gs, accuracy, dimension, x, U) 
	
	
	begin = 0.001;
	l = zeros (dimension, 2);
	
    for i=1:dimension
        
        if (U(i) > 0.0)
			l(i,1) = abs( ( search_space(i,1) - x(i) ) / U(i));
			l(i,2) = abs( ( search_space(i,2) - x(i) ) / U(i));
        else 
			l(i,1) = abs( ( search_space(i,2) - x(i) ) / U(i));
			l(i,2) = abs( ( search_space(i,1) - x(i) ) / U(i));

        end
    end
	


    telos = -1.0;
	flag = 1;
    for k=1:dimension
        for n=1:2
            if(l(k,n) > telos) 
                if( x(k) + l(k,n)*U(k) <= search_space(k,2) ) 
                    telos = l(k,n);
                    flag = 0;
                end
            end
        end
    end
    
    
	
    if (flag==1)
        % Calling Golden Section
		[minimum, minimizer] = golden_section(begin, begin, steps_gs, accuracy, dimension, x, U);
    else
        % Calling Golden Section
		[minimum, minimizer] = golden_section(begin, telos, steps_gs, accuracy, dimension, x, U);
    end
	
    l_i=minimizer;
  
end

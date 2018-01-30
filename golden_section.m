% minimizer = ë
function [minimum, minimizer] =  golden_section (begin, telos, max_steps, accuracy, dimension, x, thita)	
  
	%counter for iterations of algorithm
	steps=0;		
	f_f=1.61803;
	
    
   while( (steps < max_steps) && (telos-begin > accuracy) )
        
		L = telos - begin;
		d= L/(f_f^2);
	
		x1 = begin + d;
		x2 = telos - d;
        
        % FTIAKSE SYNARTIS
		f1 = Rastringe_GS(x, thita, x1);
		f2 = Rastringe_GS(x, thita, x2);
		
        if(f1 < f2)
			telos = x2;
        elseif(f1 > f2)
			begin = x1;
        else
		    telos = x2;
		    begin = x1;
        end
    
		steps = steps + 1;
	
    end
    
     minimizer = (telos + begin)/2;
	 minimum = Rastringe_GS(x, thita, minimizer); 
	
	 
end
	  




            
        

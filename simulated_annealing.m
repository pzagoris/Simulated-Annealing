% Implementation of SIMULATED ANNEALING
% Input: 
    % search space
    % N: max function evaluations
    % b_cool: parameter b for cooling schedule
    % accept_f_option:
        % if accept_f_option==1 : Metropolis function
        % if accept_f_option==2 : Barker function
    %  tempr_option: every  tempr_option steps cooling schedule happens 
    % steps_gs accuracy: parameters for golden section function
% Output: minimum,  minimizer
function [minimum,  minimizer] = simulated_annealing (search_space, N, b_cool, accept_f_option, tempr_option, steps_gs, accuracy)
    
    edit './calculate_space_GS.m';
    edit './golden_section.m'
    edit './metropolis.m'; 
    edit './barker.m';
    edit './cooling_schedule.m';
    edit './Rastrigin.m';
    
    d = length(search_space);
    start = zeros(1,d);
    
    f_overall= 0.0; current_minimum = 1555555.58;
    
    for i=1:d
        a = search_space(i,1); 
        b = search_space(i,2); 
        start(i) = a + (b-a).*rand(1);
    end
    
    % instert start point into history
    z = [start;]; 
    x = start;
    % Initialize temperature for first time with something big
    t=2;  
    count = 1; temprature = 0; 
    while(count <= N ) && (current_minimum - f_overall)>=10^(-4)
        
        % Step 1
        thita = -1 + (1-(-1)).*rand(1,d);
        thita_norm = thita./sqrt(sum(thita.^2));
        lamva = calculate_space_GS(search_space, steps_gs, accuracy, d, x, thita_norm); 
        y = x + lamva*thita_norm;
        
        % Step 2
        % rand by default sto [0, 1]
        p = rand(1);
        if accept_f_option == 1
            answ = metropolis (x, y, t);
        else
            answ = barker (x, y, t);
        end
        if  p <= answ
            x = y;
        end
        
        % Step 3
        z = [z;y;];
        
		count = count+1; temprature = temprature + 1;
        if temprature == tempr_option
            % Step 4
            t = cooling_schedule (z(end,:), b_cool);
            temprature = 0;
        end
            
        % edw ektypwnei to minimum kathe epanalipsis
        current_minimum = Rastrigin(x);
        count =  count +1;
        
    end
    
    start
    %epanalipseis = count
    count
    minimizer = x
    minimum = Rastrigin(x)
    
end
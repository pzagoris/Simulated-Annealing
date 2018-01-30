% Implementation of Bohachevsky, Johnson and Stein cooling schedule

% opou x symfwna me pseudokwdika einai to Z(k+1)
% peiramata me thn metavliti b
function u = cooling_schedule (x, b_cool)

    f_minim = 0; a = 1; 
    b=b_cool;
    
    u = b*((Rastrigin(x)-f_minim)^a);

end
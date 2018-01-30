function result =  Rastringe_GS(x, thita, l)
	
    % pinakas pou antiproswpeuei to Xi
    answ_1 = (x+l*thita);
    answ_2 = 10*cos(2*pi*answ_1);
    answ_3 = (answ_1.^2);
    
    result = 20 + sum(answ_3-answ_2);
    
end

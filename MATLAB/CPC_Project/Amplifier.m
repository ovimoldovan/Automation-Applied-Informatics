% INPUT: uc [0-10V], OUTPUT: um, [0,22V]
function um = Amplifier(uc)

    um = 2.2*uc;
    if(um<0) 
        um = 0;
    end
    if(uc>8.1)
        um = um + 5*(uc-8.1);
    end
    if(um>22) 
        um = 22;
    end

end


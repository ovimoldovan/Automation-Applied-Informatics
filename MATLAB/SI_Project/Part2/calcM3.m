function [ M ] = calcM3( M1,M2 )

    for i=1:length(M1)
        m=[];
        for j=i:length(M2)
            for k=1:length(M2(j))
                m = [m, M1(i) * M2(j).v(k)];
            end
        end
        M(i).v = m;
    end

end


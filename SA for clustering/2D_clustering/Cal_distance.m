function [res] = Cal_distance(clusters,clusters_num,data_num) 
    res = 0 ;
    for k = 1 : clusters_num
        x = clusters(k).x ;
        y = clusters(k).y ;
        cnt = clusters(k).cnt ;
        num = 0 ;
        for i = 1 : cnt
            for j = i : cnt
                num = num + sqrt((x(j)-x(i))^2+(y(j)-y(i))^2) ;
            end
        end
        res = res + num + (data_num-cnt)^2 ;
    end
end
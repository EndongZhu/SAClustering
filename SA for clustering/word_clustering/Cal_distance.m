function [res] = Cal_distance(clusters,clusters_num,data_num) 
    res = 0 ;
    for k = 1 : clusters_num
        vec = clusters(k).vec ;
        cnt = clusters(k).cnt ;
        num = 0 ;
        for i = 1 : cnt
            for j = i : cnt
                num = num + norm(vec(i,:)-vec(j,:)) ;
            end
        end
        res = res + num ; % + (data_num-cnt)^2 ;
    end
end
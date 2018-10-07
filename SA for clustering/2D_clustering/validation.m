function [dis1 dis2] = validation(clusters,cluster_num)
    res = 0 ;
    for k = 1:cluster_num
        x = clusters(k).x ;
        y = clusters(k).y ;
        cnt = clusters(k).cnt ;
        for i = 1 : cnt
            for j = i : cnt
                res = res + sqrt((x(j)-x(i))^2+(y(j)-y(i))^2) ;
            end
        end
    end
    dis1 = res/cluster_num ;
    
    res = 0 ;
    for k1 = 1:cluster_num
        for k2 = k1:cluster_num
            x1 = clusters(k1).x ;
            y1 = clusters(k1).y ;
            cnt1 = clusters(k1).cnt ;
            x2 = clusters(k2).x ;
            y2 = clusters(k2).y ;
            cnt2 = clusters(k2).cnt ;
            for i = 1 : cnt1
                for j = 1 : cnt2
                    res = res + sqrt((x2(j)-x1(i))^2+(y2(j)-y1(i))^2) ;
                end
            end
        end
    end
    dis2 = res/(cluster_num*(cluster_num-1)/2) ;
end


function [k_clusters] = Kmeans_cmp( x,y,cluster_num,data_num)
%KMEANS_CMP Summary of this function goes here
%   Detailed explanation goes here
    [idx,~] = kmeans([x y],cluster_num) ;
    for i = 1:cluster_num
        k_clusters(i).cnt = 0 ;
        k_clusters(i).x = [] ;
        k_clusters(i).y = [] ;
    end
    for i = 1:data_num
        id = idx(i,1) ;
        k_clusters(id).cnt = k_clusters(id).cnt + 1 ;
        k_clusters(id).x = [k_clusters(id).x; x(i,:)] ;
        k_clusters(id).y = [k_clusters(id).y; y(i,:)] ;
    end
end


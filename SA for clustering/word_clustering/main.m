clc ; clear ;
data = importdata('vectors.bin') ;
data_vec = data.data(1:300,:) ;
data_str = data.textdata(1:300,:) ;

alpha = 0.99 ;
cluster_num = 15 ;
m = cluster_num ;
data_num = size(data_vec,1) ;
T0 = 100*cluster_num*data_num ;
T = T0 ;
Tm = 0.01/(cluster_num*data_num) ;

for i = 1:cluster_num
    clusters(i).cnt = 0 ;
    clusters(i).vec = [] ;
    clusters(i).str = [] ;
end
for i = 1:data_num
   idx =  unidrnd(cluster_num) ;
   clusters(idx).cnt = clusters(idx).cnt+1 ;
   clusters(idx).vec = [clusters(idx).vec ; data_vec(i,:)] ;
   clusters(idx).str = [clusters(idx).str ; data_str(i,:)] ;
end
dis = Cal_distance(clusters,cluster_num,data_num) ;
dis_ini = dis ;

% SA process
while T > Tm
    for i = 1:m
        clusters_tmp = op_change(clusters,cluster_num) ;
        dis_tmp = Cal_distance(clusters_tmp,cluster_num,data_num) ;
        delta = dis_tmp - dis ;
        if(delta < 0)
            clusters = clusters_tmp ;
            dis = dis_tmp ;
        elseif(exp(-delta/T) > rand())
            clusters = clusters_tmp ;
            dis = dis_tmp ;
        end
    end
    T = T*alpha ;
end

result_show(clusters,cluster_num) ;


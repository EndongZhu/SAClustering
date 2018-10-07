clc ; clear ;
% initialize parameters and data

% 局部随机数据
x = [10*rand(100,1) ;
      5+5*rand(100,1) ;
      10+5*rand(100,1) ;
      15+5*rand(100,1) ;
      20+5*rand(100,1) ;
      10*rand(100,1) ;
      10+5*rand(100,1) ;
      15+5*rand(100,1) ;
      20+5*rand(100,1) ;
      25+5*rand(100,1)] ;
y = [10*rand(100,1) ;
      10+5*rand(100,1) ;
      15+5*rand(100,1) ;
      20+5*rand(100,1) ;
      25+5*rand(100,1) ;
      20+5*rand(100,1) ;
      15+5*rand(100,1) ;
      10+5*rand(100,1) ;
      5+5*rand(100,1) ;
      10*rand(100,1) ] ;

% 全局随机数据
% x = 30*rand(1000,1) ;
% y = 30*rand(1000,1) ;

alpha = 0.99 ;
cluster_num = 10 ;  % 簇数目    
m = cluster_num ;   % 每次扰动次数
data_num = 1000 ;   % 对象个数

% 以上参数可自行调节

T0 = 100*data_num*cluster_num ;   
T = T0 ;
Tm = 0.1/(data_num*cluster_num) ;

for i = 1:cluster_num
    clusters(i).cnt = 0 ;
    clusters(i).x = [] ;
    clusters(i).y = [] ;
end
for i = 1:data_num
   idx =  unidrnd(cluster_num) ;
   clusters(idx).cnt = clusters(idx).cnt+1 ;
   clusters(idx).x = [clusters(idx).x ; x(i)] ; 
   clusters(idx).y = [clusters(idx).y ; y(i)] ;
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

plot_show(clusters,cluster_num) ;

k_clusters = Kmeans_cmp( x,y,cluster_num,data_num) ;
figure ;
plot_show(k_clusters,cluster_num) ;

[dis1,dis2] = validation(clusters,cluster_num) ;
fprintf('SINICC method:\nDis1 criterion: %f\nDis2 criterion: %f\n',dis1,dis2) ;
[k_dis1,k_dis2] = validation(k_clusters,cluster_num) ;
fprintf('Kmeans method:\nDis1 criterion: %f\nDis2 criterion: %f\n',k_dis1,k_dis2) ;
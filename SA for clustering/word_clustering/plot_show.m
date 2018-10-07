function [] = plot_show(clusters,clusters_num)
    for i = 1:clusters_num
        x = clusters(i).x ;
        y = clusters(i).y ;
        scatter(x,y) ;
        hold on ;
    end
end
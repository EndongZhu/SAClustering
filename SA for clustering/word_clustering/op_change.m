function [clusters] = op_change(clusters , clusters_num)
    idx1 =  unidrnd(clusters_num) ;
    while clusters(idx1).cnt <= 1
        idx1 =  unidrnd(clusters_num) ;
    end
    idx2 =  unidrnd(clusters(idx1).cnt) ;
    idx3 =  unidrnd(clusters_num) ;
    if(idx1 ~= idx3)
        clusters(idx1).cnt = clusters(idx1).cnt-1 ;
        clusters(idx3).cnt = clusters(idx3).cnt+1 ;
        clusters(idx3).vec = [clusters(idx3).vec ; clusters(idx1).vec(idx2,:)] ;
        clusters(idx1).vec(idx2,:) = [] ;
        clusters(idx3).str = [clusters(idx3).str ; clusters(idx1).str(idx2,:)] ;
        clusters(idx1).str(idx2,:) = [] ;
    end
end
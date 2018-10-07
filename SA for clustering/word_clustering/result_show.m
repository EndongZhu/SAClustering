function [] = result_show(clusters,clusters_num)
    f = fopen('result.txt','w+') ;
    for i = 1:clusters_num
        fprintf(f,'Clusters #%d: \n',i) ;
        for j = 1:clusters(i).cnt
            fprintf(f,'%s ',clusters(i).str{j}) ;
        end
        fprintf(f,'\n') ;
    end
    fclose(f) ;
end 
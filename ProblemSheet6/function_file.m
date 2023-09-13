% plot function

function function_file(x,y,xlab,ylab,n,color,t,y_arr)
    figure(n);
    hold on; 
    grid on;
    plot(x,y,LineWidth=2,Color=color);
    plot(t,y_arr,'r*');
    xlabel(xlab);
    ylabel(ylab);
end
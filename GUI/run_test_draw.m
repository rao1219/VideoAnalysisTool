function[] = run_test_draw(handles)
    %figure(2);
    axes(handles.axes_1);
    set(gcf,'Position',[200 100 600 400],'MenuBar','none','ToolBar','none');
    img = imread('Videos/background.jpg');
    imshow(img); hold on;
    rectangle('Position', [20,30,40,50], 'EdgeColor', [1 0 0], 'Linewidth', 3);
    set(gca,'position',[0 0 1 1]);
    
    text(10,10,'1','Color','y', 'HorizontalAlignment', 'left', 'FontWeight','bold', 'FontSize', 30);
    hold off;
    pause(0.01);
    %axes(handles.axes_1);
    drawnow limitrate;
end
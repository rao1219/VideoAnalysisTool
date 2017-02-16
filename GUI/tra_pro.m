function [] = tra_pro(handles)
set(handles.edit3,'String','Initialization...');
 conf = genConfig('otb','Diving');
%conf = genConfig('vot2015','ball1');

switch(conf.dataset)
    case 'otb'
        net = fullfile('models','mdnet_vot-otb.mat');
    case 'vot2014'
        net = fullfile('models','mdnet_otb-vot14.mat');
    case 'vot2015'
        net = fullfile('models','mdnet_otb-vot15.mat');
end

result = mdnet_run(handles,conf.imgList, conf.gt(1,:), net);

end
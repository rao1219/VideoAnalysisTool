function [] = tra_act(handles)
%set(handles.edit3,'String','Initialization...');
 addpath('/home/dell/ttq/project/VideoAnalysisTool/action/caffe/matlab/');
 video = handles.file_name;
 flow = fullfile('Videos','flow');
 rgb_net_def = fullfile('models','cuhk_action_spatial_vgg_16_deploy.prototxt');
 rgb_mod = fullfile('models','cuhk_action_spatial_vgg_16_split1.caffemodel');
 rgb_mean_file = fullfile('models','rgb_mean.mat');
 flow_net_def = fullfile('models','cuhk_action_temporal_vgg_16_flow_deploy.prototxt');
 flow_mod = fullfile('models','cuhk_action_temporal_vgg_16_split1.caffemodel');
 flow_mean_file = fullfile('models','flow_mean.mat');
 classInd = fullfile('models','classInd.txt');
 result = run_act(handles,video,rgb_net_def,rgb_mod,rgb_mean_file,flow,flow_net_def,flow_mod,flow_mean_file,classInd);
 run_test_draw(handles);
end

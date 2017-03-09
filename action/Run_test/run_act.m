function [ result ] = run_act(handles,video,rgb_net_def,rgb_model,rgb_mean_file,flow,flow_net_def,flow_model,flow_mean_file,classInd)
% TwostreamNet_RUN
% Main interface for MDNet tracker
%
% INPUT:
%   video   - raw video from UCF101
%   images  - 1xN cell of the paths to image sequences
%   region  - 1x4 vector of the initial bounding box [left,top,width,height]
%   net     - The path to a trained spatial net
%   display - True for displying the tracking result
%
% OUTPUT:
%   result - class predicted
%
% Hyeonseob Nam, 2015
% 
set(handles.edit3,'String','Initialization...');
pause(0.01);

%% Initialization
%fprintf('Initialization...\n');

gpu_id=0;
caffe.reset_all();
caffe.set_mode_gpu();
caffe.set_device(gpu_id);



%% spatial net confirm
% fprintf(' founding spatial net...\n');
set(handles.edit3,'String','founding spatial nets...');
pause(0.01);

rgb_net = caffe.Net(rgb_net_def,rgb_model,'test');



%% Learning CNN
% fprintf('  training cnn...');
set(handles.edit3,'String',' testing cnn...');
pause(0.01);
spatial_prediction = VideoSpatialPrediction(video,rgb_mean_file,rgb_net);

% Initialize displayots
%if display
    %figure(2);
    %axes(handles.axes_2);
    %set(gcf,'Position',[200 100 600 400],'MenuBar','none','ToolBar','none');
    
    %hd = imshow(img,'initialmagnification','fit'); hold on;
    %rectangle('Position', targetLoc, 'EdgeColor', [1 0 0], 'Linewidth', 3);
    %set(gca,'position',[0 0 1 1]);
    
    %text(10,10,'1','Color','y', 'HorizontalAlignment', 'left', 'FontWeight','bold', 'FontSize', 30);
    %hold off;
    %drawnow;
%end

%% Prepare training data for online update
%total_pos_data = cell(1,1,1,nFrames);
%total_neg_data = cell(1,1,1,nFrames);

%neg_examples = gen_samples('uniform', targetLoc, opts.nNeg_update*2, opts, 2, 5);
%r = overlap_ratio(neg_examples,targetLoc);
%neg_examples = neg_examples(r<opts.negThr_init,:);
%neg_examples = neg_examples(randsample(end,min(opts.nNeg_update,end)),:);

%examples = [pos_examples; neg_examples];
%pos_idx = 1:size(pos_examples,1);
%neg_idx = (1:size(neg_examples,1)) + size(pos_examples,1);

%feat_conv = mdnet_features_convX(net_conv, img, examples, opts);
%total_pos_data{1} = feat_conv(:,:,:,pos_idx);
%total_neg_data{1} = feat_conv(:,:,:,neg_idx);

%success_frames = 1;
%trans_f = opts.trans_f;
%scale_f = opts.scale_f;

% temporal prediction
set(handles.edit3,'String','temporal prediction');
pause(0.01);
caffe.reset_all();
gpu_id = 0;

caffe.reset_all();
set(handles.edit3,'String','founding temporal nets... ');
caffe.set_mode_gpu();
caffe.set_device(gpu_id);
flow_net =caffe.Net(flow_net_def,flow_model,'test');

set(handles.edit3,'String','testing cnn...');
pause(0.01);

temporal_prediction = VideoTemporalPrediction(flow,flow_mean_file,flow_net);
caffe.reset_all();

%% softmax
set(handles.edit3,'String','softmax...');
pause(0.01);

avg_spatial_pred_fc8=mean(spatial_prediction,2);
avg_temporal_pred_fc8=mean(temporal_prediction,2);
avg_spatial_exp=exp(avg_spatial_pred_fc8);
sum_spatial=sum(avg_spatial_exp);
avg_spatial_pred=avg_spatial_pred_fc8/sum_spatial;
avg_temporal_exp=exp(avg_temporal_pred_fc8);
sum_temporal=sum(avg_temporal_exp);
avg_temporal_pred=avg_temporal_pred_fc8/sum_temporal;


%%classify
%%fprintf('  classify...');
set(handles.edit3,'String','  classify...');
pause(0.01);
fused_predict= 2/3*avg_spatial_pred+1/3*avg_temporal_pred;
[a,b]=max(fused_predict);
[id,action]=textread(classInd,'%d %s');
result=action(b);
set(handles.edit3,'String','  which action is..');
pause(0.01);
disp(result);
set(handles.edit3,'String',result);
pause(0.01);
  
    
    
end

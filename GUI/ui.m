function varargout = ui(varargin)
% UI MATLAB code for ui.fig
%      UI, by itself, creates a new UI or raises the existing
%      singleton*.
%
%      H = UI returns the handle to a new UI or the handle to
%      the existing singleton*.
%
%      UI('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in UI.M with the given input arguments.
%
%      UI('Property','Value',...) creates a new UI or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before ui_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to ui_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help ui

% Last Modified by GUIDE v2.5 18-Feb-2017 22:32:13

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @ui_OpeningFcn, ...
                   'gui_OutputFcn',  @ui_OutputFcn, ...
                   'gui_LayoutFcn',  [] , ...
                   'gui_Callback',   []);
if nargin && ischar(varargin{1})
    gui_State.gui_Callback = str2func(varargin{1});
end

if nargout
    [varargout{1:nargout}] = gui_mainfcn(gui_State, varargin{:});
else
    gui_mainfcn(gui_State, varargin{:});
end
% End initialization code - DO NOT EDIT


% --- Executes just before ui is made visible.
function ui_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to ui (see VARARGIN)

% Choose default command line output for ui
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes ui wait for user response (see UIRESUME)
% uiwait(handles.figure1);
img = imread('Videos/background.jpg');
axes(handles.axes_1);
imshow(img);
axes(handles.axes_2);
imshow(img);
datacursormode on;


% --- Outputs from this function are returned to the command line.
function varargout = ui_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in UploadBtn.
function UploadBtn_Callback(hObject, eventdata, handles)
% hObject    handle to UploadBtn (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
[file, pathname] = ...
     uigetfile({'*.mp4';'*.avi';'*.mat';'*.*'},'File Selector');
 handles.file_name=fullfile(pathname,file);
 set(handles.filename,'String',handles.file_name);
 guidata(hObject,handles);
 video_raw=VideoReader(handles.file_name)
 handles.video_=video_raw;
 guidata(hObject,handles);
 frame = read(video_raw,1);
 axes(handles.axes_1);
 imshow(frame);
 axes(handles.axes_2);
 imshow(frame);
 frame_num = get(video_raw, 'NumberOfFrames');
 set(handles.slider1,'Max',frame_num);
 set(handles.slider2,'Max',frame_num);
 set(handles.slider1,'Value',0.01);
 cd Videos
 f = regexp(file,'\.','split');
 f_ =  char(f(1));
 mkdir(f_);
 cd(f_);
 handles.imgs = {};
 for i=1:frame_num
     frame = read(video_raw,i);
     imwrite(frame,[num2str(i),'.jpg']);
     full_path_file = fullfile('Videos',f_,[num2str(i),'.jpg']);
     handles.imgs = [handles.imgs, full_path_file];
 end
 handles.video_dir = pwd;
 guidata(hObject,handles);
 cd ../../;
 

% --------------------------------------------------------------------
function File_Callback(hObject, eventdata, handles)
% hObject    handle to File (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function Untitled_2_Callback(hObject, eventdata, handles)
% hObject    handle to Untitled_2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)



function filename_Callback(hObject, eventdata, handles)
% hObject    handle to filename (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of filename as text
%        str2double(get(hObject,'String')) returns contents of filename as a double


% --- Executes during object creation, after setting all properties.
function filename_CreateFcn(hObject, eventdata, handles)
% hObject    handle to filename (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit3_Callback(hObject, eventdata, handles)
% hObject    handle to edit3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit3 as text
%        str2double(get(hObject,'String')) returns contents of edit3 as a double


% --- Executes during object creation, after setting all properties.
function edit3_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called
    
% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



% --- Executes during object creation, after setting all properties.
function axes_1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to axes_1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: place code in OpeningFcn to populate axes_1
% axes(handles.axes_1);


% --- Executes during object creation, after setting all properties.
function axes_2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to axes_2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: place code in OpeningFcn to populate axes_2
%axes(handles.axes_2);
%img = imread('Videos/background.jpg');
%imshow(img);


% --- Executes on slider movement.
function slider1_Callback(hObject, eventdata, handles)
% hObject    handle to slider1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider
sliderValue = get(handles.slider1,'Value');
if(sliderValue==0)
    sliderValue=0.01;
end
%video_raw = get(handles.video_)
%video_raw = VideoReader(handles.file_name);
video_raw = handles.video_;
pic = read(video_raw,sliderValue);
axes(handles.axes_1);
 imshow(pic);
 


% --- Executes during object creation, after setting all properties.
function slider1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to slider1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on slider movement.
function slider2_Callback(hObject, eventdata, handles)
% hObject    handle to slider2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider


% --- Executes during object creation, after setting all properties.
function slider2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to slider2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on button press in processBtn.
function processBtn_Callback(hObject, eventdata, handles)
% hObject    handle to processBtn (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
%imglist = parseImg(handles.video_dir);
imglist = handles.imgs;
region = handles.region;
net = fullfile('models','mdnet_otb-vot15.mat');
result = run_test(handles,imglist, region, net, true);



% --------------------------------------------------------------------
function exit_btn_Callback(hObject, eventdata, handles)
% hObject    handle to exit_btn (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% --------------------------------------------------------------------
function file_open_Callback(hObject, eventdata, handles)
% hObject    handle to file_open (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(handles.edit3,'String','Open file');


% --------------------------------------------------------------------
function file_group_process_Callback(hObject, eventdata, handles)
% hObject    handle to file_group_process (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(handles.edit3,'String','File group process');


% --------------------------------------------------------------------
function function_menu_Callback(hObject, eventdata, handles)
% hObject    handle to function_menu (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function demo_tracking_Callback(hObject, eventdata, handles)
% hObject    handle to demo_tracking (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(handles.edit3,'String','Demo tracking');
pause(0.2);
tra_pro(handles)


% --------------------------------------------------------------------
function action_item_Callback(hObject, eventdata, handles)
% hObject    handle to action_item (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(handles.edit3,'String','Action recognition');


% --------------------------------------------------------------------
function caption_item_Callback(hObject, eventdata, handles)
% hObject    handle to caption_item (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(handles.edit3,'String','Video caption');


% --------------------------------------------------------------------
function optical_item_Callback(hObject, eventdata, handles)
% hObject    handle to optical_item (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(handles.edit3,'String','optical_flow');


% --------------------------------------------------------------------
function posture_item_Callback(hObject, eventdata, handles)
% hObject    handle to posture_item (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(handles.edit3,'String','Human posture');


% --------------------------------------------------------------------
function stablization_item_Callback(hObject, eventdata, handles)
% hObject    handle to stablization_item (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(handles.edit3,'String','Video stablization');


% --------------------------------------------------------------------
function Untitled_3_Callback(hObject, eventdata, handles)
% hObject    handle to Untitled_3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function Untitled_7_Callback(hObject, eventdata, handles)
% hObject    handle to Untitled_7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function Untitled_8_Callback(hObject, eventdata, handles)
% hObject    handle to Untitled_8 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function Untitled_9_Callback(hObject, eventdata, handles)
% hObject    handle to Untitled_9 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function Bro_1_item_Callback(hObject, eventdata, handles)
% hObject    handle to Bro_1_item (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function Bro_2_item_Callback(hObject, eventdata, handles)
% hObject    handle to Bro_2_item (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function Untitled_6_Callback(hObject, eventdata, handles)
% hObject    handle to Untitled_6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in broadcast_btn.
function broadcast_btn_Callback(hObject, eventdata, handles)
% hObject    handle to broadcast_btn (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
try
    handles.pausestart
catch
    handles.pausestart = 'pause';
end
if(strcmp(handles.pausestart,'start'))
    handles.pausestart = 'pause';
    guidata(hObject,handles);
    uiwait;
else
    handles.pausestart = 'start';
    curr_frame = get(handles.slider1,'Value');
    %video_raw = VideoReader(handles.file_name);
    video_raw = handles.video_;
    space = 1.0/video_raw.FrameRate;
    while(curr_frame <video_raw.NumberOfFrames)
        if(handles.pausestart == 'pause')
            uiwait;
            break
        end
        pic = read(video_raw,curr_frame+1);
        axes(handles.axes_1);
        imshow(pic);
        curr_frame = curr_frame+1;
        set(handles.slider1,'Value',curr_frame);
        guidata(hObject,handles);
        pause(space);
    end
end


% --- Executes on button press in stop_btn.
function stop_btn_Callback(hObject, eventdata, handles)
% hObject    handle to stop_btn (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton5.
function pushbutton5_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in set_posA_btn.
function set_posA_btn_Callback(hObject, eventdata, handles)
% hObject    handle to set_posA_btn (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
datacursormode on
dcm_obj = datacursormode(handles.figure1);
info = getCursorInfo(dcm_obj);
top_x = info.Position(1);
top_y = info.Position(2);
set(handles.t_p_x,'String',num2str(top_x));
set(handles.t_p_y,'String',num2str(top_y));



function t_p_x_Callback(hObject, eventdata, handles)
% hObject    handle to t_p_x (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of t_p_x as text
%        str2double(get(hObject,'String')) returns contents of t_p_x as a double


% --- Executes during object creation, after setting all properties.
function t_p_x_CreateFcn(hObject, eventdata, handles)
% hObject    handle to t_p_x (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function t_p_y_Callback(hObject, eventdata, handles)
% hObject    handle to t_p_y (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of t_p_y as text
%        str2double(get(hObject,'String')) returns contents of t_p_y as a double


% --- Executes during object creation, after setting all properties.
function t_p_y_CreateFcn(hObject, eventdata, handles)
% hObject    handle to t_p_y (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function b_p_x_Callback(hObject, eventdata, handles)
% hObject    handle to b_p_x (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of b_p_x as text
%        str2double(get(hObject,'String')) returns contents of b_p_x as a double


% --- Executes during object creation, after setting all properties.
function b_p_x_CreateFcn(hObject, eventdata, handles)
% hObject    handle to b_p_x (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function b_p_y_Callback(hObject, eventdata, handles)
% hObject    handle to b_p_y (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of b_p_y as text
%        str2double(get(hObject,'String')) returns contents of b_p_y as a double


% --- Executes during object creation, after setting all properties.
function b_p_y_CreateFcn(hObject, eventdata, handles)
% hObject    handle to b_p_y (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton7.
function pushbutton7_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
datacursormode on
dcm_obj = datacursormode(handles.figure1);
info = getCursorInfo(dcm_obj);
buttom_x = info.Position(1);
buttom_y = info.Position(2);
set(handles.b_p_x,'String',num2str(buttom_x));
set(handles.b_p_y,'String',num2str(buttom_y));



% --- Executes on button press in generate_btn.
function generate_btn_Callback(hObject, eventdata, handles)
% hObject    handle to generate_btn (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
top_left_x = str2num(get(handles.t_p_x,'String'));
top_left_y = str2num(get(handles.t_p_y,'String'));
buttom_left_x = str2num(get(handles.b_p_x,'String'));
buttom_left_y = str2num(get(handles.b_p_y,'String'));
weight = buttom_left_x - top_left_x;
height = buttom_left_y - top_left_y;
axes(handles.axes_1);
region = [top_left_x,top_left_y,weight,height];
handles.region = region;
guidata(hObject,handles);
rectangle('Position',region,'EdgeColor', [1 0 0], 'Linewidth', 3);


% --------------------------------------------------------------------
function Untitled_10_Callback(hObject, eventdata, handles)
% hObject    handle to Untitled_10 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
dir = uigetdir;
handles.imgs = parseImg(dir);
set(handles.filename,'String',dir);
first_f = imread(handles.imgs{1});
axes(handles.axes_1);
imshow(first_f);
guidata(hObject,handles);


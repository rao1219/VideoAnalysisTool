# VideoAnalysisTool
----
![](https://github.com/rao1219/VideoAnalysisTool/blob/master/Tracker/Videos/pic.png)
The tracker currently adopted is MDNet. Created by [Hyeonseob Nam](https://kr.linkedin.com/in/hyeonseob-nam/) and [Bohyung Han](http://cvlab.postech.ac.kr/~bhhan/) at POSTECH

Project Webpage: http://cvlab.postech.ac.kr/research/mdnet/
## Structure

```flow

  --------> GUI (public):Software UI and I/O of public vars   
             |
             |    +-> Tracker (private): Tracking task's codes   
             |----+-> Stablization (private): Stabilization task's codes  
                  +-> ... : Other sub-task's codes  
```        
## Public vars
---
| Variable        | Description   | 
| --------   | -----:  | 
|handles.file_name | filename of uploaded file |
|handles.imgs  |image lists of frames to be processed | 
| handles.video_      | video to be processed     |
| handles.video_dir      | video's full path   |  
| handles.result    | output of algorithm |
| handles.t_p_x    | current mouse position x |
| handles.t_p_y    | current mouse position y |


----

## Common functions
---
| Function        | Description   | 
| --------   | -----:  | 
|Data Input  | Upload dir/video(ui.m: upload_btn's callback) |
|Data preprocess  |Video2frames (ui.m: VideoReader)| 
|Video broadcast  | Broadcast of a video/img_lists(ui.m: broadcast_btn) |
|Selection of random frame| (ui.m: slider's callback)|
|Parameter input of algorithm|codes in sub-task | 
|Algorithm processing| codes in sub-task( online may need visualization)|
|Result Visualization |codes in sub-task |

----

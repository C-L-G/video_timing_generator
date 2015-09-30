# video_timing_generator

标准视频时序生成器

video_sync_parameter.v 定义不同视频格式参数.相当于C的头文件

video_sync_generator.v 生成器主模块。

parameter 中我已经定义了几种常用的格式，后期会慢慢添加其他的。

关于parameter的说明，我会在博客中描述。（其实都是很简单的parameter设置）

要加入新的视频格式，直接在 video_sync_parameter.v里面加就行,不用动video_sync_generator.v

注意：video_sync_generator.v 中的 `include "video_sync_parameter.v" 最好改成完整路径

例子：生成 1080P@60Hz 格式

只要把video_sync_generator.v 中的

`define XXXXX 

XXXX改成 P1080_60就行

有了这个以后就不用到处找  video timing 了！支持隔行格式哦~




--@--Young--@--


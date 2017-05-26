# nsarrayBounds [讲解:http://www.jianshu.com/p/2dae9c1f5c39]
 防止数组越界crash，当然这只是一种思路，不建议开发时这样做，因为开发时应该把更多的问题暴漏出来去解决，而不是掩盖掉

只要把#import "NSArray+LXZArray.h"放到你项目中并包含到pchheader中即可（注意你的pch路径需要配置）

![](http://upload-images.jianshu.io/upload_images/1488115-1b0c18a7f4cbe04f.gif?imageMogr2/auto-orient/strip)

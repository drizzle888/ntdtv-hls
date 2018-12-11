### 同步新唐人电视直播源

#### 使用场景
1. 当前Web服务器不具备反向代理（Reverse Proxy）功能
2. 多用户高并发访问，用以减轻源服务器（ntdtv）的压力

#### 工作原理
持续从新唐人hls源同步索引文件(.m3u8)及媒体文件(.ts)到 Web服务器(Apache、Nginx等)本地，Web服务器再将这些文件以静态文件的形式向外提供服务，可以支持多用户高并发访问

#### 使用方法
将脚本中 `webRoot=/usr/share/nginx/html` 的路径改为 Web服务器文件根目录，如Apache 根目录为`/var/www/html`。 

执行 hls.sh 脚本，让其一直在后台运行（可将脚本注册为系统服务），并保证运行 Web服务器的操作系统用户对同步到本地的文件及目录有可读权限。

直播源地址的格式为 `http://服务器IP:服务器端口/ntdtvcn/playlist.m3u8`，如服务器IP为207.148.103.66，服务器端口为80，则直播源地址为 `http://207.148.103.66:80/ntdtvcn/playlist.m3u8`

前端页面可以使用 video.js 库播放此 hls 视频, 可参考 [index.html](pages/index.html) 页面

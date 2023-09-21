[TOC]

# Flutter Web Admin Portal

Responsive web with light/dark mode and multi language supported. The objective of this project is
to develop an admin portal website with Flutter v3 (SDK version 3.13.4).


#### Live demo: https://githubityu.github.io/live_flutter_admin



#### Web 优化 
>通过加载web 发现https://fonts.gstatic.com/s/notosanssc下载了NotoSansSC和Roboto 
> https://fonts.gstatic.com/s/roboto/v20/Roboto.ttf  Roboto
> canvaskit.wasm
1.  定义 fontFamily: 'NotoSansSC' 避免去外面下载
2.  Roboto 更换链接 a6.push(p.x6(d,e.G3(d),j))}}if(!m)a6.push(p.x6("Roboto","https://githubityu.github.io/live_flutter_admin/assets/assets/fonts/Roboto.ttf","Roboto")) 避免去外面下载
3.  打包制定 flutter build web   --web-renderer auto --dart-define=FLUTTER_WEB_CANVASKIT_URL=./canvaskit/

![IMG_06](https://github.com/githubityu/flutter_admin_template/blob/main/images/optimize.jpg)
![IMG_07](https://github.com/githubityu/flutter_admin_template/blob/main/images/NotoSansSC.jpg)
![IMG_08](https://github.com/githubityu/flutter_admin_template/blob/main/images/Roboto.jpg)



## Setup

1 **Clone the repo**

```
$ git clone https://github.com/githubityu/flutter_admin_template.git
$ cd flutter_admin_template
```

2 **Running:**

```
$ flutter run
```

#### 登录

![IMG_01](https://github.com/githubityu/flutter_admin_template/blob/main/images/%E7%99%BB%E5%BD%95.jpg)

#### 注册

![IMG_02](https://github.com/githubityu/flutter_admin_template/blob/main/images/%E6%B3%A8%E5%86%8C.jpg)

#### 英文 亮色主题 中文 暗黑主题

![IMG_03](https://github.com/githubityu/flutter_admin_template/blob/main/images/%E6%99%AE%E9%80%9A%E7%94%A8%E6%88%B7%E7%99%BB%E9%99%86.jpg)

#### 管理员登录权限 根据权限动态添加路由

![IMG_05](https://github.com/githubityu/flutter_admin_template/blob/main/images/%E7%AE%A1%E7%90%86%E5%91%98%E6%9D%83%E9%99%90.jpg)

## 第三方依赖

| 名称及版本                | 作用          |
|----------------------|-------------|
| flutter_hooks        | 钩子          |
| hooks_riverpod       | 状态管理        |
| riverpod_annotation  | 状态管理        |
| dio:                 | 网络请求        |
| retrofit             | 网络请求        |
| webview_flutter      | 内置webview加载 |
| ityu_tools           | 工具          |
| flex_color_scheme    | 主题颜色        |
| go_router            | 路由          |
| go_router_builder    | 路由          |
| awesome_dialog       | 弹框          |
| flutter_smart_dialog | 弹框提示        |
| logger               | 日志          |





## License

MIT

## 最后

如果你喜欢这个项目，欢迎给我一个star。里面可能还有许多需要修改的bug,欢迎大家提出来,我将持续更新这个项目)
下一步用dartfrog写接口，然后后台管理接入
[dartfrog](https://dartfrog.vgv.dev/)


## 参考学习
[flutter-web-admin](https://github.com/kleong153/flutter-web-admin)
[flutter_admin_scaffold](https://github.com/keyber-inc/flutter_admin_scaffold)

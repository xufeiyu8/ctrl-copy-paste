# Windows 微信/全局快捷复制粘贴小工具

一个基于 `AutoHotkey v2` 的轻量脚本工具，提供两套快捷复制粘贴方式：

- `右Ctrl`：全局生效
- `左Alt`：微信客户端和微信公众号相关页面生效

当前版本只保留已经验证相对稳定的能力，尽量避免复杂状态机和高冲突手势。

## 功能说明

### 1. 右Ctrl 全局生效

- 按住 `右Ctrl` 选择文字，松开后自动复制
- 快速连续按两次 `右Ctrl`，自动粘贴

### 2. 左Alt 在微信客户端和微信公众号网页生效

- 按住 `左Alt` 选择文字，松开后自动复制
- 快速连续按两次 `左Alt`，自动粘贴

### 3. 原生快捷键不受影响

- 原生 `Ctrl+C` / `Ctrl+V` 继续可用

## 微信截图建议

为避免和 `左Alt` 冲突，建议把微信截图快捷键改为：

```text
Shift+A
```

不建议继续使用包含 `Alt` 的微信截图快捷键。

## 文件说明

- [alt-copy-paste.ahk](C:\Users\22696\alt-copy-paste\alt-copy-paste.ahk)：核心脚本
- [run-alt-copy-paste.bat](C:\Users\22696\alt-copy-paste\run-alt-copy-paste.bat)：固定使用 `AutoHotkey v2` 启动脚本的批处理

## 环境要求

- Windows
- `AutoHotkey v2`

官网：

```text
https://www.autohotkey.com/
```

当前启动器默认使用：

```text
D:\AutoHotkey\v2\AutoHotkey64.exe
```

如果你的安装路径不同，需要同步修改 [run-alt-copy-paste.bat](C:\Users\22696\alt-copy-paste\run-alt-copy-paste.bat)。

## 启动方式

推荐直接双击：

```text
run-alt-copy-paste.bat
```

这样可以绕过 `.ahk` 文件关联异常的问题，稳定启动脚本。

启动成功后：

- 系统托盘会出现 `AutoHotkey` 图标
- 脚本开始监听快捷键

## 开机自启

当前已经通过 Windows 启动目录配置开机自启：

- [alt-copy-paste-autostart.bat](C:\Users\22696\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Startup\alt-copy-paste-autostart.bat)

它会在登录 Windows 后自动启动脚本。

如果后续不想开机自启，删除这个文件即可。

## 使用方式

### 右Ctrl 全局使用

1. 按住 `右Ctrl`
2. 用鼠标选择一段文字
3. 先松开鼠标左键，再松开 `右Ctrl`
4. 脚本会自动发送 `Ctrl+C`
5. 到目标输入位置，快速连续按两次 `右Ctrl`
6. 脚本会自动发送 `Ctrl+V`

### 左Alt 在微信中使用

1. 切到微信客户端窗口
2. 按住 `左Alt`
3. 用鼠标选择一段文字
4. 先松开鼠标左键，再松开 `左Alt`
5. 脚本会自动发送 `Ctrl+C`
6. 到目标输入位置，快速连续按两次 `左Alt`
7. 脚本会自动发送 `Ctrl+V`

### 左Alt 在微信公众号网页中使用

1. 切到浏览器中的微信公众号相关页面
2. 按住 `左Alt`
3. 用鼠标选择一段文字
4. 先松开鼠标左键，再松开 `左Alt`
5. 脚本会自动发送 `Ctrl+C`
6. 到目标输入位置，快速连续按两次 `左Alt`
7. 脚本会自动发送 `Ctrl+V`

## 当前兼容情况

已确认的最终使用方案：

- 微信客户端：支持 `左Alt` 和 `右Ctrl`
- 微信公众号网页：支持 `左Alt` 和 `右Ctrl`
- 网页：支持 `右Ctrl`
- 命令行：支持 `右Ctrl`

## 已知限制

- 本质上仍是“模拟发送 `Ctrl+C` / `Ctrl+V`”，个别特殊窗口可能不兼容。
- 如果目标程序以管理员权限运行，脚本最好也以管理员权限运行。
- `左Alt` 在微信内置浏览器/公众号文章页的稳定性可能弱于 `右Ctrl`，需要以实际使用效果为准。
- 微信/公众号页面判断当前使用：

```ahk
WinActive("ahk_exe WeChat.exe")
|| WinActive("ahk_exe Weixin.exe")
|| 浏览器标题包含“微信公众平台 / 微信公众号 / 公众号”
```

如果你的微信进程名不同，需要在脚本中调整。

## 可选发布文件

如果你在 GitHub Releases 发布脚本，可以提供：

- `alt-copy-paste.ahk`
- `run-alt-copy-paste.bat`

## 后续可选优化

- 增加开机自启
- 增加托盘菜单
- 打包成独立 `exe`

## 许可证

可按个人项目需要自行补充，例如 `MIT License`。

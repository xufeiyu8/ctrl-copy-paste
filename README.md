# Windows 快捷复制粘贴小工具

一个基于 `AutoHotkey v2` 的轻量脚本工具，用更顺手的按键完成“选中即复制、双击即粘贴”。

当前实现遵循以下原则：

- `KISS`：只用一个 `AutoHotkey` 脚本，不做额外桌面程序。
- `YAGNI`：只实现当前明确需要的复制/粘贴快捷操作。
- `DRY`：`右Ctrl` 和 `左Alt` 复用同一套核心逻辑。
- `SOLID`：把“触发键逻辑”和“微信窗口判断”拆开，后续便于扩展。

## 功能说明

当前脚本行为如下：

- `右Ctrl` 全局生效
  - 按住 `右Ctrl` 并选择文字，松开后自动复制
  - 快速连续按两次 `右Ctrl`，自动粘贴
- `左Alt` 仅在微信客户端生效
  - 按住 `左Alt` 并选择文字，松开后自动复制
  - 快速连续按两次 `左Alt`，自动粘贴
- 微信截图快捷键建议改为 `Shift+A`
- 原生 `Ctrl+C` / `Ctrl+V` 不受影响

## 文件说明

- [alt-copy-paste.ahk](C:\Users\用户名\alt-copy-paste\alt-copy-paste.ahk)：核心脚本
- [run-alt-copy-paste.bat](C:\Users\用户名\alt-copy-paste\run-alt-copy-paste.bat)：固定使用 `AutoHotkey v2` 启动脚本的批处理

## 环境要求

- Windows
- `AutoHotkey v2`
https://www.autohotkey.com/

本项目当前使用的启动程序路径为：

```text
D:\AutoHotkey\v2\AutoHotkey64.exe
```

如果你的安装路径不同，需要同步修改 [run-alt-copy-paste.bat](C:\Users\用户名\alt-copy-paste\run-alt-copy-paste.bat)。

## 启动方式

推荐直接双击：

```text
run-alt-copy-paste.bat
```

这样可以绕过 `.ahk` 文件关联异常的问题，稳定启动脚本。

启动成功后：

- 系统托盘会出现 `AutoHotkey` 图标
- 脚本开始监听快捷键

## 使用方式

### 方案一：全局使用 `右Ctrl`

1. 按住 `右Ctrl`
2. 用鼠标选择一段文字
3. 先松开鼠标左键，再松开 `右Ctrl`
4. 脚本会自动发送 `Ctrl+C`
5. 到目标输入位置，快速连续按两次 `右Ctrl`
6. 脚本会自动发送 `Ctrl+V`

### 方案二：在微信中使用 `左Alt`

1. 切到微信客户端窗口
2. 按住 `左Alt`
3. 用鼠标选择一段文字
4. 先松开鼠标左键，再松开 `左Alt`
5. 脚本会自动发送 `Ctrl+C`
6. 到目标输入位置，快速连续按两次 `左Alt`
7. 脚本会自动发送 `Ctrl+V`

### 微信截图建议

为避免 `Alt` 相关冲突，推荐把微信截图快捷键设置为：

```text
Shift+A
```

这样可以把“微信截图”和“左Alt 复制/粘贴”完全解耦，稳定性更高。

## 当前兼容情况

已测试可正常使用：

- 微信客户端
- 网页
- 命令行

其中：

- `右Ctrl`：全局可用
- `左Alt`：仅微信客户端可用
- `Shift+A`：作为推荐的微信截图快捷键

## 已知限制

- 本质上仍是“模拟发送 `Ctrl+C` / `Ctrl+V`”，个别特殊程序可能不兼容。
- 如果目标程序以管理员权限运行，脚本最好也以管理员权限运行。
- 不建议继续使用包含 `Alt` 的微信截图快捷键，否则可能与微信截图界面里的 `Alt` 行为冲突。
- 微信专属判断当前使用：

```ahk
WinActive("ahk_exe WeChat.exe") || WinActive("ahk_exe Weixin.exe")
```

如果你的微信进程名不同，需要在脚本中调整。

## 后续可选优化

- 增加开机自启
- 增加托盘菜单
- 增加提示音或气泡提示
- 增加应用白名单 / 黑名单
- 打包成独立 `exe`

  下载：alt-copy-paste.ahk
  https://github.com/xufeiyu8/alt-copy-paste/releases/download/alt-copy-paste/alt-copy-paste.ahk

  run-alt-copy-paste.bat
https://github.com/xufeiyu8/alt-copy-paste/releases/download/alt-copy-paste/run-alt-copy-paste.bat


## 许可证

可按个人项目需要自行补充，例如 `MIT License`。

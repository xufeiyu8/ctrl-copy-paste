# Windows 微信快捷复制粘贴小工具

一个基于 `AutoHotkey v2` 的轻量脚本工具，用 `左Alt` 在微信里实现更顺手的复制和粘贴。

当前版本刻意保持简单，只保留已经验证相对稳定的能力，符合以下原则：

- `KISS`：只用一个脚本，不做额外桌面程序。
- `YAGNI`：只实现当前明确需要的快捷复制/粘贴。
- `DRY`：复制和粘贴复用同一套触发逻辑。
- `SOLID`：把窗口判断和按键逻辑分开，便于后续维护。

## 功能说明

当前脚本只在微信客户端窗口中生效：

- 按住 `左Alt` 选择文字，松开后自动复制
- 快速连续按两次 `左Alt`，自动粘贴
- 原生 `Ctrl+C` / `Ctrl+V` 不受影响

## 微信截图建议

为避免和 `左Alt` 冲突，建议把微信截图快捷键改为：

```text
Shift+A
```

不建议继续使用包含 `Alt` 的微信截图快捷键。

## 文件说明

- [alt-copy-paste.ahk](C:\Users\用户名\alt-copy-paste\alt-copy-paste.ahk)：核心脚本
- [run-alt-copy-paste.bat](C:\Users\用户名\alt-copy-paste\run-alt-copy-paste.bat)：固定使用 `AutoHotkey v2` 启动脚本的批处理

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

## 使用方式

1. 切到微信客户端窗口
2. 按住 `左Alt`
3. 用鼠标选择一段文字
4. 先松开鼠标左键，再松开 `左Alt`
5. 脚本会自动发送 `Ctrl+C`
6. 到目标输入位置，快速连续按两次 `左Alt`
7. 脚本会自动发送 `Ctrl+V`

## 当前兼容情况

已测试的最终使用方案：

- 微信客户端：支持
- 网页：不启用此版本脚本逻辑
- 命令行：不启用此版本脚本逻辑

## 已知限制

- 本质上仍是“模拟发送 `Ctrl+C` / `Ctrl+V`”，个别特殊窗口可能不兼容。
- 如果目标程序以管理员权限运行，脚本最好也以管理员权限运行。
- 微信窗口判断当前使用：

```ahk
WinActive("ahk_exe WeChat.exe") || WinActive("ahk_exe Weixin.exe")
```

如果你的微信进程名不同，需要在脚本中调整。

## 可选发布文件

如果你在 GitHub Releases 发布脚本，可以提供：
(From claude code cli and kimi code api)

- `alt-copy-paste.ahk`
- `run-alt-copy-paste.bat`

## 后续可选优化

- 增加开机自启
- 增加托盘菜单
- 打包成独立 `exe`

##下载：
alt-copy-paste.ahk
 https://github.com/xufeiyu8/alt-copy-paste/releases/download/alt-copy-paste/alt-copy-paste.ahk

run-alt-copy-paste.bat
 https://github.com/xufeiyu8/alt-copy-paste/releases/download/alt-copy-paste/run-alt-copy-paste.bat

## 许可证

可按个人项目需要自行补充，例如 `MIT License`。

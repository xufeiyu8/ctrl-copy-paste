# Windows 全局快捷复制粘贴小工具

一个基于 `AutoHotkey v2` 的轻量脚本工具，只保留一套最稳定的快捷复制粘贴方式：

- `右Ctrl`：全局生效

当前版本刻意做了减法，完全移除了 `左Alt` 相关逻辑，避免和微信截图 `Alt+A` 的肌肉记忆冲突。

## 功能说明

### 右Ctrl 全局生效

- 按住 `右Ctrl` 选择文字，松开后自动复制
- 快速连续按两次 `右Ctrl`，自动粘贴
- 原生 `Ctrl+C` / `Ctrl+V` 继续可用

## 文件说明

- [ctrl-copy-paste.ahk](C:\Users\22696\ctrl-copy-paste\ctrl-copy-paste.ahk)：核心脚本
- [run-alt-copy-paste.bat](C:\Users\22696\ctrl-copy-paste\run-ctrl-copy-paste.bat)：固定使用 `AutoHotkey v2` 启动脚本的批处理

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

如果你的安装路径不同，需要同步修改 [run-ctrl-copy-paste.bat](C:\Users\22696\ctrl-copy-paste\run-ctrl-copy-paste.bat)。

## 启动方式

推荐直接双击：

```text
run-ctrl-copy-paste.bat
```

这样可以绕过 `.ahk` 文件关联异常的问题，稳定启动脚本。

启动成功后：

- 系统托盘会出现 `AutoHotkey` 图标
- 脚本开始监听快捷键

## 开机自启

当前已经通过 Windows 启动目录配置开机自启：

- [ctrl-copy-paste-autostart.bat](C:\Users\22696\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Startup\ctrl-copy-paste-autostart.bat)

它会在登录 Windows 后自动启动脚本。

如果后续不想开机自启，删除这个文件即可。

## 使用方式

1. 按住 `右Ctrl`
2. 用鼠标选择一段文字
3. 先松开鼠标左键，再松开 `右Ctrl`
4. 脚本会自动发送 `Ctrl+C`
5. 到目标输入位置，快速连续按两次 `右Ctrl`
6. 脚本会自动发送 `Ctrl+V`

## 当前兼容情况

已确认的最终使用方案：

- 微信客户端：支持 `右Ctrl`
- 网页：支持 `右Ctrl`
- 命令行：支持 `右Ctrl`

## 已知限制

- 本质上仍是“模拟发送 `Ctrl+C` / `Ctrl+V`”，个别特殊窗口可能不兼容。
- 如果目标程序以管理员权限运行，脚本最好也以管理员权限运行。

## 可选发布文件

如果你在 GitHub Releases 发布脚本，可以提供：

- `ctrl-copy-paste.ahk`
- `run-ctrl-copy-paste.bat`

## 后续可选优化

- 增加托盘菜单
- 打包成独立 `exe`

## 许可证

可按个人项目需要自行补充，例如 `MIT License`。

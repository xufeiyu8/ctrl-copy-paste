#Requires AutoHotkey v2.0
#SingleInstance Force

SendMode "Event"

global g_triggerDownTime := 0
global g_triggerDownX := 0
global g_triggerDownY := 0
global g_lastRControlTap := 0
global g_lastLAltTap := 0

~RControl::
{
    TriggerDown()
}

~RControl Up::
{
    TriggerUpStandard()
}

#HotIf IsWeChatLikeWindow()
*LAlt::
{
    TriggerDown()
}

*LAlt Up::
{
    TriggerUpWithoutLAlt()
}
#HotIf

TriggerDown()
{
    global g_triggerDownTime, g_triggerDownX, g_triggerDownY
    g_triggerDownTime := A_TickCount
    MouseGetPos &g_triggerDownX, &g_triggerDownY
}

TriggerUpStandard()
{
    global g_triggerDownTime, g_lastRControlTap, g_triggerDownX, g_triggerDownY

    holdTime := A_TickCount - g_triggerDownTime
    mouseX := 0
    mouseY := 0
    MouseGetPos &mouseX, &mouseY
    moved := Abs(mouseX - g_triggerDownX) > 8 || Abs(mouseY - g_triggerDownY) > 8

    ; 按住右 Ctrl 一小段时间，或期间发生明显鼠标移动，视为完成选择并执行复制。
    if (holdTime > 120 || moved) {
        KeyWait "LButton"
        Sleep 100
        Send "^c"
        ClipWait 0.5
        return
    }

    ; 快速连续按两次右 Ctrl，执行粘贴。
    if (A_TickCount - g_lastRControlTap < 350) {
        Sleep 30
        Send "^v"
        g_lastRControlTap := 0
        return
    }

    g_lastRControlTap := A_TickCount
}

TriggerUpWithoutLAlt()
{
    global g_triggerDownTime, g_lastLAltTap, g_triggerDownX, g_triggerDownY

    holdTime := A_TickCount - g_triggerDownTime
    mouseX := 0
    mouseY := 0
    MouseGetPos &mouseX, &mouseY
    moved := Abs(mouseX - g_triggerDownX) > 8 || Abs(mouseY - g_triggerDownY) > 8

    ; 按住左 Alt 一小段时间，或期间发生明显鼠标移动，视为完成选择并执行复制。
    if (holdTime > 120 || moved) {
        KeyWait "LButton"
        Sleep 100
        SendCtrlComboWithoutLAlt("c")
        ClipWait 0.5
        return
    }

    ; 快速连续按两次左 Alt，执行粘贴。
    if (A_TickCount - g_lastLAltTap < 350) {
        Sleep 30
        SendCtrlComboWithoutLAlt("v")
        g_lastLAltTap := 0
        return
    }

    g_lastLAltTap := A_TickCount
}

SendCtrlComboWithoutLAlt(key)
{
    altWasDown := GetKeyState("LAlt", "P")

    if altWasDown {
        SendEvent "{LAlt up}"
        Sleep 30
    }

    SendEvent "^" key
    Sleep 30

    if altWasDown {
        SendEvent "{LAlt down}"
        Sleep 20
    }
}

IsWeChatLikeWindow()
{
    if WinActive("ahk_exe WeChat.exe") || WinActive("ahk_exe Weixin.exe") {
        return true
    }

    ; 兼容浏览器中的微信公众号/公众平台页面。
    if !(WinActive("ahk_exe chrome.exe")
        || WinActive("ahk_exe msedge.exe")
        || WinActive("ahk_exe firefox.exe")) {
        return false
    }

    activeTitle := WinGetTitle("A")
    return InStr(activeTitle, "微信公众平台")
        || InStr(activeTitle, "微信公众号")
        || InStr(activeTitle, "公众号")
}

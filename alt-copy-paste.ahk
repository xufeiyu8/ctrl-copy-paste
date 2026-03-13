#Requires AutoHotkey v2.0
#SingleInstance Force

SendMode "Event"

global g_triggerDownTime := 0
global g_lastTriggerTap := 0
global g_triggerDownX := 0
global g_triggerDownY := 0

#HotIf IsWeChatWindow()
~LAlt::
{
    TriggerDown()
}

~LAlt Up::
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

TriggerUpWithoutLAlt()
{
    global g_triggerDownTime, g_lastTriggerTap, g_triggerDownX, g_triggerDownY

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
    if (A_TickCount - g_lastTriggerTap < 350) {
        Sleep 30
        SendCtrlComboWithoutLAlt("v")
        g_lastTriggerTap := 0
        return
    }

    g_lastTriggerTap := A_TickCount
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

IsWeChatWindow()
{
    return WinActive("ahk_exe WeChat.exe") || WinActive("ahk_exe Weixin.exe")
}

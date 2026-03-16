#Requires AutoHotkey v2.0
#SingleInstance Force

SendMode "Event"

global g_triggerDownTime := 0
global g_triggerDownX := 0
global g_triggerDownY := 0
global g_lastRControlTap := 0

~RControl::
{
    TriggerDown()
}

~RControl Up::
{
    TriggerUpStandard()
}

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

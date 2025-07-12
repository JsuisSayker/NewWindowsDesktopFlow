#Requires AutoHotkey v2.0+
#SingleInstance Force

dll := DllCall("LoadLibrary", "Str", A_ScriptDir "\VirtualDesktopAccessor.dll", "Ptr")
if !dll {
    ExitApp
}

Loop 9 {
    idx := A_Index - 1
    Hotkey("!" A_Index, makeGoFunc(idx))
    Hotkey("+!" A_Index, makeMoveFunc(idx))
}

makeGoFunc(idx) {
    return (*) => GoToDesktop(idx)
}

makeMoveFunc(idx) {
    return (*) => MoveWindowAndGo(idx)
}

GoToDesktop(idx) {
    max := GetDesktopCount()
    if (idx >= max) {
        return
    }
    DllCall("VirtualDesktopAccessor.dll\GoToDesktopNumber", "Int", idx)
}

MoveWindowAndGo(idx) {
    hwnd := WinExist("A")
    if !hwnd {
        return
    }
    result := DllCall("VirtualDesktopAccessor.dll\MoveWindowToDesktopNumber", "Ptr", hwnd, "Int", idx)
    if result != 0 {
        Sleep 100
        DllCall("VirtualDesktopAccessor.dll\GoToDesktopNumber", "Int", idx)
    }
}

GetCurrentDesktop() => DllCall("VirtualDesktopAccessor.dll\GetCurrentDesktopNumber", "Int")
GetDesktopCount()   => DllCall("VirtualDesktopAccessor.dll\GetDesktopCount", "Int")

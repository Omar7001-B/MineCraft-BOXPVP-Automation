#UseHook On
F12::
WinGet, TempWindowID, ID, A
If (WindowID != TempWindowID)
{
  WindowID:=TempWindowID
  WindowState:=0
}
If (WindowState != 1)
{
  WinSet, Style, -0xC40000, ahk_id %WindowID%
}
Else
{
  WinSet, Style, +0xC40000, ahk_id %WindowID%
}
WindowState:=!WindowState
return


CapsLock::
; Retrieve the style of the currently active window
WinGet, hwnd, ID, A
WinGet, style, Style, ahk_id %hwnd%

; Display the style code in a message box
MsgBox, The style code of the current window is: %style%
return


; Hotkey 1: Ctrl + Alt + 1 to add the style
1::
    ; Get the handle of the currently active window
    WinGet, hwnd, ID, A
    ; Add the style 0xC40000 to the window
    WinSet, Style, +0xC40000, ahk_id %hwnd%
    MsgBox, Added style 0xC40000 to the current window.
return

; Hotkey 2: Ctrl + Alt + 2 to remove the style
2::
    ; Get the handle of the currently active window
    WinGet, hwnd, ID, A
    ; Remove the style 0xC40000 from the window
    WinSet, Style, -0xC40000, ahk_id %hwnd%
    WinMove, ahk_id %WindowID%, , 0, 0, A_ScreenWidth, A_ScreenHeight
    MsgBox, Removed style 0xC40000 from the current window.
return

; Bind the action to the 3 key
3::
    ; Get the current active window's dimensions
    WinGet, hwnd, ID, A
    WinGetPos, winX, winY, winWidth, winHeight, ahk_id %hwnd%
    
    ; Get the screen dimensions
    SysGet, screenWidth, 0
    SysGet, screenHeight, 1
    
    ; Display the information in a message box
    MsgBox, Current Window Dimensions:`nWidth: %winWidth%`nHeight: %winHeight%`n`nScreen Dimensions:`nWidth: %screenWidth%`nHeight: %screenHeight%
return

; Bind the action to the 4 key
4::
    ; Get the handle of the currently active window
    WinGet, hwnd, ID, A
    
    ; Get the screen dimensions
    SysGet, screenWidth, 0
    SysGet, screenHeight, 1
    
    ; Set the current window size to match the screen size
    WinMove, ahk_id %hwnd%, , 0, 0, screenWidth, screenHeight
return


; Bind the action to the 5 key
5::
    ; Get the handle of the currently active window
    WinGet, hwnd, ID, A
    
    ; Get the screen dimensions
    SysGet, screenWidth, 0
    SysGet, screenHeight, 1
    
    ; Set the window size to match the screen dimensions
    WinMove, ahk_id %hwnd%, , 0, 0, screenWidth, screenHeight
    
    ; Set the window style to 0x17CF0000 followed by 0x170B0000
    WinSet, Style, 0x17CF0000, ahk_id %hwnd%
    WinSet, Style, 0x170B0000, ahk_id %hwnd%
return
﻿;#include utilities\globals.ahk
#include utilities\coords.ahk
#include utilities\paths.ahk

SetDefaultMouseSpeed, 0
SetMouseDelay, 0

global Running := True

global StartTime := 0

global LoggerFilePath := A_ScriptDir . "\core\LoggerFile.txt"
global CoordsFile := A_ScriptDir . "\core\coords.txt"
global MyDebugFile := A_ScriptDir . "\core\MyDebug.txt"
global PingOutputFile := A_ScriptDir . "\scripts\ping_output.txt"

global DisableWurstHacks := "{Insert}"

global DefaultSpeed := 6

global DefualtMouseDelay := 2
global DefualtDelayAfter := 2

Global GlobalClicks := 0
Global TargetFunction

global ShulkerFirstRow := [[814,420], [852,417], [888,420], [920,420], [960, 420], [990,419], [1030,421], [1065,421], [1100,418]]
global ShulkerSecondRow := [[814, 455], [852,455], [888,455], [920,455], [960, 455], [990,455], [1030,455], [1065,456], [1100,455]]
global ShulkerThirdRow := [[814, 490], [852,490], [888,490], [920,490], [960, 490], [990,490], [1030,490], [1065,493], [1100,490]]
global ShulkerFullRows := [ShulkerFirstRow, ShulkerSecondRow, ShulkerThirdRow]

BaseDebug(msg)
{
    MyDebug("BaseDebug: " . msg)
}

isEmptyCell(Point)
{
    EmptyCellColor := 0x8b8b8b
    EmptyCellColorMouse := 0xC5C5C5

    CurrentColor := GetPixel(Point[1], Point[2])
    if (CurrentColor = EmptyCellColor || CurrentColor = EmptyCellColorMouse) {
        return True
    }

    return False
}

FirstEmptyCellShulker(empty := true)
{

    length := ShulkerFullRows.Length()
    for i, Row in ShulkerFullRows {
        for j, Cell in Row {
            Point := [Cell[1], Cell[2]]
            if(empty){
                if(isEmptyCell(Point)){
                    return Point
                }
            }
            else{
                if(!isEmptyCell(Point)){
                    return Point
                }
            }
        }
    }

}

FirstEmptyCellShop() ; Empty Cell While Buying
{
    InventoryCells :=
    (Join
    [
        [[915, 556], [952, 555], [989, 553], [1021, 556], [1058, 556], [1094, 556], [1130, 556], [1165, 556], [1202, 556]],
        [[914, 593], [948, 589], [984, 589], [1019, 589], [1057, 586], [1092, 588], [1128, 589], [1165, 589], [1199, 589]],
        [[912, 624], [952, 626], [986, 625], [1022, 626], [1059, 627], [1095, 626], [1132, 626], [1165, 629], [1200, 627]],
        [[917, 669], [957, 669], [989, 669], [1023, 669], [1058, 668], [1094, 669], [1130, 671], [1165, 669], [1201, 670]]
    ]
    )

    EmptyCellColor := 0x8b8b8b
    EmptyCellColorMouse := 0xC5C5C5

    for i, Row in InventoryCells {
        for j, Cell in Row {
            Point := [Cell[1], Cell[2]]
            if(isEmptyCell(Point)){
                return Point
            }
        }
    }

    MyDebug("No Empty Cell Found")
    return [0, 0]
}

ShowMsgOnMouse(msg, hideAfter)
{
    MouseGetPos, x, y ; Get the current mouse position
    Tooltip, %message% ; Display the tooltip with the provided message
    ToolTip, %message%
    ; Set the position of the tooltip to the mouse location
    Sleep, 2000 ; Keep the tooltip visible for 2 seconds (adjust as needed)
    Tooltip ; Hide the tooltip
    return
}

FullScreenBorderless() {
    ; Get the handle of the currently active window
    WinGet, hwnd, ID, A

    ; Get the screen dimensions
    SysGet, screenWidth, 0
    SysGet, screenHeight, 1

    ; Set the window size to match the screen dimensionsnMove, ahk_id %hwnd%, , 0, 0, screenWidth, screenHeight
    WinMove, ahk_id %hwnd%, , 0, 0, screenWidth, screenHeight

    ; Set the window style to 0x170B0000
    WinSet, Style, 0x17CF0000, ahk_id %hwnd%
    WinSet, Style, 0x170B0000, ahk_id %hwnd%
}

CopyMouseCoordinates() {
    MouseGetPos, mouseX, mouseY
    PixelGetColor, color, % mouseX, % mouseY
    CoordString := mouseX "," mouseY "`n"
    colorString := "0x" . color "`n"
    Clipboard := mouseX "," mouseY
    FileAppend, %CoordString%, %CoordsFile%
    ;FileAppend, %colorString%, %CoordsFile%
    BaseDebug("Mouse Coordinates: " . CoordString . " Color: " . colorString)
    BaseDebug("ColorsSquare: " . SquarePixelColor([mouseX, mouseY], 4))
}

MoveToMouseCoordinatesFromClipBoard() {
    CoordString := Clipboard
    StringSplit, xy, CoordString, `,
    PixelGetColor, color, % xy1, % xy2
    MouseMove, %xy1%, %xy2%
    BaseDebug("Moving mouse to " . xy1 . " " . xy2)
    BaseDebug("Color: " . color)
}

GetPixelColor(mouseX, mouseY){
    colors := ""
    for i, x in [-1, 0, 1] {
        for j, y in [-1, 0, 1] {
            PixelGetColor, color, % mouseX + x, % mouseY + y
            colors := colors . "0x" . color . " "
        }
    }
    return colors
}

EnsureGameFocus()
{
    PixelGetColor, OutputVar, 1806, 355
    if(OutputVar = 0xFCDD47)
        return

    Counter := 0
    ; Loop with a while statement, limiting it to 10 iterations
    while (OutputVar != 0xFCDD47 && Counter < 10)
    {
        BaseDebug("Game is not focused")
        WinActivate, Minecraft
        Send, {Esc}
        Sleep, 1000
        PixelGetColor, OutputVar, 1806, 355
        Counter++
    }

    if (OutputVar != 0xFCDD47)
    {
        BaseDebug("Game is not focused, Script Wil Restart")
        RestartTheScript()
    }
    Else
    {
        BaseDebug("Game is focused")
    }
}

EnsureMineCraftOpen() {
    WinGetTitle, currentWindow, A
    if !InStr(currentWindow, "Minecraft") {
        WinGet, hwnd, ID, A
        BaseDebug("Ensuring Minecraft is open, we're currently in " . currentWindow)
        BaseDebug("Window Handle: " hwnd)
        ; make loop 3 times, each time activate minecraft then sleep 1 second and check if current window title = minecraft, if so return , else then reload tEh script
        Loop, 3 {
            Sleep, 1000
            WinActivate, Minecraft
            Sleep, 1000
            WinGetTitle, currentWindow, A
            if InStr(currentWindow, "Minecraft") {
                return
            }
        }
        BaseDebug("Minecraft is not open, Script Wil Restart")
        RestartTheScript()
    }
}

SquarePixelColor(Point, square) {
    x := Point[1] - square/2
    y := Point[2] - square/2
    colors := ""
    loop % square {
        loop % square {
            PixelGetColor, color, % x + A_Index, % y + A_Index
            colors := colors . color
        }
    }
    return colors
}

MoveMouseClick(Point, Speed := "", Delay := "", DpelayAfter := "", checkPixel := 0) {
    EnsureMineCraftOpen()
    ;MouseClick, ,% Point[1], % Point[2]
    if(checkPixel == 1){
        BaseDebug("Checking Pixel Color Before Click")
        ;PixelGetColor, color, % Point[1], % Point[2]
        color := SquarePixelColor(Point, 3)
        ;BaseDebug("Color Before Click: " . color . " at " . Point[1] . " " . Point[2])
        Sleep, 50

        MouseClick, left, % Point[1], % Point[2]
        Sleep, 50
        MouseMove, 0, 0
        Sleep, 400

        ;PixelGetColor, color2, % Point[1], % Point[2]
        color2 := SquarePixelColor(Point, 4)
        ;BaseDebug("Color After Click: " . color2 . " at " . Point[1] . " " . Point[2])
        ;BaseDebug("--------")
        Sleep, 50

        if(color == color2){
            BaseDebug("Pixel Color Before and After Click is Same, Failed!")
            return 0
        }
    }
    else{
        BaseDebug("Moving Mouse to " . Point[1] . " " . Point[2])
        MouseClick, left, % Point[1], % Point[2]
    }
    BaseDebug("Mouse Clicked Successfully")
    return 1
}

MySleep(time, key){
    num := time/20
    loop, % num {
        Sleep, 20

    }
}

MouseMoveToImg(IconName, X1 := 0, Y1 := 0, X2 := "", Y2 := "", Tolerance := 50) {
    if (X2 = "")
        X2 := A_ScreenWidth
    if (Y2 = "")
        Y2 := A_ScreenHeight

    ScriptDir := A_ScriptDir
    IconPath := ScriptDir . "\img\" . IconName

    OutputVarX := OutputVarY := 0
    MouseMove, %X1%, %Y1%, 0
    Sleep, 100

    StartTime := A_TickCount
    Timeout := 2000

    while (A_TickCount - StartTime < Timeout) {
        Sleep, 100
        ImageSearch, OutputVarX, OutputVarY, %X1%, %Y1%, %X2%, %Y2%, *%Tolerance% %IconPath%
        if (ErrorLevel = 0) {
            MouseMove, %OutputVarX%, %OutputVarY%, 0
            return True
        }
    }

    return False
}

EnableMouse() {
    BlockInput, MouseMoveOff
}

DisableMouse() {
    BlockInput, MouseMove
}

FormatTime(ElapsedTime) {
    hours := Floor(ElapsedTime / 3600000)
    minutes := Floor((ElapsedTime - hours * 3600000) / 60000)
    seconds := Floor((ElapsedTime - hours * 3600000 - minutes * 60000) / 1000)
    milliseconds := ElapsedTime - (hours * 3600000) - (minutes * 60000) - (seconds * 1000)
    return Format("{:02}:{:02}:{:02}.{:01}", hours, minutes, seconds, milliseconds)
}

MyDebug(variable) {
    return
    FileAppend, % variable, %MyDebugFile%
    FileAppend, % "`n", %MyDebugFile%
}

debugItemCoordinatesList(item){
    n := item.length()
    MsgBox, % n
    loop, %n% {
        MsgBox, % item[A_Index][1] " " item[A_Index][2]
    }
}

CheckPing(IPToPing := "31.25.11.33") {
    FileDelete, %PingOutputFile%
    RunWait, %ComSpec% /c ping %IPToPing% -n 1 > %PingOutputFile%,, Hide
    FileRead, txt, %PingOutputFile%

    maxPing := ""

    StringSplit, lines, txt, `n
    Loop, % lines0
    {
        if (RegExMatch(lines%A_Index%, "Reply from .* time=(\d+)ms", pingResult))
        {
            currentPing := pingResult1
            if (currentPing > maxPing || maxPing = "")
                maxPing := currentPing
        }
    }

    BaseDebug(maxPing)

    if (maxPing != "")
        return maxPing
    else
        return 1000
}

CheckPingV2(IPToPing := "31.25.11.33") {
    Global shell
    command := "ping -n 1 " . IPToPing
    exec := shell.Exec(ComSpec " /c " command)
    output := exec.StdOut.ReadAll()

    maxPing := ""

    StringSplit, lines, output, `n
    Loop, % lines0
    {
        if (RegExMatch(lines%A_Index%, "Reply from .* time=(\d+)ms", pingResult))
        {
            currentPing := pingResult1
            if (currentPing > maxPing || maxPing = "")
                maxPing := currentPing
        }
    }

    BaseDebug(maxPing)

    if (maxPing != "")
        return maxPing
    else
        return 1000
}

CheckPingV4(IPToPing := "31.25.11.33") {
    command := "ping -n 1 " . IPToPing

    maxPing := ""

    Run, %ComSpec% /c %command%,,, PID
    Process, WaitClose, %PID%

    if (StdOut := ErrorLevel.StdOut) {
        while !StdOut.AtEOF {
            line := StdOut.ReadLine()
            if (RegExMatch(line, "Reply from .* time=(\d+)ms", pingResult)) {
                currentPing := pingResult1
                if (currentPing > maxPing || maxPing = "")
                    maxPing := currentPing
            }
        }
    }

    if (maxPing != "")
        return maxPing
    else
        return 1000
}

WaitForGoodPing(TargetPing := 100){
    return ; Disable this function for now
    x := CheckPing()
    ;Sleep, 200
    while(x >= TargetPing) {
        x := CheckPing()
        Sleep, 2000
    }

    Sleep, 3*x
    return x
}

TimeStartRecord(){
    Global StartTime := A_TickCount
}

TimeFinishLogg(automatic := true){
    global StartTime
    if (StartTime) {
        ElapsedTime := A_TickCount - StartTime
        FormattedTime := FormatTime(ElapsedTime)

        LogMessage := GlobalClicks "x " TargetFunction " took " FormattedTime

        if(!automatic)
            LogMessage := LogMessage " manually"

        FileAppend, %LogMessage%`n, %LoggerFilePath%
    }
}

;---------------------------------------

FunctionRunner(justFunction) {
    EnsureMineCraftOpen()
    ; Show tooltip saying function is Running for only 2 seconds

    Global GlobalClicks := 0
    Global TargetFunction
    TimeStartRecord()

    DisableMouse()
    GlobalClicks++
    TargetFunction := justFunction
    SetTimer, StopClicking, -500
}

StopClicking() {
    global GlobalClicks, StartTime, TargetFunction

    func := Func(TargetFunction)
    func.Call(GlobalClicks)
    EnableMouse()
    TimeFinishLogg()
    GlobalClicks := 0
}
;---------------------------------------

RestartTheScript() {
    BaseDebug("Restarting the script")
    EnableMouse()
    global DisableWurstHacks
    Send %DisableWurstHacks%
    Send, {Shift Up}
    TimeFinishLogg(false)
    Running := false
    FileRead, MyFileContents, %MyDebugFile%
    if (StrLen(MyFileContents) > 50000) {
        FileDelete, %MyDebugFile%
        FileAppend,, %MyDebugFile%
    }
    Reload
}
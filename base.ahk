;#include globals.ahk
#include coords.ahk
#include paths.ahk

SetDefaultMouseSpeed, 0
SetMouseDelay, 0

global Running := True

global StartTime := 0

global LoggerFilePath := A_ScriptDir . "\LoggerFile.txt"
global DisableWurstHacks := "{Insert}"

global DefaultSpeed := 6

global DefualtMouseDelay := 2
global DefualtDelayAfter := 2

Global GlobalClicks := 0
Global TargetFunction

CopyMouseCoordinates() {
    MouseGetPos, mouseX, mouseY
    PixelGetColor, color, % mouseX, % mouseY
    CoordString := mouseX "," mouseY
    colorString := "0x" . color
    Clipboard := CoordString
    FileAppend, %CoordString%, Coord.txA
    FileAppend, %colorString%, Coord.txB
    MyDebug("Mouse Coordinates: " . CoordString . " Color: " . colorString)
}
MoveToMouseCoordinatesFromClipBoard()
{
    FileRead, CoordString, Coord.txA
    StringSplit, CoordArray, CoordString, `,
    MouseMove, % CoordArray1, % CoordArray2
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

MoveMouseClick(Point, Speed := "", Delay := "", DpelayAfter := "", checkPixel := 0) {
    ;MouseClick, ,% Point[1], % Point[2]
    if(checkPixel == 1){
        PixelGetColor, color, % Point[1], % Point[2]
        MyDebug("Color Before Click: " . color . " at " . Point[1] . " " . Point[2])
        Sleep, 50

        MouseClick, left, % Point[1], % Point[2]
        Sleep, 50
        MouseMove, 0, 0
        Sleep, 400

        PixelGetColor, color2, % Point[1], % Point[2]
        MyDebug("Color After Click: " . color2 . " at " . Point[1] . " " . Point[2])
        MyDebug("--------")
        Sleep, 50

        if(color == color2){
            return 0
        }
    }
    else{
        MouseClick, left, % Point[1], % Point[2]
    }
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
    FileAppend, % variable, MyDebug.txt
    FileAppend, % "`n", MyDebug.txt
}

debugItemCoordinatesList(item){
    n := item.length()
    MsgBox, % n
    loop, %n% {
        MsgBox, % item[A_Index][1] " " item[A_Index][2]
    }
}

CheckPing(IPToPing := "31.25.11.33") {
    FileDelete, ping_output.txt
    RunWait, %ComSpec% /c ping %IPToPing% -n 1 > ping_output.txt,, Hide
    FileRead, txt, ping_output.txt

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

    MyDebug(maxPing)

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

    MyDebug(maxPing)

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
    EnableMouse()
    global DisableWurstHacks
    Send %DisableWurstHacks%
    Send, {Shift Up}
    TimeFinishLogg(false)
    Running := false
    FileRead, MyFileContents, MyDebug.txt
    if (StrLen(MyFileContents) > 50000) {
        FileDelete, MyDebug.txt
        FileAppend,, MyDebug.txt
    }
    Reload
}
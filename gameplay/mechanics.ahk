global gTriggered := false
global qTriggered := false
global CtrlGTriggered := false
global CtrlQTriggered := false

HoldToAimAsist(key, inGameKey) {
    send %inGameKey%
    While GetKeyState(key, "P")
        continue
    Sleep 10
    send %inGameKey%
}

TurnUra()
{
    Send, {Shift Up}
    Send, {Ctrl Down}
    Send, {w Down}
    Send, {0}
    Sleep, 300
    Send, {0}
    Send, {w up}
    Send, {Ctrl Up}
    Send, {Shift Down}
}

CriticalHitsMacro(key) {
    SendInput {9}
    Send, {-}
    Sleep, 380
    While (GetKeyState(key, "P"))
    {
        Click
        Sleep, 600
    }
    Send, {-}
    Send, {Space up}
    Send, {Shift up}
    Send %DisableWurstHacks%
}

JumpV2()
{
    Send, {-}
    Sleep, 290
    Send, {-}
}

Jump(){
    Send, {Space Down}
    Sleep, 50
    Send, {Space Up}
}

CriticalHitsWithShiftMacro(key) {
    SendInput {9} ; edit later
    Send, {Shift down}
    ;Click
    Sleep, 40
    While (GetKeyState(key, "P"))
    {
        Jump()
        Sleep, 70
        Click
        Sleep, 450
    }
    Send, {Shift up}
    Send, {Space Up}
    Send %DisableWurstHacks%
}

CriticalHitsMacro2(key) {
    SendInput {1}
    Click
    While (GetKeyState(key, "P"))
    {
        Click
        Sleep, 600
    }
    Send %DisableWurstHacks%
}

;MouseMoveToImg(IconName) {
;ScriptDir := A_ScriptDir
;IconPath := ScriptDir . "\img\" . IconName
;OutputVarX := OutputVarY := 0
;X2 := A_ScreenWidth
;Y2 := A_ScreenHeight
;ImageSearch, OutputVarX, OutputVarY, 0, 0, %X2%, %Y2%, %IconPath%
;if (ErrorLevel = 0) {
;MouseMove, %OutputVarX%, %OutputVarY%, 0
;}
;}

HoldToKillura1(key, inGameKey) {
    SendInput {9}
    send, %inGameKey%
    While GetKeyState(key, "P")
        continue
    Sleep 10
    send, %inGameKey%
    Send %DisableWurstHacks%
}

HoldToKillura2(key, inGameKey) {
    SendInput {1}
    send, %inGameKey%
    While GetKeyState(key, "P")
        continue
    Sleep 10
    send, %inGameKey%
}

HoldToAutoDrop(key, inGameKey) {
    send %inGameKey%
    While GetKeyState(key, "P")
        continue
    Sleep 10
    send %inGameKey%
    Send %DisableWurstHacks%
}

HoldToNuker(key, inGameKey) {
    send %inGameKey%
    While GetKeyState(key, "P")
        continue
    Sleep 10
    send %inGameKey%
    Send %DisableWurstHacks%
}

HoldToMine(key, inGameKey) {
    send %inGameKey%
    While GetKeyState(key, "P")
        continue
    Sleep 10
    send %inGameKey%
    Send %DisableWurstHacks%
}

SetTrigger(key, action) {
    if (!%key%Triggered) {
        Send, %action%
        %key%Triggered := true
    }
}

ReleaseTrigger(key) {
    if(GetKeyState("XButton1", "P") || GetKeyState("XButton2", "P")){
        Send, {End} 
    }
    else {
        Send, {key up}
        Send %DisableWurstHacks%
    }
    %key%Triggered := false
}

MoveToSpawn(){
    Send, t
    Sleep, 300
    Send /spawn
    Sleep, 200
    Send, { Enter }
    Sleep, 400
}

StorePVPLoot(){
    Send, {=}
    Send, {e}
    Sleep, 200
    MouseMove, 812, 558
    Send, {Shift Up}
    Sleep, 100
    Send, {RButton}
    Sleep, 200
    MoveMouseClick([1093, 387], 0.1, 0.1, 0.1)
    Sleep, 2000
    Send, {=}
}

BowSpray(key){
    Send, {=}
    Send, {3}
    while(GetKeyState(key, "P")){
        SendInput, {RButton Down}
        Sleep, 150
        SendInput, {RButton Up}
        Sleep, 50
    }
    Send, {=}
}

SwordCoolDown(key){
    while(GetKeyState(key, "P")){
        Click
        Sleep, 600
    }
}

PlaceHolder() {
    Send, {RButton Up}
    Reload
}

PlaceHolderShift(){
}

DisableCertainKeys(arr){
    for key in arr{
        Hotkey, ~%key%, PlaceHolder
        Hotkey, ~%key%, On
    }
}

EnableCertainKeys(arr){
    for key in arr{
        Hotkey, ~%key%, Off
    }
}

PlaySound() {
    Sleep, 3000
    SoundPlay, %A_ScriptDir%\Sounds\AppleSound.wav
}

EatEgaps(key){
    Send, %DisableWurstHacks%

    Hotkey, RButton, PlaceHolderShift
    Hotkey, RButton, On
    DisableCertainKeys(["1", "2", "3", "4", "5", "6", "7", "8", "9"])

    Send, {RButton Down}
    Sleep, 1700

    while(GetKeyState(key, "P") || GetKeySTate("RButton", "P"))
        Continue

    Hotkey, RButton, Off
    EnableCertainKeys(["1", "2", "3", "4", "5", "6", "7", "8", "9"])

    Send, {RButton Up}
    Send, %DisableWurstHacks%
    if(key == "6")
        Run, %A_ScriptDir%\gameplay\SoundPlayer.ahk
}

CowebTrap(key)
{
    Send, {4}
    while(GetKeyState(key, "P"))
    {
        Click Right
        Sleep, 100
    }

    Send, {1}
    Send, {End}
    loop, 5
    {
        Click
        Sleep, 80
    }
    Send, %DisableWurstHacks%
}

;
JumpV3(){
    SendInput, {5}
    SendInput, {Space Down}
    Sleep, 50
    SendInput, {Space Up}
    Sleep, 150
    SendInput, {Space Down}
    Sleep, 50
    SendInput, {Space Up}
}


OpenShop(WurstKeyBinds := False) {
    DisableMouse()
    WaitForGoodPing()
    if(WurstKeyBinds) {
        Send, {NumPadMult}
    }
    else {
        Send, t
        Sleep, 300
        Send /shop
        Sleep, 200
        Send, { Enter }
    }
    Sleep, 400
}

CloseShop() {
    Sleep, 100
    Send, { e }
    EnableMouse()
}

Scroll(repeatCount) {
    Sleep, 400
    Loop, %repeatCount%
    {
        MouseClick, WheelDown
        Sleep, 50
    }
}

BuyAllItems(path, number := 16, numberOfClicks := 1, slowItems := 0) {
    OpenShop()
    length := path.Length()
    loop, % length {
        ;Sleep, 200
        WaitForGoodPing()
        MoveMouseClick(path[A_Index])
    }

    ;Sleep, 500

    numberOfClicks2 = % numberOfClicks + 0

    loop, %number% {
        WaitForGoodPing()

        dx := A_Index

        if(A_Index > 7){
            Scroll(1)
            dx := 7
        }

        if(slowItems){
            s1 = 0
            s2 = 0
            s3 = 0
            slowItems--
        }
        else { ; Fast and More
            s1 = 0.1
            s2 = 0.1
            s3 = 0.1
            numberOfClicks := numberOfClicks2
        }

        loop, % numberOfClicks {
            MoveMouseClick(ItemsShop_C[dx], s1, s2, s3)
            MoveMouseClick(TakeItems_C, s1, s2, s3)
            MoveMouseClick(DropItems_C, s1, s2, s3)
        }
    }

    CloseShop()
}

BuyItemV2(item, repeatCount := 1, shiftKey := True, countDrop := 0, speed := 0) {
    OpenShop()

    length := item.C.Length()
    counter := 0

    loop, % length {
        Sleep, 1000
        WaitForGoodPing()
        Point := item.C[A_Index]
        isClicked := MoveMouseClick(Point,,,,1)
        while(isClicked == 0){
            Sleep, 5000
            isClicked := MoveMouseClick(Point,,,,1)
        }
        counter := counter + 1
    }

    WaitForGoodPing()
    Scroll(Max(item.S - 7, 0))

    if (shiftKey) {
        Send, {Shift Down}
    }

    delayAfterClick := Floor(50 * speed)
    delayAfterTake := Floor(100 * speed)
    delayAfterDrop := Floor(50 * speed)

    delayAfterIteration := 50

    Loop, % repeatCount {
        MoveMouseClick(ItemsShop_C[min(7, item.S)])
        Sleep, DelayAfterClick
        MoveMouseClick(TakeItems_C)
        Sleep, delayAfterTake
        if(!shiftKey){
            MoveMouseClick(DropItems_C)
            Sleep, delayAfterDrop
        }
        delayAfterIteration := 50
    }

    if (shiftKey) {
        Send, {Shift Up}
    }

    if(countDrop){
        loop, % countDrop {
            MoveMouseClick(ItemsShop_C[min(7, item.S)])
            Sleep, DelayAfterClick
            MoveMouseClick(TakeItems_C)
            Sleep, delayAfterTake
            MoveMouseClick(DropItems_C)
            Sleep, delayAfterDrop
            Sleep, delayAfterIteration
        }
    }

    Sleep, 200
    CloseShop()
}

TakeCurrentItem(key){
    SetMouseDelay, 0.1
    SetDefaultMouseSpeed, 0.1
    DisableMouse()
    while(GetKeyState(key, "P")){
        Sleep, 10
        MouseGetPos, mouseX, mouseY
        current_c := {x: mouseX, y: mouseY}
        Send {Shift Down}

        Click
        MouseMove % TakeItems_C[1], % TakeItems_C[2]
        Click

        MouseMove, % current_c["x"], % current_c["y"]
        Send {Shift Up}
    }
    EnableMouse()
}

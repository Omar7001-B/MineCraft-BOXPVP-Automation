PutItemInBox(ItemImg, BoxImg, repeatCount := 1){
    DisableMouse()
    WaitForGoodPing()
    Send, {F11}
    Sleep, 800
    Send, {e}
    Sleep, 200
    MouseMoveToImg(BoxImg, 789, 553, 1138, 719)
    Click Right
    Sleep, 200

    loop, %repeatCount% {
        MouseMoveToImg(ItemImg, 789, 553, 1138, 719, 50)
        Send, {Shift Down}
        Click Left
        Send, {Shift Up}
    }

    Send, {Esc}
    Sleep, 400
    Send, {F11}
    Sleep, 400
    EnableMouse()
}

OpenPv1(WurstKeyBinds := True){
    EnsureMineCraftOpen()
    EnsureGameFocus()
    if(WurstKeyBinds) {
        Send, {NumPadDiv}
    }
    else
    {
        Send, t
        Sleep, 300
        Send /pv 1
        Sleep, 200
        Send, { Enter }
        Sleep, 400
    }
}

StoreEverythingInBox(BoxImg){
    DisableMouse()
    WaitForGoodPing()
    Send, {F11}
    Sleep, 800
    Send, {e}
    Sleep, 200
    MouseMoveToImg(BoxImg, 789, 553, 1138, 719)
    Click Right
    Sleep, 200

    MoveMouseClick(StoreItems_C, 0.1, 0.1, 0.1)
    Sleep, 3000

    Send, {Esc}
    Sleep, 400
    Send, {F11}
    Sleep, 400
    EnableMouse()
}

StealEverythingInBox(BoxImg){
    DisableMouse()
    WaitForGoodPing()
    Send, {F11}
    Sleep, 800
    Send, {e}
    Sleep, 200
    MouseMoveToImg(BoxImg, 789, 553, 1138, 719)
    Click Right
    Sleep, 200

    MoveMouseClick(StealItems_C, 0.1, 0.1, 0.1)
    Sleep, 3000

    Send, {Esc}
    Sleep, 400
    Send, {F11}
    Sleep, 400
    EnableMouse()
}

PutStackInPv1(ItemImg, repeatCount := 1){
    DisableMouse()
    WaitForGoodPing()
    Send, {F11}
    Sleep, 800
    OpenPv1()
    Sleep, 100

    loop, %repeatCount% {
        MouseMoveToImg(ItemImg, 791, 574, 1140, 760)
        Send, {Shift Down}
        Click Left
        Send, {Shift Up}
    }

    Sleep, 800
    Send, {Esc}
    Sleep, 400
    Send, {F11}
    Sleep, 800
    EnableMouse()
}

TakeItemFromPv1(ItemImg, repeatCount := 1){
    DisableMouse()
    WaitForGoodPing()
    Send, {F11}
    Sleep, 800
    OpenPv1()
    Sleep, 100

    loop, %repeatCount% {
        MouseMoveToImg(ItemImg, 800, 366, 1140, 590)
        Send, {Shift Down}
        Click Left
        Send, {Shift Up}
    }

    Sleep, 1000
    Send, {Esc}
    Sleep, 200
    Send, {F11}
    Sleep, 200
    EnableMouse()
}

PutItemOnAnotherItemToPv1(ItemImg, ItemLocation, repeatCount := 1){
    DisableMouse()
    WaitForGoodPing()
    Send, {F11}
    Sleep, 800
    OpenPv1()
    Sleep, 100

    loop, %repeatCount% {
        MouseMoveToImg(ItemImg, 800, 600, 2223, 776)
        Sleep, 200
        Click Left
        Sleep, 200
        MouseMoveToImg(ItemLocation, 800, 366, 1140, 590) ; All
        Sleep, 200
        Click Left
        Sleep, 400
    }

    Sleep, 1000
    Send, {Esc}
    Sleep, 400
    Send, {F11}
    Sleep, 400
    EnableMouse()
}

TakeItemFromBox(ItemImg, BoxImg, repeatCount := 1){
    DisableMouse()
    WaitForGoodPing()
    Send, {F11}
    Sleep, 800
    Send, {e}
    Sleep, 200
    MouseMoveToImg(BoxImg, 789, 553, 1138, 719)
    Click Right
    Sleep, 200

    loop, %repeatCount% {
        MouseMoveToImg(ItemImg, 789, 553, 1138, 512, 50)
        Send, {Shift Down}
        Click Left
        Send, {Shift Up}
    }

    Send, {Esc}
    Sleep, 400
    Send, {F11}
    Sleep, 400
    EnableMouse()
}

PutStackInSlot1(ItemImg, BoxImg, repeatCount := 1){
    DisableMouse()
    WaitForGoodPing()
    Send, {F11}
    Sleep, 200
    Send, {e}
    Sleep, 200
    MouseMoveToImg(BoxImg, 789, 553, 1138, 719)
    Click Right

    loop, %repeatCount% {
        Sleep, 200
        isElementExist := MouseMoveToImg(ItemImg, 789, 374, 1138, 719, 50)

        Sleep, 100
        Click
        Sleep, 100
        Click
        Sleep, 1000
        Click
        Sleep, 100
        Send, % A_Index
        Sleep, 300
        Click
        Sleep, 200
        Click
        Sleep, 200
        Click
    }

    Sleep, 200
    Send, {Esc}
    Sleep, 400
    Send, {1}
    Sleep, 400
    Send, {F11}
    Sleep, 400
    EnableMouse()

    return isElementExist
}
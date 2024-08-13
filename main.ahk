;SetUpGUI()
;ShowGui()

;Global shell := ComObjCreate("WScript.Shell")
;var := CalcInputNeededToMakeAmount(1, 1, 1, 12 * 9)
;x := var.input
;y := var.outpu
;MsgBox, %x% %y%

;1::CountEmptyCells()w
;(9, true)ShowMaterialForFullPickAxe(9, true)

#include core/base.ahk

#include automation_v1/shop.ahk
#include automation_v2/inventory.ahk
#include automation_v2/auction.ahk

#include automation_v1/farm.ahk
#include automation_v1/fullsets.ahk

#include gameplay/mechanics.ahk
#include gameplay/messages.ahk

#include core/gui.ahk

#include automation_v2/greedy.ahk

CapsLock::TestFunction()
#IfWinActive, Minecraft
    ^!F11::FullScreenBorderless()
    ;1::GreedyPath(GoldenBlocksToGoldenIngot_P2, 3 * 64)
    ;;1::TestNethFarmV2()
    ; -------------------- Shop And Farming Functions --------------------
    F2::FunctionRunner("FarmGoldenBlocks")
    ^F2::FunctionRunner("FarmGoldenBlocksV3")

    F3::FunctionRunner("FarmNeitherBlocks")
    ^F3:: FunctionRunner("FarmNeitherBlocksV2")

    F4::FunctionRunner("FarmEndBlocks")
    ^F4::FunctionRunner("FarmEndBlocksV2")

    ; ------------------- Selling --------------------------------------
    ;LButton::LButtonModify()
    ;~MButton::OpenPv1()
    ;Numpad0::SellItemFromBox("apples2.bmp", "BlackBox.bmp", 200, 400, 32, 46)
    ;NumPad6::FunctionRunner("BuyCoweb")
    ;NumPad1::FunctionRunner("GoldenBlocksToGoldenIgnot")
    ;Numpad2::FunctionRunner("GoldenBlocksToGoldenApplesV4")
    ;Numpad3::ScammersWarning()

    NumPad4::SellNineStacksEgap()
    ;NumPad5::
    ;NumPad7::UseAllEnchanting()
    ;NumPad8::SellAndAnnounceCurrenteItemInHand(650, 32, "Enchanted Golden Apples")
    NumPad9::FunctionRunner("CheckMoneyOfAllPlayers")

    NumPadSub::TakeCurrentItem("NumPadSub")

    NumPadAdd::FunctionRunner("GoldenBlocksToGoldenApples")
    ^NumPadAdd::FunctionRunner("GoldenBlocksToGoldenApplesV3")
    +^NumPadAdd::FunctionRunner("GoldenBlocksToGoldenApplesV3")

    ; -------------------- Full Sets --------------------
    +F10::FunctionRunner("FulldiamondEveryThing")
    +F11::FunctionRunner("FullNeiterEveryThing")
    +F12::FunctionRunner("FulEndEveryThing")
    F12::FunctionRunner("FullSet")

    ; -------------------- PVP Binds --------------------
    ~XButton2::HoldToKillura2("XButton2", "r")
    ~Tab::HoldToMine("Tab", "m")
    ;CapsLock::CriticalHitsWithShiftMacro("CapsLock")

    ~XButton1::CriticalHitsMacro("XButton1")
    ~^XButton1::CriticalHitsMacro("XButton1")
    ^xButton2::CriticalHitsMacro2("XButton2")

    !RButton::BowSpray("RButton")
    !xButton2::BowSpray("xButton2")
    !xButton1::BowSpray("xButton1")

    ~q & LButton::SwordCoolDown("LButton")
    ~g & LButton::SwordCoolDown("LButton")
    ~`::JumpV3()

    ~Space & LButton::SwordCoolDown("LButton")

    ;~w & LButton::SwordCoolDown("LButton")

    ~q::SetTrigger("q", "{End}")
    ~^q::SetTrigger("CtrlQ", "{Home}")
    ~q up::ReleaseTrigger("q")

    ~g::SetTrigger("g", "{PgDn}")
    ~^g::SetTrigger("CtrlG", "{PgDn}")
    ~g up::ReleaseTrigger("g")

    ~2::EatEgaps("2")
    ~6::EatEgaps("6")
    MButton::CowebTrap("MButton")

    ;^g::HoldToAimAsist("g", "{PgDn}")

    F1::
        HoldToAutoDrop("F1", "=")
        CopyMouseCoordinates()
    return

    +F1::MoveToMouseCoordinatesFromClipBoard()

    NumLock::FunctionRunner("ShuklerWithStackGoldToFullGoldenApples")
    NumPad7::FunctionRunner("ShuklerWithStackGoldToFullHarmingArrows")
    +XButton1::StorePVPLoot()
    +XButton2::StorePVPLoot()

    ; -------------------- Shop Functions --------------------
    NumPad1::FunctionRunner("BuyStrengthPotion")
    NumPad2::FunctionRunner("BuyInvisPotion")
    NumPad3::FunctionRunner("BuyCoweb")

    ; -------------------- Main Full Functions --------------------

    ; -------------------- Full Armors --------------------

    ;-------------------- New Approach --------------------

    ;-------------------- XP --------------------

    ; ------------------------------- Messages Part ----------------------------
    NumPad8::ChangeFunUser()
    +Up::PasteFunUser()
    ~::PasteFunUser()

    F9::SellingMessagesFunction()

    F5::GeneralPvpMessagesFunction()
    F6::EatingGoldenApplesMessagesFunction()
    F7::RunInFightMessagesFunction()
    F8::KickDownMessagesFunction()

    ; -------------------- GUI --------------------
    ^F::
        ; if gui is not visible, show it
        if !Gui {
            Gui, Show, x0, y0
            return
        }
        else {
            Gui, Hide
        }
    return

; 3 Golden Blcoks
; 9 Obsidian
; 1 Ignot
; 6 Bricks (default Shift)
; 1 Anchors (default Shift)
; 3 Blocks

; --------------------------------------------

#IF

; -------------------- Restart The Script --------------------

global Interrupt := 0
~Esc::
    MyDebug("Interrupted by Esc")
    RestartTheScript()
return
Ctrl::
    Interrupt := 1
Return

/*
Inventory Corners
Mouse Coordinates: 792,535
Mouse Coordinates: 1128,531
Mouse Coordinates: 790,693
Mouse Coordinates: 1132,695
*/

global InventoryTopLeft := [792, 535]
global InventoryBottomRight := [1132, 695]

TestFunction(){

    ;AddFarmData("GoldenBlocksFarm", 16, 48)

    Return
    EnsureGameFocus()
    Return

    ; Show color of : 1806, 355
    PixelGetColor, OutputVar, 1806, 355
    MyDebug("Pixel Color: " OutputVar " at 1806, 355")
    return

    MouseMoveToImg("BlackBox.bmp", 789, 553, 1138, 719)
    Return
    WinGet, hwnd, ID, A
    MyDebug("Window Handle: " hwnd)
    Return
    ; Show current window name
    WinGetTitle, currentWindow, A
    MyDebug("Current Window: " currentWindow)
    ; focus window on minecraft
    WinActivate, Minecraft

    ; check if minecraft Exist
    if !WinExist("ahk_class Minecraft")
    {
        MyDebug("Minecraft is open")
        return
    }
    Else
    {
        MyDebug("Minecraft is open")
    }

    return
    topLeftX := InventoryTopLeft[1]
    topLeftY := InventoryTopLeft[2]
    bottomRightX := InventoryBottomRight[1]
    bottomRightY := InventoryBottomRight[2]

    PixelSearch, Px, Py, topLeftX, topLeftY, bottomRightX, bottomRightY, 0x1073F2, 3, Fast
    if ErrorLevel = 0
    {
        MouseMove, Px, Py
        MyDebug("Pixel found at " Px " " Py)
    }
    else
    {
        MyDebug("Pixel not found")
    }

    return
    ; MouseMoveToImg("img/khaled.bmp", [792, 535], [1128, 531], [790, 693], [1132, 695])
    if(MouseMoveToImg("img/or.png", InventoryTopLeft, InventoryTopRight, InventoryBottomLeft, InventoryBottomRight))
    {
        MyDebug("Found")
    }
    else
    {
        MyDebug("Not Found")
    }

    ; get pixel color at 1114, 662
    PixelGetColor, OutputVar, 1114, 662
    MyDebug("Pixel Color: " OutputVar)
    ;; serach for  this pixel color at 1114 and move mouse to its PutItemOnAnotherItemToPv1(

    ; first get coordinates of this color
    ; Pixel Color: 0x1073F2
    ; and then  move mouse to it

    return
    imgPath := "img/emerled.png"
    ; move mouse to img
    ImageSearch, FoundX, FoundY, 0, 0, A_ScreenWidth, A_ScreenHeight, %imgPath%
    MouseMove, FoundX, FoundY, 0

    ;Return
    return
    CriticalHitsWithShiftMacro("CapsLock")
    return
    while GetKeyState("CapsLock", "P")
    {
        Send, {RButton}
        Sleep, 100
    }

}

TraceDelays(){
    low := 3
    high := 10

    while(low <= high)
    {
        Interrupt := 0
        mid := low
        MyDebug("`n----------------------------------`nStarted with Delay: " mid "`n")
        flag = 1
        loop, 30
        {

            if(OpenShop() == 0)
            {
                flag := 0
                break
            }
            Send, Esc
            MyDebug("Sucess_" A_Index " delay " mid)
            Sleep, mid * 1000
        }

        if(flag)
        {
            MyDebug("Mid: " mid " works successfully")
            high := mid
        }
        else
        {
            MyDebug("Mid: " mid " does not work")
        }
        low := low + 1

        MyDebug("`nFinished with Delay: " mid "`n---------------------------------")
        MyDebug("Sleeping for 10 seconds")
        Sleep, 10000
    }
}
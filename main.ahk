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

#IfWinActive, Minecraft
    ^!F11::FullScreenBorderless()
    CapsLock::TestFunction()
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

~Esc:: RestartTheScript()

TestFunction(){

    ;wloop, 999999 {
    ;SellItemFromBox("apples2.bmp", "BlackBox.bmp", 1000, 1000, 64, 64, True, Mod(A_Index, 3) == 0)
    ;Sleep, 5000e
    ;}

    ;return
    ;ShowMaterialForFullArmors(4)
    ;PrepareAndBuyNumberOfFullArmors(4)

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


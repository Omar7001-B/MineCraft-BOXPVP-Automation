global FarmStore := "data/Farms.ini"

global PvFirstRow := [[818,366], [853,366], [890,366], [920,366], [960, 366], [990,366], [1030,366], [1060,366], [1090, 366]]
global PvSecond := [[818, 400], [853,400], [890,400], [920,400], [960, 400], [990,400], [1030,400], [1060,400], [1090, 400]]
global PvThirdRow := [[818, 435], [853,435], [890,435], [920,435], [960, 435], [990,435], [1030,435], [1060,435], [1090, 435]]
global PvFourthRow := [[818, 475], [853,475], [890,475], [920,475], [960, 475], [990,475], [1030,475], [1060,475], [1090, 475]]
global PvFifthRow := [[818, 510], [853,510], [890,510], [920,510], [960, 510], [990,510], [1030,510], [1060,510], [1090, 510]]
global PvSixthRow := [[818, 545], [853,545], [890,545], [920,545], [960, 545], [990,545], [1030,545], [1060,545], [1101,545]]

global PvFullRows := [PvFirstRow, PvSecond, PvThirdRow, PvFourthRow, PvFifthRow, PvSixthRow]

FarmGoldenBlocks(repeatCount := 999999){
    ;LoadGoldenBlocksInShulker()
    loop, 999999 {
        loop, 40
        {
            StartTime := A_TickCount
            BuyItemV2(GoldenBlocksToDiamond_C, 1, True, 10)
            BuyItemV2(DiamondToGoldIgnot_C, 50)
            BuyItemV2(GoldenIgnotToEmereld_C, 20)
            BuyItemV2(EmereledToGoldenBlock_C, 40)
            ;LoadGoldenBlocksInShulker()
            AddFarmData("GoldenBlocksFarm", 14, (A_TickCount - StartTime) // 1000, 1)
        }
        ;LoadGoldenBlocksInShulker()
    }
}
FarmCompRowGold(repeatCount := 999999)
{
    loop, 9999999
    {
        loop, 16
        {
            StartTime := A_TickCount
            LoadCompRowGoldInPV()
            BuyItemV2(CompressedRowGoldToDiamond_C, 10)
            BuyItemV2(DiamondToGoldNuggets_C, 40)
            BuyItemV2(GoldenNuggetsToEmereld_C, 40)
            BuyItemV2(EmereledToCompressedRowGold_C, 40)
            AddFarmData("CompRowGoldFarm", 69, (A_TickCount - StartTime) // 1000, 1)
        }
        CompressPVToShulker()
    }

}

ConvertShulkerCompToShulkerGoldenBlocks(repeatCount := 999999)
{
    loop, 9
    {
        LoadCompFromShulker()
        BuyItemV2(CompressedRowGoldToEmereld_C, 10)
        BuyItemV2(EmereledToGoldenBlock_C, 40)
        JustStoreInPv1([812, 612])
    }
}

ConvertShulkerCompToShulkerGoldenIgnot(repeatCount := 999999)
{
    loop, 9
    {
        LoadCompFromShulker()
        BuyItemV2(CompressedRowGoldToEmereld_C, 10)
        BuyItemV2(EmereledToGoldIgnot_C, 40)
        JustStoreInPv1([812, 612])
    }
}

AddFarmData(section, amount, Time, calls)
{
    global FarmStore ; Ensure FarmStore is available in the function

    ; Check and initialize section if it doesn't exist
    IniRead, currentAmount, %FarmStore%, %section%, Amount, 0
    IniRead, currentTime, %FarmStore%, %section%, Time, 0
    IniRead, currentCalls, %FarmStore%, %section%, Calls, 0

    ; Convert the values to integers in case they are not properly initialized
    currentAmount := currentAmount + 0
    currentTime := currentTime + 0
    currentCalls := currentCalls + 0

    ; Update values
    newAmount := currentAmount + amount
    newTime := currentTime + Time
    newCalls := currentCalls + calls

    ; Write updated values back to the INI file
    IniWrite, %newAmount%, %FarmStore%, %section%, Amount
    IniWrite, %newTime%, %FarmStore%, %section%, Time
    IniWrite, %newCalls%, %FarmStore%, %section%, Calls

    ; Debug output
    MyDebug("Added " . amount . " to " . section . " in " . Time . " seconds" . calls . " calls")
    MyDebug("Total " . section . ": " . newAmount . " in " . newTime . " seconds" . newCalls . " calls`n")
}

RetrieveFarmData(section)
{
    global FarmStore ; Ensure FarmStore is available in the function

    ; Read current values from the INI file
    IniRead, currentAmount, %FarmStore%, %section%, Amount, 0
    IniRead, currentTime, %FarmStore%, %section%, Time, 0
    IniRead, currentCalls, %FarmStore%, %section%, Calls, 0

    return {Amount: currentAmount, Time: currentTime, Calls: currentCalls}
}

OpenInventory()
{
    EnsureGameFocus()
    Send, {e}
    Sleep, 200
}

LoadCompRowGoldInPV()
{
    ;FirstInvCell := [812, 555]

    PVCell := [[817, 421], [852,421], [890,420]]

    ;StoreInInv := [1080, 390]
    StoreInPV := [1070, 333]
    ;OpenInventory()
    ;Sleep, 1000

    ;; Open Shulker
    ;MouseMove, FirstInvCell[1], FirstInvCell[2]
    ;Click Right
    ;Sleep, 1000

    ;Open PV
    OpenPv1()
    Sleep, 500

    ; Store Everything In Shulker
    MouseMove, StoreInPV[1], StoreInPV[2]
    Click Left

    Sleep, 2000

    loop, 3
    {
        MouseMove, PvFirstRow[A_Index][1], PvFirstRow[A_Index][2]
        loop, 4
        {
            Click Right
            Sleep, 100
        }
        Sleep, 500
        Send, {Shift Down}
        Sleep, 200
        Click Left
        Sleep, 200
        Send, {Shift Up}
        Sleep, 200
        Click Left
        Sleep, 200
    }

    ; Close the Shulker
    CloseShop()
    Sleep, 500
}

JustStoreInPv1(Point)
{
    StoreInPV := [1070, 333]
    OpenPv1()
    Sleep, 500
    if(Point)
    {
        MouseMove, Point[1], Point[2]
        Click Left
        Sleep, 500
    }
    MouseMove, StoreInPV[1], StoreInPV[2]
    Click Left
    Sleep, 2000

    if(Point)
    {
        MouseMove, Point[1], Point[2]
        Click Left
        Sleep, 500
    }
    CloseShop()
}

OpenShulker(Point)
{
    MouseMove, Point[1], Point[2]
    Click Right
    Sleep, 1000
}

LoadCompFromShulker()
{
    FirstInvCell := [812, 555]
    ShulkerCells := [[816,419], [846,418], [886,416]]
    StoreInShulker := [1092,395]
    StealFromShulker := [970,383]

    OpenInventory()
    Sleep, 200
    OpenShulker(FirstInvCell)
    Sleep, 500

    loop, 3
    {
        MouseMove, 0, 0
        Sleep, 100
        Point := FirstEmptyCellShulker(false)
        MouseMove, Point[1], Point[2]

        Sleep, 500
        Send, {Shift Down}
        Sleep, 200
        Click Left
        Sleep, 200
        Send, {Shift Up}
        Sleep, 200
    }

    ; Close the Shulker
    CloseShop()
}

CompressPVToShulker()
{
    FirstInvCell := [812, 555]
    StoreInPV := [1070, 333]
    StoreInShulker := [1080, 390]
    OpenPv1()
    Sleep, 500

    ; Store Everything In Shulker
    MouseMove, StoreInPV[1], StoreInPV[2]
    Click Left
    Sleep, 2000

    ; Rgith click on first cell in PV
    MouseMove, PvFirstRow[1][1], PvFirstRow[1][2]
    Sleep, 100
    Click Right
    Sleep, 500
    Sleep, 500
    Send, {Shift Down}
    Sleep, 200
    Click Left
    Sleep, 200
    Send, {Shift Up}
    Sleep, 200
    Click Left
    Sleep, 200

    ; loop on third / fourth / fift rows in PV and click on them
    Send, {Shift Down}
    loop, 3
    {
        length := PvFullRows[A_Index].Length()
        i := A_Index + 1
        loop, %length%
        {
            MouseMove, PvFullRows[i][A_Index][1], PvFullRows[i][A_Index][2]
            Click Left
            Sleep, 100
        }
    }
    Send, {Shift Up}

    CloseShop()

    BuyItemV2(BlackShulker_C, 1, 0)
    OpenInventory()
    Sleep, 500
    MouseMove, FirstInvCell[1], FirstInvCell[2]
    Sleep, 100
    Click Right
    Sleep, 1000
    MouseMove, StoreInShulker[1], StoreInShulker[2]
    Click Left
    Sleep, 3500
    CloseShop()
    Sleep, 500

    FirstInvCell_PV := [812, 612]
    OpenPv1()
    Sleep, 1000
    ; Pick the shulker from first cell and placed it in any empty place in the last row or in the row before last
    MouseMove, FirstInvCell_PV[1], FirstInvCell_PV[2]
    Sleep, 100
    Click Left
    Sleep, 1000

    isShulkerToPV := false

    loop, 9
    {
        if(isEmptyCell(PvFifthRow[A_Index]))
        {
            MouseMove, PvFifthRow[A_Index][1], PvFifthRow[A_Index][2]
            Sleep, 100
            Click Left
            Sleep, 500

            MouseMove, StoreInPV[1], StoreInPV[2]
            Sleep, 100
            Click Left
            Sleep, 1000
            CloseShop()
            isShulkerToPV := true
            Return
        }
    }

    loop, 9
    {
        if(isEmptyCell(PvSixthRow[A_Index]))
        {
            MouseMove, PvSixthRow[A_Index][1], PvSixthRow[A_Index][2]
            Sleep, 100
            Click Left
            Sleep, 500

            MouseMove, StoreInPV[1], StoreInPV[2]
            Sleep, 100
            Click Left
            Sleep, 1000
            CloseShop()
            isShulkerToPV := true
            Return
        }
    }

    Sleep, 500
    OpenEnderChest()
    ; Store Everything
    MouseMove, StoreInShulker[1], StoreInShulker[2]
    Sleep, 500
    Click Left
    Sleep, 2000
    CloseShop()
}

/*
LoadGoldenBlocksInShulker()
{
    FirstInvCell := [812, 555]
    FirstShulkerCell := [817, 421]
    StoreInInv := [1080, 390]
    OpenInventory()
    Sleep, 1000

    ; Open Shulker
    MouseMove, FirstInvCell[1], FirstInvCell[2]
    Click Right
    Sleep, 1000

    ; Store Everything In Shulker
    MouseMove, StoreInInv[1], StoreInInv[2]
    Click Left

    Sleep, 2000

    ; Send 40 GoldenBlocks back to the inv
    MouseMove, FirstShulkerCell[1], FirstShulkerCell[2]
    Click Left ; Split
    Sleep, 100
    Click Left ; Split
    Sleep, 1000

    Click Left ; Split

    loop, 15
    {
        Click Right ; Split
        Sleep, 100
    }

    ; Send Shift + left click
    Send, {Shift Down}
    Sleep, 200
    Click Left
    Sleep, 200
    Send, {Shift Up}
    Sleep, 200

    ; Putting the picked elements back
    Click Left

    ; Close the Shulker
    CloseShop()
    Sleep, 500

    OpenInventory()

}

ReplaceCurrentShulker()
{
    FirstInvCell_PV := [812, 612]
    SecondInvCell_PV := [850, 605]
    FirstPvCell := [813, 360]

    FirsrtInvCell := [970, 556]

    ; Send The Shulker To Pv1
    OpenPv1()
    Sleep, 1000

    MouseMove, FirstInvCell_PV[1], FirstInvCell_PV[2]
    Sleep, 100
    Send, {Shift Down}
    Sleep, 200
    Click Left
    Sleep, 200
    Send, {Shift Up}
    Sleep, 1000

    ; Close Pv1
    CloseShop()

    ; Buy a new shulker from Shop
    BuyItemV2(BlackShulker_C, 1, 0)
}
*/

FarmNeitherBlocks(repeatCount := 1){
    loop, 99999 {
        BuyItemV2(BlockToCryingObsidian_C11)
        BuyItemV2(CryingObsidianToBrick_C5, 42)
        Loop, 2{
            BuyItemV2(BrickToAnchor_C4, 5)
            BuyItemV2(AnchorToBlock_C10, 24)
        }
    }
}

FarmNeitherBlocksV2(repeatCount := 1){
    loop, 99999 {
        BuyItemV2(BlockToCryingObsidian_C11)
        BuyItemV2(CryingObsidianToBrick_C5, 42)
        Loop, 2{
            BuyItemV2(BrickToAnchor_C4, 5)
            BuyItemV2(AnchorToBlock_C10, 24)
        }

        if(!Mod(A_Index, 3)) {
            PutItemInBox("NethierBlock.bmp", "BlackBox.bmp", 1)
        }
    }
}

FarmEndBlocks(repeatCount := 1){
    loop, 999999 {
        BuyItemV2(BlockToBlackeGlass_C11)
        BuyItemV2(BlackGlassToBud_C5, 32)

        BuyItemV2(BudToPurpleGlass_4, 8)
        BuyItemV2(PurpleGlassToBlock_C10, 24)

        BuyItemV2(BudToPurpleGlass_4, 10 )
        BuyItemV2(PurpleGlassToBlock_C10, 24)
    }
}

FarmEndBlocksV2(repeatCount := 1){
    loop, 90 {
        BuyItemV2(BlockToBlackeGlass_C11)
        BuyItemV2(BlackGlassToBud_C5, 32)

        BuyItemV2(BudToPurpleGlass_4, 8)
        BuyItemV2(PurpleGlassToBlock_C10, 24)

        BuyItemV2(BudToPurpleGlass_4, 10 )
        BuyItemV2(PurpleGlassToBlock_C10, 24)

        if(!Mod(A_Index, 3)) {
            PutItemInBox("EndBlock.bmp", "BlackBox.bmp", 1)
        }
    }
}

GoldenBlocksToGoldenApples(repeatCount := 1){
    loop, %repeatCount% {
        BuyItemV2(GoldenBlocksToEmereld_C)
        BuyItemV2(EmereledToCompressedRowGold_C, 20)
        loop, 12 {
            BuyItemV2(CompressedRowGoldToRowGold_C3)
            BuyItemV2(RowGoldToGoldIgnot_C, 16)
            if(!Mod(A_Index, 2))
                BuyItemV2(GoldenIngotToApples_C, 2)
        }
    }
}

GoldenBlocksToGoldenApplesV2(repeatCount := 1){
    loop, %repeatCount% {
        BuyItemV2(GoldenBlocksToEmereld_C)
        BuyItemV2(EmereledToCompressedRowGold_C, 20)
        loop, 4 {
            BuyItemV2(CompressedRowGoldToRowIron_C3, 3)
            BuyItemV2(RowIronToGoldIgnot_C, 20)
            BuyItemV2(GoldenIngotToApples_C)
        }
    }
}

GoldenBlocksToGoldenApplesV3(repeatCount := 1, sellPrice := 0){
    loop, 20 { ; 25 is to take 25 stacks of golden blocks
        isElementExist := PutStackInSlot1("goBaby.bmp", "BlackBox.bmp")

        if(!isElementExist)
            return

        GoldenBlocksToGoldenApples(1)
        if(sellPrice)
            SellItemFromBox("apples2.bmp", "BlackBox.bmp", sellPrice, sellPrice, 64, 64)
        PutItemInBox("apples2.bmp", "BlackBox.bmp", 2)
    }
}

ShuklerWithStackGoldToFullGoldenApples(repeatCount := 1){
    loop, 99999 {
        TakeItemFromPv1("BlackBox.bmp", 1)
        PutStackInSlot1("goBaby.bmp", "BlackBox.bmp", 2)
        FarmGoldenBlocksV3(15)
        GoldenBlocksToGoldenApplesV3(20, 1200)
        PutItemInBox("apples2.bmp", "BlackBox.bmp", 5)
        PutItemOnAnotherItemToPv1("BlackBox.bmp", "afkShard.bmp", 1)
        PutStackInPv1("apples2.bmp", 5)
        Sleep, 1000
    }

}

GoldenBlocksToGoldenApplesV4(repeatCount := 1){
    loop, 999999 {
        FarmGoldenBlocks(3)
        ;PutItemInBox("goBaby.bmp", "BlackBox.bmp", 3)
        ;TakeItemFromBox("goBaby.bmp", "BlackBox.bmp", 1)
        GoldenBlocksToGoldenApples(1)
        PutItemInBox("apples2.bmp", "BlackBox.bmp", 2)

        SellItemFromBox("apples2.bmp", "BlackBox.bmp", 200, 400, 32, 46)

        if(!Mod(A_Index, 4)) {
            ;TakeItemFromBox("goBaby.bmp", "BlackBox.bmp", 1)
            GoldenBlocksToGoldenApples(1)
            SellItemFromBox("apples2.bmp", "BlackBox.bmp", 200, 400, 32, 46)
        }
    }
}

GoldenBlocksToGoldenIgnot(repeatCount := 1){
    loop, %repeatCount% {
        BuyItemV2(GoldenBlocksToEmereld_C)
        BuyItemV2(EmereledToCompressedRowGold_C, 20)
        loop, 12 {
            BuyItemV2(CompressedRowGoldToRowGold_C3)
            BuyItemV2(RowGoldToGoldIgnot_C, 16)
        }
    }
}

GoldenBlocksToHarmingArrowsV2(repeatCount := 1){
    loop, %repeatCount% {
        isElementExist := PutStackInSlot1("goBaby.bmp", "BlackBox.bmp")
        if(!isElementExist)
            return
        BuyItemV2(GoldenBlocksToEmereld_C)
        BuyItemV2(EmereledToCompressedRowGold_C, 20)
        loop, 11 {
            BuyItemV2(CompressedRowGoldToRowGold_C3)
            BuyItemV2(RowGoldToGoldIgnot_C, 16)

            if(Mod(A_Index, 2)){
                BuyItemV2(HarmingArrows_C, 1)
                PutItemInBox("HarmingArrows.bmp", "BlackBox.bmp", 1)
            }
        }
    }
}

ShuklerWithStackGoldToFullHarmingArrows(repeatCount := 1){
    loop, 99999 {
        TakeItemFromPv1("BlackBox.bmp", 1)
        PutStackInSlot1("goBaby.bmp", "BlackBox.bmp", 1)
        FarmGoldenBlocksV3(6)
        PutItemInBox("goBaby.bmp", "BlackBox.bmp", 2)
        GoldenBlocksToHarmingArrowsV2(9)
        StoreEverythingInBox("BlackBox.bmp")
        PutItemOnAnotherItemToPv1("BlackBox.bmp", "afkShard.bmp", 1)
    }

}

FarmGoldenBlocksV3(repeatCount := 1){
    loop, %repeatCount% { ; 15 is to fill the box with approximately 20 stacks of golden blocks
        FarmGoldenBlocks(3)
        PutItemInBox("goBaby.bmp", "BlackBox.bmp", 1)
        if(!Mod(A_Index, 3)) {
            PutItemInBox("goBaby.bmp", "BlackBox.bmp", 1)
        }
    }
}

UseAllEnchanting(repeatCount := 1){
    loop, 9 {
        Send, % A_Index
        loop, 64 {
            Click Right
            Sleep, 100
        }
        Sleep, 200
    }
}

PrepareAllGoldMaterial(repeatCount := 1){
    loop, %repeatCount% {
        PutStackInSlot1("goBaby.bmp", "BlackBox.bmp", 1)
        BuyItemV2(GoldenBlocksToEmereld_C)
        BuyItemV2(EmereldToGoldenNuggets_C)
        BuyItemV2(EmereledToCompressedRowGold_C, 20)
        loop, 6 {
            BuyItemV2(CompressedRowGoldToRowGold_C3)
            BuyItemV2(RowGoldToGoldIgnot_C, 16)
        }
        StoreEverythingInBox("BlackBox.bmp")
    }
}

PrepareAllNetherMaterial(repeatCount := 1){
    loop, %repeatCount% {
        PutStackInSlot1("NethierBlock.bmp", "BlackBox.bmp", 1)

        BuyItemV2(BlockToCryingObsidian_C11, 12, false)
        BuyItemV2(CryingObsidainToScraps_C, 8, false)
        BuyItemV2(CryingObsidianToBrick_C5, 12)
        BuyItemV2(BrickToObsidian_C5, 42, false)
        BuyItemV2(ObsidianToIgnot_C9, 20)

        StoreEverythingInBox("BlackBox.bmp")
    }
}

PrepareAllEndMaterial(repeatCount := 1){
    loop, %repeatCount% { ; I multipled everything by 3
        PutStackInSlot1("EndBlock.bmp", "BlackBox.bmp", 1)

        BuyItemV2(BlockToBlackeGlass_C11, 30, false)
        BuyItemV2(BlackGlassToShard_C, 20, false)
        BuyItemV2(BlackGlassToBud_C5, 25)

        BuyItemV2(BudToMagnetaGlass_C1, 40, false)
        BuyItemV2(MagnetaClassToClusters_C, 60)

        StoreEverythingInBox("BlackBox.bmp")
    }
}

ConvertToStacks(amount){
    stacks := amount // 64
    remainder := Mod(amount, 64)

    if(stacks > 0)
        return stacks . "s " . remainder
    else
        return remainder
}

ShowMaterialsInStacks(Array, num := 1){
    stringOutput := ""
    mainInputName := ""
    totalMainInput := 0

    for index, item in Array {
        mainElementName := item.name
        mainRequiredAmount := item.count * num

        mainInputName := item.mainInput

        CeiledInput := item.CeiledInput.input
        CeiledOutput := item.CeiledInput.output

        stringOne := ""
        stringOne .= mainElementName . " : " . "[" . mainRequiredAmount . "] " . ConvertToStacks(mainRequiredAmount)

        ;while(stringOne.Length < 20)
        ;stringOne .= " "

        stringOutput .= stringOne . " --- " . ConvertToStacks(CeiledInput) . " = " . ConvertToStacks(CeiledOutput) . "`n"
        totalMainInput += CeiledInput
    }

    stringOutput .= mainInputName . " - " . ConvertToStacks(totalMainInput) . "`n"
    return % stringOutput
}

ShowMaterialForFullPickAxe(num := 9, needReturn := false) {
    Gold := []
    Gold.Push({name: "GoldenNuggets", count: 34, mainInput: "GoldenBlocks", CeiledInput: CalcInputNeededToMakeAmount(2, 8, 64, num * 34)})
    Gold.Push({name: "CompressedRowGold", count: 17, mainInput: "GoldenBlocks", CeiledInput: CalcInputNeededToMakeAmount(2, 8, 64, num * 17)})
    Gold.Push({name: "Golden Ignot", count: 24, mainInput: "GoldenBlocks", CeiledInput: CalcInputNeededToMakeAmount(2, 2, 5.3333333, num * 24)})
    Gold.Push({name: "Golden Block", count: 12, mainInput: "GoldenBlocks", CeiledInput: CalcInputNeededToMakeAmount(1, 1, 1, num * 12)})

    Neither := []
    ;Neither.Push({name: "Scrap", count: 6})
    ;Neither.Push({name: "Brick", count: 1})
    ;Neither.Push({name: "Ignot", count: 1})
    ;Neither.Push({name: "NetherBlcoks", count: 3})

    Neither.Push({name: "Scrap", count: 6, mainInput: "NetherBlocks", CeiledInput: CalcInputNeededToMakeAmount(2, 3, 53.76, num * 6)})
    Neither.Push({name: "CompBrick", count: 1, mainInput: "NetherBlocks", CeiledInput: CalcInputNeededToMakeAmount(2, 7, 18.66667, num * 1)})
    Neither.Push({name: "Ignot", count: 1, mainInput: "NetherBlocks", CeiledInput: CalcInputNeededToMakeAmount(2, 2, 18.66667, num * 2)})
    Neither.Push({name: "NetherBlocks", count: 3, mainInput: "NetherBlocks", CeiledInput: CalcInputNeededToMakeAmount(1, 1, 1, num * 3)})

    End := []
    ;End.Push({name: "Shards", count: 3})
    ;End.Push({name: "Bud", count: 2})
    ;End.Push({name: "Clusters", count: 2})
    ;End.Push({name: "Amethyst", count: 3})

    End.Push({name: "Shards", count: 3, mainInput: "EndBlocks", CeiledInput: CalcInputNeededToMakeAmount(2, 8, 32, num * 3)})
    End.Push({name: "Bud", count: 2, mainInput: "EndBlocks", CeiledInput: CalcInputNeededToMakeAmount(2, 8, 16, num * 2)})
    End.Push({name: "Clusters", count: 2, mainInput: "EndBlocks", CeiledInput: CalcInputNeededToMakeAmount(2, 1, 5.625, num * 2)})
    End.Push({name: "Amethyst", count: 3, mainInput: "EndBlocks", CeiledInput: CalcInputNeededToMakeAmount(1, 1, 1, num * 3)})

    stringOutput := ""
    stringOutput := "Material for " . num . " pickaxes" . "`n`n"
    stringOutput .= "Gold : " . "`n" . ShowMaterialsInStacks(Gold, num) . "------------------`n"
    stringOutput .= "Neither : " . "`n" . ShowMaterialsInStacks(Neither, num) . "------------------`n"
    stringOutput .= "End : " . "`n" . ShowMaterialsInStacks(End, num) . "------------------`n"

    FileAppend, %stringOutput%`n, LoggerFile.txt

    if(needReturn){
        returnArray := []
        for index, item in Gold {
            returnArray.Push(item.count * num)
        }
        for index, item in Neither {
            returnArray.Push(item.count * num)
        }
        for index, item in End {
            returnArray.Push(item.count * num)
        }
        return returnArray
    }

    MsgBox, % stringOutput
    FileAppend, %stringOutput%`n, LoggerFile.txt
}

ShowMaterialForFullArmors(num := 1){
    Gold := []
    ;Gold.Push({name: "GoldenNuggets", count: 76})
    ;Gold.Push({name: "CompressedRowGold", count: 24})
    ;Gold.Push({name: "Golden Ignot", count: 52})
    ;Gold.Push({name: "Golden Block", count: 32})
    Gold.Push({name: "GoldenNuggets", count: 76, mainInput: "GoldenBlocks", CeiledInput: CalcInputNeededToMakeAmount(2, 8, 64, num * 76)})
    Gold.Push({name: "CompressedRowGold", count: 24, mainInput: "GoldenBlocks", CeiledInput: CalcInputNeededToMakeAmount(2, 8, 64, num * 24)})
    Gold.Push({name: "Golden Ignot", count: 52, mainInput: "GoldenBlocks", CeiledInput: CalcInputNeededToMakeAmount(2, 2, 5.3333333, num * 52)})
    Gold.Push({name: "Golden Block", count: 32, mainInput: "GoldenBlocks", CeiledInput: CalcInputNeededToMakeAmount(1, 1, 1, num * 32)})

    Neither := []
    ;Neither.Push({name: "Scrap", count: 16})
    ;Neither.Push({name: "Brick", count: 4})
    ;Neither.Push({name: "Ignot", count: 24})
    ;Neither.Push({name: "NetherBlcoks", count: 12})

    Neither.Push({name: "Scrap", count: 16, mainInput: "NetherBlocks", CeiledInput: CalcInputNeededToMakeAmount(2, 3, 53.76, num * 16)})
    Neither.Push({name: "CompBrick", count: 4, mainInput: "NetherBlocks", CeiledInput: CalcInputNeededToMakeAmount(2, 7, 18.66667, num * 4)})
    Neither.Push({name: "Ignot", count: 24, mainInput: "NetherBlocks", CeiledInput: CalcInputNeededToMakeAmount(2, 2, 18.66667, num * 24)})
    Neither.Push({name: "NetherBlocks", count: 12, mainInput: "NetherBlocks", CeiledInput: CalcInputNeededToMakeAmount(1, 1, 1, num * 12)})

    End := []
    ;End.Push({item: "Shards", count: 16})
    ;End.Push({name: "Bud", count: 8})
    ;End.Push({name: "Clusters", count: 12})
    ;End.Push({name: "Amethyst", count: 16})

    End.Push({name: "Shards", count: 16, mainInput: "EndBlocks", CeiledInput: CalcInputNeededToMakeAmount(2, 8, 32, num * 16)})
    End.Push({name: "Bud", count: 8, mainInput: "EndBlocks", CeiledInput: CalcInputNeededToMakeAmount(2, 8, 16, num * 8)})
    End.Push({name: "Clusters", count: 12, mainInput: "EndBlocks", CeiledInput: CalcInputNeededToMakeAmount(2, 1, 5.625, num * 12)})
    End.Push({name: "Amethyst", count: 16, mainInput: "EndBlocks", CeiledInput: CalcInputNeededToMakeAmount(1, 1, 1, num * 16)})

    stringOutput := ""
    stringOutput := "Material for " . num . " full armors" . "`n`n"
    stringOutput .= "Gold : " . "`n" . ShowMaterialsInStacks(Gold, num) . "------------------`n"
    stringOutput .= "Neither : " . "`n" . ShowMaterialsInStacks(Neither, num) . "------------------`n"
    stringOutput .= "End : " . "`n" . ShowMaterialsInStacks(End, num) . "------------------`n"

    MsgBox, % stringOutput
    FileAppend, %stringOutput%`n, LoggerFile.txt
}

/*

WoodenSword -> 21 Golden Nuggets --> 6 clicks
StoneSword -> 13 Golden Nuggets, 7 CompressedRowGold --> 6 clicks
IronSword -> 10 CompressedRowGold, 11 IronIgnot --> 6 clicks
DiamondSword -> 13 IrongIgnot, 12 GoldenBlocks --> 6 clicks
FullNetheierSword -> 78 Golden Blocks --> 6 clicks

*/

ShowMaterialForFullSword(num := 1){
    Gold := []
    Gold.Push({name: "GoldenNuggets", count: 34, mainInput: "GoldenBlocks", CeiledInput: CalcInputNeededToMakeAmount(2, 8, 64, num * 34)})
    Gold.Push({name: "CompressedRowGold", count: 17, mainInput: "GoldenBlocks", CeiledInput: CalcInputNeededToMakeAmount(2, 8, 64, num * 11)})
    Gold.Push({name: "Golden Ignot", count: 24, mainInput: "GoldenBlocks", CeiledInput: CalcInputNeededToMakeAmount(2, 2, 5.3333333, num * 13)})
    Gold.Push({name: "Golden Block", count: 90, mainInput: "GoldenBlocks", CeiledInput: CalcInputNeededToMakeAmount(1, 1, 1, num * 12)})

    /*
    Neither := []
    ;Neither.Push({name: "Scrap", count: 8})
    ;Neither.Push({name: "Brick", count: 2})
    ;Neither.Push({name: "Ignot", count: 2})
    ;Neither.Push({name: "NetherBlcoks", count: 6})

    Neither.Push({name: "Scrap", count: 8, mainInput: "NetherBlocks", CeiledInput: CalcInputNeededToMakeAmount(2, 3, 53.76, num * 8)})
    Neither.Push({name: "CompBrick", count: 2, mainInput: "NetherBlocks", CeiledInput: CalcInputNeededToMakeAmount(2, 7, 18.66667, num * 2)})
    Neither.Push({name: "Ignot", count: 2, mainInput: "NetherBlocks", CeiledInput: CalcInputNeededToMakeAmount(2, 2, 18.66667, num * 2)})
    Neither.Push({name: "NetherBlocks", count: 6, mainInput: "NetherBlocks", CeiledInput: CalcInputNeededToMakeAmount(1, 1, 1, num * 6)})

    End := []
    ;End.Push({name: "Shards", count: 4})
    ;End.Push({name: "Bud", count: 4})
    ;End.Push({name: "Clusters", count: 2})
    ;End.Push({name: "Amethyst", count: 1})

    End.Push({name: "Shards", count: 4, mainInput: "EndBlocks", CeiledInput: CalcInputNeededToMakeAmount(2, 8, 32, num * 4)})
    End.Push({name: "Bud", count: 4, mainInput: "EndBlocks", CeiledInput: CalcInputNeededToMakeAmount(2, 8, 16, num * 4)})
    End.Push({name: "Clusters", count: 2, mainInput: "EndBlocks", CeiledInput: CalcInputNeededToMakeAmount(2, 1, 5.625, num * 2)})
    End.Push({name: "Amethyst", count: 1, mainInput: "EndBlocks", CeiledInput: CalcInputNeededToMakeAmount(1, 1, 1, num * 6)})

    stringOutput .= "Neither : " . "`n" . ShowMaterialsInStacks(Neither, num) . "------------------`n"
    stringOutput .= "End : " . "`n" . ShowMaterialsInStacks(End, num) . "------------------`n"
    */

    stringOutput := ""
    stringOutput := "Material for " . num . " full swords" . "`n`n"
    stringOutput .= "Gold : " . "`n" . ShowMaterialsInStacks(Gold, num) . "------------------`n"

    ;MsgBox, % stringOutput
    FileAppend, %stringOutput%`n, LoggerFile.txt
    MyDebug(stringOutput)
}

; ---------------------------------------------
BuyNumberOfDiamondPickAxe(num := 9){
    BuyAllItems(WoodenPickAxe_C, 6, num, 1)
    BuyAllItems(StonePickAxe_C, 6, num)
    BuyAllItems(IronPickAxe_C, 6, num)
    BuyAllItems(DiamondPickAxe_C, 6, num)
    BuyAllItems(NeitherPickAxe_C, 6, num)
}

BuyNumberOfNetherPickAxe(num := 9){
    BuyAllItems(NeitherPickAxe_C, 6, num)
}

BuyNumberOfEndPickAxe(num := 9){
    BuyAllItems(EndPickAxe_C, 5, num)
}

; ---------------------------------------------
BuyNumberOfDiamondSword(num := 9){
    BuyAllItems(WoodenSword_C, 6)
    BuyAllItems(StoneSword_C, 6)
    BuyAllItems(IronSword_C, 6)
    BuyAllItems(DiamondSword_C, 6)
    BuyAllItems(NeitherSword_C, 20)
}

BuyNumberOfNetherSword(num := 9){
    BuyAllItems(NeitherSword_C, 6)
}

BuyNumberOfEndSword(num := 9){
    BuyAllItems(EndSword_C, 6)
}

; ---------------------------------------------

; ---------------------------------------------
BuyNumberOfDiamondArmors(num := 1){
    BuyAllItems(LeatherArmors_C, 16, num, 4)
    BuyAllItems(IronArmors_C, 12, num)
    BuyAllItems(DiamondArmors_C, 16, num)
}

BuyNumberOfNetherArmors(num := 1){
    BuyAllItems(NeitherArmor_C, 20, num)
}

BuyNumberOfEndArmors(num := 1){
    BuyAllItems(EndArmor_C, 16, num)
}

;----------------------------------------------

CalcInputNeededToMakeAmount(inputMinAmount, outputMinAmount, factor, targetAmount){
    actualInputNeeded := targetAmount / factor
    ceiledInput := Ceil(actualInputNeeded / inputMinAmount) * inputMinAmount

    newOutput := ceiledInput * factor
    ceiledOutput := Ceil(newOutput / outputMinAmount) * outputMinAmount
    ; MsgBox, %inputMinAmount%  %outputMinAmount%  %factor%  %targetAmount%
    ; MsgBox, %ceiledInput%    %ceiledOutput%
    return {input: ceiledInput, output: ceiledOutput}
}

CalcExtraCycles(totalCycles){
    cyclesForAnExtra := 4
    extrasEarned := Ceil(totalCycles/cyclesForAnExtra)
    totalCyclesWithExtras := totalCycles + extrasEarned + 2
    return totalCyclesWithExtras
}

TestNethFarmV2(repeatCount := 32){
    f := Func("CalcExtraCycles")
    valuesA := [16, f.Call(16), f.Call(5), f.Call(27)]
    itemsA := [BlockToCryingObsidian_C11, CryingObsidianToBrick_C5, BrickToAnchor_C4, AnchorToBlock_C10]

    loop, % repeatCount {
        loop, % itemsA.MaxIndex() {
            if(A_Index == 1)
                BuyItemV2(itemsA[A_Index], valuesA[A_Index], false)
            else
                BuyItemV2(itemsA[A_Index], valuesA[A_Index])
        }
    }
}

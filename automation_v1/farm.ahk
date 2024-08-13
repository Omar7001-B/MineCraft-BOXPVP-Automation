﻿global FarmStore := "data/Farms.ini"
FarmGoldenBlocks(repeatCount := 999999){
    LoadGoldenBlocksInShulker()
    loop, 999999 {
        StartTime := A_TickCount
        BuyItemV2(GoldenBlocksToDiamond_C, 1, True, 10)
        BuyItemV2(DiamondToGoldIgnot_C, 50)
        BuyItemV2(GoldenIgnotToEmereld_C, 20)
        BuyItemV2(EmereledToGoldenBlock_C, 40)
        LoadGoldenBlocksInShulker()
        AddFarmData("GoldenBlocksFarm", 14, (A_TickCount - StartTime) // 1000)
    }
}

AddFarmData(section, amount, Time)
{
    global FarmStore ; Ensure FarmStore is available in the function

    ; Check and initialize section if it doesn't exist
    IniRead, currentAmount, %FarmStore%, %section%, Amount, 0
    IniRead, currentTime, %FarmStore%, %section%, Time, 0

    ; Convert the values to integers in case they are not properly initialized
    currentAmount := currentAmount + 0
    currentTime := currentTime + 0

    ; Update values
    newAmount := currentAmount + amount
    newTime := currentTime + Time

    ; Write updated values back to the INI file
    IniWrite, %newAmount%, %FarmStore%, %section%, Amount
    IniWrite, %newTime%, %FarmStore%, %section%, Time

    ; Debug output
    MyDebug("Added " . amount . " to " . section . " in " . Time . " seconds")
    MyDebug("Total " . section . ": " . newAmount . " in " . newTime . " seconds`n")
}
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

ShowMaterialForFullSword(num := 1){
    Gold := []
    ;Gold.Push({name: "GoldenNuggets", count: 34})
    ;Gold.Push({name: "CompressedRowGold", count: 11})
    ;Gold.Push({name: "Golden Ignot", count: 13})
    ;Gold.Push({name: "Golden Block", count: 12})

    Gold.Push({name: "GoldenNuggets", count: 34, mainInput: "GoldenBlocks", CeiledInput: CalcInputNeededToMakeAmount(2, 8, 64, num * 34)})
    Gold.Push({name: "CompressedRowGold", count: 11, mainInput: "GoldenBlocks", CeiledInput: CalcInputNeededToMakeAmount(2, 8, 64, num * 11)})
    Gold.Push({name: "Golden Ignot", count: 13, mainInput: "GoldenBlocks", CeiledInput: CalcInputNeededToMakeAmount(2, 2, 5.3333333, num * 13)})
    Gold.Push({name: "Golden Block", count: 12, mainInput: "GoldenBlocks", CeiledInput: CalcInputNeededToMakeAmount(1, 1, 1, num * 12)})

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

    stringOutput := ""
    stringOutput := "Material for " . num . " full swords" . "`n`n"
    stringOutput .= "Gold : " . "`n" . ShowMaterialsInStacks(Gold, num) . "------------------`n"
    stringOutput .= "Neither : " . "`n" . ShowMaterialsInStacks(Neither, num) . "------------------`n"
    stringOutput .= "End : " . "`n" . ShowMaterialsInStacks(End, num) . "------------------`n"

    MsgBox, % stringOutput
    FileAppend, %stringOutput%`n, LoggerFile.txt
}

; ---------------------------------------------
BuyNumberOfDiamondPickAxe(num := 9){
    BuyAllItems(WoodenPickAxe_C, 6, num, 1)
    BuyAllItems(StonePickAxe_C, 6, num)
    BuyAllItems(IronPickAxe_C, 6, num)
    BuyAllItems(DiamondPickAxe_C, 6, num)
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
    BuyAllItems(IronSword_C, 1)
    BuyAllItems(DiamondSword_C, 6)
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

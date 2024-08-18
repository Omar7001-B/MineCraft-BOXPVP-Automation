CountEmptyCells() {

    Send, {e}
    Sleep, 400
    Send, {F11}
    Sleep, 400

    TargetColor := GetPixel(1115, 461)
    MouseMove, 799, 394, 0
    InventoryCells :=
    (Join
    [
        [[822, 581], [858, 573], [894, 573], [932, 578], [965, 576], [1004, 576], [1037, 576], [1074, 576], [1108, 575]],
        [[822, 612], [859, 610], [891, 612], [933, 613], [971, 612], [1001, 609], [1035, 608], [1075, 610], [1112, 609]],
        [[820, 647], [856, 643], [896, 648], [932, 647], [966, 645], [1001, 645], [1037, 646], [1072, 648], [1106, 648]],
        [[823, 692], [862, 690], [894, 691], [929, 691], [966, 691], [1000, 691], [1039, 696], [1074, 693], [1108, 693]]
    ]
    )

    Count := 0
    for i, Row in InventoryCells {
        for j, Cell in Row {
            X := Cell[1]
            Y := Cell[2]
            CurrentColor := GetPixel(X, Y)
            if (CurrentColor = TargetColor) {
                Count++
            }
        }
    }

    Send, {F11}
    Sleep, 400
    Send, {e}
    Sleep, 400

    ;MsgBox, % Count
    return Count
}


GetPixel(x, y) {
    PixelGetColor, Color, % x, % y
    return Color
}

ExecutePath(Path, mxOutputPath){
    Loop, % mxOutputPath.MaxIndex() {
        Element_C := Path[A_Index].C
        Input := mxOutputPath[A_Index][1]
        Output := mxOutputPath[A_Index][2]
        Clix := mxOutputPath[A_Index][3]
        ShiftClix := mxOutputPath[A_Index][4]

        debugMsg := ""
        ; debug them all in one line

        debugMsg .= "Element_C: " . Element_C . " | " . "Input: " . Input . " | " . "Output: " . Output . " | " . "Clix: " . Clix . " | " . "ShiftClix: " . ShiftClix . "`n---------------------"
        ;MyDebug(debugMsg)

        BuyItemV2(Element_C, ShiftClix, True, Clix)
    }
}

CalcInOutClix(mnInput, mnOutput, output){
    out := Ceil(output / mnOutput) * mnOutput
    in := Ceil(out / mnOutput) * mnInput

    mnInputInStack := Floor(64/mnInput) * mnInput

    shiftClix := Floor(in / mnInputInStack)
    clix := Ceil(Mod(in, mnInputInStack) // mnInput)

    return [in, out, clix, shiftClix]
}

CalcInOutClix2(mnInput, mnOutput, in){ ;Fix

    out := (in // mnInput) * mnOutput
    mnInputInStack := Floor(64/mnInput) * mnInput

    shiftClix := Floor(in / mnInputInStack)
    clix := Ceil(Mod(in, mnInputInStack) // mnInput)

    return [in, out, clix, shiftClix]
}

ReverseList(list) {
    reversedList := []
    Loop, % list.MaxIndex() {
        reversedList.Push(list.Pop())
    }
    return reversedList
}

ConvertPathToOutput(Path, Output){
    TempOutput := Output
    OutputList := []
    Loop, % Path.MaxIndex() {
        debugMsg := ""
        debugMsg .= "Path[A_Index].fv: " . Path[A_Index].fv . " | " . "Path[A_Index].tv: " . Path[A_Index].tv . " | " . "Path[A_Index].C: " . Path[A_Index].C . " | " . "Path[A_Index].S: " . Path[A_Index].S . "`n---------------------"
        ;MyDebug(debugMsg)
    }

    ; Need fix
    CopyPath := Path.Clone()
    while(CopyPath.MaxIndex() > 0){
        OutputList.Push(CalcInOutClix(CopyPath[CopyPath.MaxIndex()].fv, CopyPath[CopyPath.MaxIndex()].tv, TempOutput))
        TempOutput := OutputList[OutputList.MaxIndex()][1]
        CopyPath.Remove(CopyPath.MaxIndex())
    }

    CopyPath := Path.Clone()
    OutputList := ReverseList(OutputList)
    OutputListRet := OutputList.Clone()
    TempOutput := OutputList[1][2]
    ; loop on the output OutputList
    Loop, % OutputList.MaxIndex() {
        if(A_Index > 1){
            OutputListRet[A_Index] := CalcInOutClix2(CopyPath[A_Index].fv, CopyPath[A_Index].tv, TempOutput)
            TempOutput := OutputListRet[A_Index][2]
        }
    }

    return OutputListRet
}

GetMaxOutputInSpace(Path, TotalOutput, emptyCells){
    OutUnit := Path[Path.MaxIndex()].tv
    CheckOut := OutUnit

    MaxOutput := OutUnit
    ValidOutputPath := []

    while(MaxOutput <= TotalOutput){
        newPath := ConvertPathToOutput(Path, MaxOutput)

        for i, element in newPath {
            if(element[2] > emptyCells)
                return ValidOutputPath
        }

        ValidOutputPath := newPath
        MaxOutput += CheckOut
    }

    Return ValidOutputPath
}

GreedyPath(Path, TargetOutput){
    OutUnit := Path[Path.MaxIndex()].tv
    TotalOutput := Ceil(TargetOutput / OutUnit) * OutUnit

    while(TotalOutput > 0){
        emptyCells := (CountEmptyCells() - 2)
        mxOutputPath := GetMaxOutputInSpace(Path, TotalOutput, emptyCells * 64)

        if (mxOutputPath.Length == 0 || emptyCells < 0)
            break

        ExecutePath(Path, mxOutputPath)
        TotalOutput -= mxOutputPath[mxOutputPath.MaxIndex()][2]
    }
}
; Adding Comment to see git

;This is test Branch

BlcoksToNuggetsGreedy(amount := 64){
    GreedyPath(GoldenBlocksToGoldNugget_P, amount)
}

BlocksToCompRowGoldGreedy(amount := 64) {
    GreedyPath(GoldenBlocksToCompRowGold_P, amount)
}

BlocksToGoldenIngotGreedy(amount := 64){
    GreedyPath(GoldenBlocksToGoldenIgnot_P, amount)
}

BlocksToScraps(amount := 64){
    GreedyPath(NetherBlocksToScrap_P, amount)
}

BlocksToCompNetherBrick(amount := 64){
    GreedyPath(NetherBlocksToCompNethBrick_P, amount)
}

BlocksToNetherIngot(amount := 64){
    GreedyPath(NetherBlocksToNetherIngot_P, amount)
}

BlocksToShards(amount := 64){
    GreedyPath(AmethystBlockToShard_P, amount)
}

BlocksToBud(amount := 64){
    GreedyPath(AmethystBlockToBud_P, amount)
}

BlocksToCluster(amount := 64){
    GreedyPath(AmethystBlockToCluster_P, amount)
}

GoldenBlocksToGoldenBlocks(amount := 64){
    GreedyPath(GoldenBlocksToGoldenBlocks_P, 4 * amount)
}

GoldenBlocksToHarmingArrows(amount := 64){
    GreedyPath(GoldenBlocksToArrowHarming_P, amount)
}

PrepareAndBuyNumberOfDiamondPickAxe(num := 9){
    arr := ShowMaterialForFullPickAxe(num, True)
    funcs := [GoldenBlocksToGoldNugget_P, GoldenBlocksToCompRowGold_P, GoldenBlocksToGoldenIgnot_P, null, NetherBlocksToScrap_P, NetherBlocksToCompNethBrick_P, NetherBlocksToNetherIngot_P, null, AmethystBlockToShard_P, AmethystBlockToBud_P, AmethystBlockToCluster_P]

    loop, 3 {
        StoreEverythingInBox("BlackBox.bmp")
        PutStackInSlot1("goBaby.bmp", "BlackBox.bmp", Ceil(3*arr[4]//64))
        i := A_Index
        GreedyPath(funcs[i], arr[i])
    }

    StealEverythingInBox("BlackBox.bmp")
    BuyNumberOfDiamondPickAxe(num)

    loop, 3 {
        StoreEverythingInBox("BlackBox.bmp")
        PutStackInSlot1("NethierBlock.bmp", "BlackBox.bmp", Ceil(3*arr[8]/64))
        i := A_Index + 4
        GreedyPath(funcs[i], arr[i])
    }

    StealEverythingInBox("BlackBox.bmp")
    BuyNumberOfNetherArmors(num)

    loop, 3 {
        StoreEverythingInBox("BlackBox.bmp")
        PutStackInSlot1("EndBlock.bmp", "BlackBox.bmp", Ceil(3*arr[12]/64))
        i := A_Index + 8
        GreedyPath(funcs[i], arr[i])
    }

    StealEverythingInBox("BlackBox.bmp")
    BuyNumberOfEndPickAxe()(num)
}

PrepareAndBuyNumberOfFullArmors(num := 4)
{
    Gold := []
    Gold.Push({name: "GoldenNuggets", count: 76, mainInput: "GoldenBlocks", CeiledInput: CalcInputNeededToMakeAmount(2, 8, 64, num * 76)})
    Gold.Push({name: "CompressedRowGold", count: 24, mainInput: "GoldenBlocks", CeiledInput: CalcInputNeededToMakeAmount(2, 8, 64, num * 24)})
    Gold.Push({name: "Golden Ignot", count: 52, mainInput: "GoldenBlocks", CeiledInput: CalcInputNeededToMakeAmount(2, 2, 5.3333333, num * 52)})
    Gold.Push({name: "Golden Block", count: 32, mainInput: "GoldenBlocks", CeiledInput: CalcInputNeededToMakeAmount(1, 1, 1, num * 32)})

    stringOutput := "Material for " . num . " full armors" . "`n`n"
    stringOutput .= "Gold : " . "`n" . ShowMaterialsInStacks(Gold, num) . "------------------`n"
    FileAppend, %stringOutput%`n, LoggerFile.txt

    BlocksToGoldenIngotGreedy(Gold[3].CeiledInput.output)
    BlocksToCompRowGoldGreedy(Gold[2].CeiledInput.output)
    BlcoksToNuggetsGreedy(Gold[1].CeiledInput.output)

    BuyNumberOfDiamondArmors(num)

    Neither := []

    Neither.Push({name: "Scrap", count: 16, mainInput: "NetherBlocks", CeiledInput: CalcInputNeededToMakeAmount(2, 3, 53.76, num * 16)})
    Neither.Push({name: "CompBrick", count: 4, mainInput: "NetherBlocks", CeiledInput: CalcInputNeededToMakeAmount(2, 7, 18.66667, num * 4)})
    Neither.Push({name: "Ignot", count: 24, mainInput: "NetherBlocks", CeiledInput: CalcInputNeededToMakeAmount(2, 2, 18.66667, num * 24)})
    Neither.Push({name: "NetherBlocks", count: 12, mainInput: "NetherBlocks", CeiledInput: CalcInputNeededToMakeAmount(1, 1, 1, num * 12)})

    stringOutput := "Neither : " . "`n" . ShowMaterialsInStacks(Neither, num) . "------------------`n"
    FileAppend, %stringOutput%`n, LoggerFile.txt

    BlocksToNetherIngot(Neither[3].CeiledInput.output)
    BlocksToCompNetherBrick(Neither[2].CeiledInput.output)
    BlocksToScraps(Neither[1].CeiledInput.output)

    BuyNumberOfNetherArmors(num)

    End := []
    End.Push({name: "Shards", count: 16, mainInput: "EndBlocks", CeiledInput: CalcInputNeededToMakeAmount(2, 8, 32, num * 16)})
    End.Push({name: "Bud", count: 8, mainInput: "EndBlocks", CeiledInput: CalcInputNeededToMakeAmount(2, 8, 16, num * 8)})
    End.Push({name: "Clusters", count: 12, mainInput: "EndBlocks", CeiledInput: CalcInputNeededToMakeAmount(2, 1, 5.625, num * 12)})
    End.Push({name: "Amethyst", count: 16, mainInput: "EndBlocks", CeiledInput: CalcInputNeededToMakeAmount(1, 1, 1, num * 16)})

    stringOutput .= "End : " . "`n" . ShowMaterialsInStacks(End, num) . "------------------`n"
    FileAppend, %stringOutput%`n, LoggerFile.txt

    BlocksToCluster(End[3].CeiledInput.output)
    BlocksToBud(End[2].CeiledInput.output)
    BlocksToShards(End[1].CeiledInput.output)

    BuyNumberOfEndArmors(num)
}


Functions := []

;Functions.push("FarmGoldenBlocks")
;Functions.push("FarmNeitherBlocks")
;Functions.push("FarmEndBlocks")
;Functions.push("")
Functions.push("FarmGoldenBlocksV3")
Functions.push("FarmNeitherBlocksV2")
Functions.push("FarmEndBlocksV2")
Functions.push("")
;Functions.push("GoldenBlocksToGoldenApples")
;Functions.push("GoldenBlocksToGoldenApplesV2")
;Functions.push("GoldenBlocksToGoldenApplesV3")
;Functions.push("GoldenBlocksToGoldenApplesV4")
;Functions.push("ShuklerWithStackGoldToFullGoldenApples")
;Functions.push("")
;Functions.push("GoldenBlocksToGoldenIgnot")
;Functions.push("UseAllEnchanting")
;Functions.push("")
;Functions.push("FullSet")
;Functions.push("FulldiamondEveryThing")
;Functions.push("FullNeiterEveryThing")
;Functions.push("FulEndEveryThing")
;Functions.push("")

Functions.push("ShowMaterialForFullPickAxe")
Functions.push("ShowMaterialForFullSword")
Functions.push("ShowMaterialForFullArmors")
Functions.push("")
Functions.push("PrepareAllGoldMaterial")
Functions.push("PrepareAllNetherMaterial")
Functions.push("PrepareAllEndMaterial")
Functions.push("")
Functions.push("BuyNumberOfDiamondSword")
Functions.push("BuyNumberOfNetherSword")
Functions.push("BuyNumberOfEndSword")
Functions.push("")
Functions.push("BuyNumberOfDiamondPickAxe")
Functions.push("BuyNumberOfNetherPickAxe")
Functions.push("BuyNumberOfEndPickAxe")
Functions.push("")
Functions.push("BuyNumberOfDiamondArmors")
Functions.push("BuyNumberOfNetherArmors")
Functions.push("BuyNumberOfEndArmors")
;Functions.push("CountEmptyCells")
Functions.push("")
Functions.push("")
Functions.push("BlcoksToNuggetsGreedy")
Functions.push("BlocksToCompRowGoldGreedy")
Functions.push("BlocksToGoldenIngotGreedy")
Functions.push("GoldenBlocksToGoldenBlocks")
Functions.push("")
Functions.push("BlocksToScraps")
Functions.push("BlocksToCompNetherBrick")
Functions.push("BlocksToNetherIngot")
Functions.push("")
Functions.push("BlocksToShards")
Functions.push("BlocksToBud")
Functions.push("BlocksToCluster")
Functions.push("")
Functions.push("PrepareAndBuyNumberOfDiamondPickAxe")
Functions.push("")
Functions.push("GoldenBlocksToHarmingArrows")
Functions.push("PrepareAndBuyNumberOfFullArmors")

Gui, Add, Edit, vInputText w250
Gui, Add, ListView, vFunctionList w250 h400 r10 gRunSelectedFunction, Function
Gui +AlwaysOnTop

Loop, % Functions.Length()
    LV_Add("", Functions[A_Index])

return

RunSelectedFunction:
    if (A_GuiEvent = "DoubleClick") {
        Gui, Submit, NoHide
        SelectedRow := LV_GetNext(SelectedRow)
        GuiControlGet, OutputVar, , InputText
        RunFunction(Functions[SelectedRow], OutputVar)
    }
return

RunFunction(FuncName, InputVar:= "") {
    if (FuncName != "") {
        WinActivate, Minecraft
        Sleep, 1000
        FuncObj := Func(FuncName)
        if(InputVar != "")
            FuncObj.Call(InputVar)
        else
            FuncObj.Call()
    }
}

GuiClose:
    Gui, Hide
return


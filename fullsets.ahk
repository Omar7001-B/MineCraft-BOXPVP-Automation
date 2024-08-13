
FullSet(repeatCount := 1){
    BuyItemV2(GoldenBlocksToEmereld_C)
    BuyItemV2(EmereldToGoldenNuggets_C)
    BuyItemV2(EmereledToCompressedRowGold_C, 20)
    loop, 6 {
        BuyItemV2(CompressedRowGoldToRowGold_C3)
        BuyItemV2(RowGoldToGoldIgnot_C, 16)
    }


    BuyAllItems(LeatherArmors_C, 16)
    BuyAllItems(IronArmors_C, 12)
    BuyAllItems(DiamondArmors_C, 16)

    BuyAllItems(WoodenSword_C, 6)
    BuyAllItems(StoneSword_C, 6)
    BuyAllItems(IronSword_C, 1)
    BuyAllItems(DiamondSword_C, 6)

    BuyAllItems(WoodenPickAxe_C, 6)
    BuyAllItems(StonePickAxe_C, 6)
    BuyAllItems(IronPickAxe_C, 6)
    BuyAllItems(DiamondPickAxe_C, 6)

    BuyAllItems(WoodenAxe_C, 5)

    BuyItemV2(GoldenIngotToApples_C, 5)

    ; -------------------------------------- Neither ----------------------
    BuyItemV2(BlockToCryingObsidian_C11, 12, false)
    BuyItemV2(CryingObsidainToScraps_C, 8, false)
    BuyItemV2(CryingObsidianToBrick_C5, 12)

    BuyItemV2(BrickToObsidian_C5, 42, false)
    BuyItemV2(ObsidianToIgnot_C9, 20)

    BuyAllItems(NeitherArmor_C, 20)
    BuyAllItems(NeitherSword_C, 6)
    BuyAllItems(NeitherPickAxe_C, 6)

    ; -------------------------------------- End ----------------------
    BuyItemV2(BlockToBlackeGlass_C11, 6, false)
    BuyItemV2(BlackGlassToShard_C, 4, false)
    BuyItemV2(BlackGlassToBud_C5, 10)
    BuyItemV2(BudToMagnetaGlass_C1, 16, false)
    BuyItemV2(MagnetaClassToClusters_C, 10)

    BuyAllItems(EndArmor_C)
    BuyAllItems(EndSword_C, 6)
    BuyAllItems(EndPickAxe_C, 6 )

    BuyAllItems(Elytra_C, 10)
    BuyItemV2(Arrows_C, 1, false)
    BuyItemV2(BowPowerV_C, 1, false)
    BuyItemV2(Shears_C, 1, false)
    BuyItemV2(Rockets2_C, 5, false)
    BuyItemV2(BlueShulker_C, 1, false)
    BuyItemV2(CowWeb_C, 4)
}

FulldiamondEveryThing(repeatCount := 1){
    loop, %repeatCount% {
        BuyItemV2(GoldenBlocksToEmereld_C)
        BuyItemV2(EmereldToGoldenNuggets_C)
        BuyItemV2(EmereledToCompressedRowGold_C, 20)
        loop, 6 {
            BuyItemV2(CompressedRowGoldToRowGold_C3)
            BuyItemV2(RowGoldToGoldIgnot_C, 16)
        }


        BuyAllItems(LeatherArmors_C, 16)
        BuyAllItems(IronArmors_C, 12)
        BuyAllItems(DiamondArmors_C, 16)

        BuyAllItems(WoodenSword_C, 6)
        BuyAllItems(StoneSword_C, 6)
        BuyAllItems(IronSword_C, 1)
        BuyAllItems(DiamondSword_C, 6)

        BuyAllItems(WoodenPickAxe_C, 6)
        BuyAllItems(StonePickAxe_C, 6)
        BuyAllItems(IronPickAxe_C, 6)
        BuyAllItems(DiamondPickAxe_C, 6)

        BuyAllItems(WoodenAxe_C, 5)
        
        BuyAllItems(Elytra_C, 1 0)

        BuyItemV2(Arrows_C, 1, false)
        BuyItemV2(BowPowerV_C, 1, false)
        BuyItemV2(Shears_C, 1, false)
        BuyItemV2(Rockets2_C, 5, false)
        BuyItemV2(Rockets1_C, 2)

        BuyItemV2(BlueShulker_C, 1, false)

        BuyItemV2(Totem_C, 8, false)
        BuyItemV2(StrengthPotion_C, 8, false)
        BuyItemV2(CowWeb_C, 4)

        BuyItemV2(GoldenIngotToApples_C, 5)
    }
}



FullNeiterEveryThing(repeatCount := 1){
    loop, %repeatCount% {
        BuyItemV2(BlockToCryingObsidian_C11, 12, false)
        BuyItemV2(CryingObsidainToScraps_C, 8, false)
        BuyItemV2(CryingObsidianToBrick_C5, 12)
        BuyItemV2(BrickToObsidian_C5, 42, false)
        BuyItemV2(ObsidianToIgnot_C9, 20)

        BuyAllItems(NeitherArmor_C, 20)
        BuyAllItems(NeitherSword_C, 6)
        BuyAllItems(NeitherPickAxe_C, 6)
    }
}


FulEndEveryThing(repeatCount := 1){
    loop, %repeatCount% {
        BuyItemV2(BlockToBlackeGlass_C11, 6, false)
        BuyItemV2(BlackGlassToShard_C, 4, false)
        BuyItemV2(BlackGlassToBud_C5, 10)

        BuyItemV2(BudToMagnetaGlass_C1, 16, false)
        BuyItemV2(MagnetaClassToClusters_C, 10)

        BuyAllItems(EndArmor_C)
        BuyAllItems(EndSword_C, 6)
        BuyAllItems(EndPickAxe_C, 6)
    }
}




BuyStrengthPotion(repeatCount := 1){
    loop, %repeatCount% {
        BuyItemV2(StrengthPotion_C)
        PutItemInBox("Strength.bmp", "BrownBox.bmp", 8)
        Sleep, 200
    }
}

BuyInvisPotion(repeatCount := 1){
    loop, %repeatCount% {
        BuyItemV2(InvisPotion_C, 8, false)
        PutItemInBox("InvisPotion.bmp", "BrownBox.bmp", 8)
        Sleep, 200
    }
}

BuyCoweb(repeatCount := 1){
    loop, %repeatCount% {
        BuyItemV2(CowWeb_C, 2)
        PutItemInBox("Coweb.bmp", "BrownBox.bmp", 1)
        Sleep, 200
    }
}

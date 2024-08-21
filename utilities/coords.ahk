global ItemsShop_C := [[777,425], [782,465], [764,507], [775,554], [773,589], [770,626], [767,666]]
global MainCompressors_C := [[1065, 400]]
global Compressor_C := M17(MainCompressors_C, [920,404])
global Decompressor_C := M17(MainCompressors_C, [994,405])

global Armors_C := [[888, 405]]
global LeatherArmors_C := M17(Armors_C, [924, 441])
global IronArmors_C := M17(Armors_C, [956, 441])
global DiamondArmors_C := M17(Armors_C, [996, 441])
; -------------------- Swords --------------------
global Swords_C := [[850, 400]]
global WoodenSword_C := M17(Swords_C , [885, 400])
global StoneSword_C := M17(Swords_C, [925, 400])
global IronSword_C := M17(Swords_C, [960, 400])
global DiamondSword_C := M17(Swords_C, [995, 400])
global NeitherSword_C := M17(Swords_C, [1032, 401])
; -------------------- PickAxes --------------------
global PickAxes_C := [[925, 400]]
global WoodenPickAxe_C := M17(PickAxes_C, [885, 400])
global StonePickAxe_C := M17(PickAxes_C, [925, 400])
global IronPickAxe_C := M17(PickAxes_C, [960, 400])
global DiamondPickAxe_C := M17(PickAxes_C, [995, 400])
global NeitherPickAxe_C := M17(PickAxes_C, [1032, 401])
; -------------------- Axes --------------------
global Axes_C := [[998,400]]
global WoodenAxe_C := M17(Axes_C, [880, 400])
global StoneAxe_C := M17(Axes_C, [925, 400])
global IronAxe_C := M17(Axes_C, [955, 400])
global DiamondAxe_C := M17(Axes_C, [990, 400])
global NeitherAxe_C := M17(Axes_C, [1030, 400])

/*

global NeitherShop_C := [[956, 478]]
global NeitherMainCompressor_C := M17(NeitherShop_C, [1028, 407])
global NeitherCompressor_C := M17(NeitherMainCompressor_C, [922, 440])
global NeitherDecompressor_C := M17(NeitherMainCompressor_C, [998, 437])

global NeitherSword_C := M17(NeitherShop_C, [888, 401])
global NeitherArmor_C := M17(NeitherShop_C, [921, 401])

*/
;
global TakeItems_C := [1139, 461]
global StoreItems_C := [1089, 408]
global StealItems_C := [963, 409]
global DropItems_C := [1321, 462]

; -------------------- Misc --------------------
global Misc_C := [[1030,400]]
global Food_C := M17(Misc_C, [850,400])
global PVP_Utility_C := M17(Misc_C, [890,400])
global Shulkers_C := M17(Misc_C, [920,400])

global Potions_C := M17(Misc_C, [990,400])
global Elytra_C := M17(Misc_C, [1030,400])
global Blocks_C := M17(Misc_C, [1065,400])

; -------------------- Shulkers --------------------
global OrangeShulker_C := { C: Shulkers_C, S: 3 }
global YellowShulker_C := { C: Shulkers_C, S: 6 }
global RedShulker_C := { C: Shulkers_C, S: 9 }
global BrownShulker_C := { C: Shulkers_C, S: 13 }
global BlackShulker_C := { C: Shulkers_C, S: 16 }

; -------------------- End --------------------
/*
global EndShop_C := [[994, 475]]
global EndMainCompressor_C := M17(EndShop_C, [1031, 407])
global EndCompressor_C := M17(EndMainCompressor_C, [922, 440])
global EndDecompressor_C := M17(EndMainCompressor_C, [998, 437])
global EndSword_C := M17(EndShop_C, [888, 401])
global EndPickAxe_C := M17(EndShop_C, [962,403])
global EndArmor_C := M17(EndShop_C, [926,399])
global BowPowerV_C := { C: PVP_Utility_C, S: 12 }
global Arrows_C := { C: PVP_Utility_C, S: 14 }
global HarmingArrows_C := { C: PVP_Utility_C, S: 17 }
global Shears_C := { C: PVP_Utility_C, S: 20 }
global CowWeb_C := { C: PVP_Utility_C, S: 21 }
global Totem_C := { C: PVP_Utility_C, S: 22 }
global StrengthPotion_C := { C: Potions_C, S: 6 }
global InvisPotion_C := { C: Potions_C, S: 1 }
global Rockets1_C := { C: Elytra_C, S: 1 }
global Rockets2_C := { C: Elytra_C, S: 2 }
global BlueShulker_C := { C: Shulkers_C, S: 7 }
*/

; -------------------- Compressor --------------------
global CobbleStoneToNuggets_C := { C: Compressor_C, S: 1 }
global CoalToNuggets_C := { C: Compressor_C, S: 2 }
global IronToNuggets_C := { C: Compressor_C, S: 3 }
global DiamondToGoldNuggets_C := { C: Compressor_C, S: 4 }
global EmereldToGoldenNuggets_C := { C: Compressor_C, S: 5 }
; ----- 6
global IronToCompressedRowGold_C := { C: Compressor_C, S: 7 }
global DiamondToCompressedRowGold_C5 := { C: Compressor_C , S: 8 }
global EmereledToCompressedRowGold_C := { C: Compressor_C, S: 9 }
; ----- 10
global IronToGoldIgnot_C := { C: Compressor_C, S: 11 }
global DiamondToGoldIgnot_C := { C: Compressor_C, S: 12 }
global EmereledToGoldIgnot_C := { C: Compressor_C, S: 13 }
; ----- 14
global DiamondToGoldenBlock_C := { C: Compressor_C, S: 15 }
global EmereledToGoldenBlock_C := { C: Compressor_C, S: 16 }

/*
global RowGoldToGoldIgnot_C := { C: Compressor_C, S: 16 }
global RowIronToGoldIgnot_C := { C: Compressor_C, S: 17 }
global RowGoldtoGoldenNuggets_C := { C: Compressor_C, S: 4 }
global RowGoldToCompressedRowGold_C3 := { C: Compressor_C, S: 10 }
*/

; -------------------- Decompressor --------------------
global GoldenNuggetsToCobbleStone_C = { C: Decompressor_C, S: 1 }
global GoldenNuggetsToCoal_C := { C: Decompressor_C, S: 2 }
global GoldenNuggetsToIron_C := { C: Decompressor_C, S: 3 }
global GoldenNuggetsToDiamond_C := { C: Decompressor_C, S: 4 }
global GoldenNuggetsToEmereld_C := { C: Decompressor_C, S: 5 }
; ----- 6
global CompressedRowGoldToIron_C := { C: Decompressor_C, S: 7 }
global CompressedRowGoldToDiamond_C := { C: Decompressor_C, S: 8 }
global CompressedRowGoldToEmereld_C := { C: Decompressor_C, S: 9 }
; ----- 10
global GoldenIgnotToIron_C := { C: Decompressor_C, S: 11 }
global GoldenIgnotToDiamond_C := { C: Decompressor_C, S: 12 }
global GoldenIgnotToEmereld_C := { C: Decompressor_C, S: 13 }
; ----- 14
global GoldenBlocksToDiamond_C := { C: Decompressor_C, S: 15 }
global GoldenBlocksToEmereld_C := { C: Decompressor_C, S: 16 }

/*
global GoldNuggetsToRowGold_C := { C: Decompressor_C, S: 4 }
global CompressedRowGoldToRowGold_C3 := { C: Decompressor_C, S: 10}
global CompressedRowGoldToRowIron_C3 := { C: Decompressor_C, S: 11}
global CompressedRowGoldToDiamond_C5 := { C: Decompressor_C, S: 12}

global IgnotToObsidin_C := { x: PVP_Utility_C, y: 1}
global GoldenIngotToApples_C := { C: Food_C, S: 4 }
*/

; -------------------- Neither Compressor --------------------
/*
global AncorToScrap_C := { C: NeitherCompressor_C, S: 5 }
global AncroToBrick_C4 := { C: NeitherCompressor_C, S: 11 }
global DebrisToIgnot_C8 := { C: NeitherCompressor_C , S: 15 }
global DebrisToScrap_C := { C: NeitherCompressor_C , S: 3 }
global CryingObsidianToBrick_C5 := { C: NeitherCompressor_C, S: 12 }
global CryingObsidainToScraps_C := { C: NeitherCompressor_C, S: 6 }
Global ObsidianToScraps_C := { C: NeitherCompressor_C, S: 4 }
Global ObsidianToBricks_C3 := { C: NeitherCompressor_C, S: 10 }
Global ObsidianToIgnot_C9 := { C: NeitherCompressor_C, S: 16 }
global AnchorToBlock_C10 := { C: NeitherCompressor_C, S: 17 }
global CryingObsidianToBlock_C := { C: NeitherCompressor_C, S: 18 }
*/

; -------------------- Neither Decompressor --------------------
/*
global BrickToDebris_C2 := { C: NeitherDecompressor_C, S: 9 }
global BrickToObsidian_C5 := { C: NeitherDecompressor_C, S: 10 }
global BrickToAnchor_C4 := { C: NeitherDecompressor_C, S: 11}
global BlockToAnchor_C10 := { C: NeitherDecompressor_C, S: 17 }
global BlockToCryingObsidian_C11 := { C: NeitherDecompressor_C, S: 18 }
global BrickToAnchor_C4 := { C: NeitherDecompressor_C, S: 11 }
global ScrapToAnchor_C := { C: NeitherDecompressor_C, S: 5 }
global ScrapToCryingObsidian_C := { C: NeitherDecompressor_C, S: 6 }
*/
; -------------------- End Compressor --------------------
/*
global PurpleGlassToShard_C := { C: EndCompressor_C, S: 5 }
global BlackGlassToShard_C := { C: EndCompressor_C, S: 6 }
Global PurpleGlassToBud_C4 := { C: EndCompressor_C, S: 11}
Global BlackGlassToBud_C5 := { C: EndCompressor_C, S: 12}
Global StoneBricksToClusters_C7 := { C: EndCompressor_C, S: 14}
Global MagnetaClassToClusters_C := { C: EndCompressor_C, S: 16}
Global PurpleGlassToBlock_C10 := { C: EndCompressor_C, S: 17}
*/

; -------------------- End Decompressor --------------------
/*
Global BlockToPurpleGlass_C10 := { C: EndDecompressor_C, S: 17}
Global BlockToBlackeGlass_C11 := { C: EndDecompressor_C, S: 18}
Global ShardsToStoneBricks_C := { C: EndDecompressor_C, S: 2}
Global ShardsToPurpurGlass_C := { C: EndDecompressor_C, S: 5}
Global ShardsToMagnetaGlass_C := { C: EndDecompressor_C, S: 4}
Global BudToStoneBricks_C1 := { C: EndDecompressor_C, S: 8}
Global BudToMagnetaGlass_C1 := { C: EndDecompressor_C, S: 10}
Global BudToPurpleGlass_4 := { C: EndDecompressor_C, S: 11}
Global TestItem := {C: [[1070, 403], [921, 437], [766,549]], S: 0}
*/
; -------------------- Imgs --------------------
Global BrownBox_Img := "BrownBox.bmp"
Global BlackBox_Img := "BlackBox.bmp"

Global GoldenBlock_Img := "goBaby.bmp"
Global NethierBlock_Img := "NethierBlock.bmp"
Global EndBlock_Img := "EndBlock.bmp"

Global Apples_Img := "apples2.bmp"

Global Coweb_Img := "Coweb.bmp"
Global AfkShards_Img := "afkShard.bmp"
Global InvisPotion_Img := "InvisPotion.bmp"
Global StrengthPotion_Img := "Strength.bmp"

M17(coords, coord) {
    tmp := coords.Clone()
    tmp.Push(coord)
    return tmp
}

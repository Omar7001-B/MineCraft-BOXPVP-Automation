;--------------------------------------------------

;Conversion from 2 GoldenBlocks --> 8 GoldNugget

;Factor = 64
;Size = 2, F/S = 32

;GoldenBlocks 2 -> Emereld 32
;Emereld 2 -> GoldNugget 8

Global GoldenBlocksToGoldNugget_P :=
(Join
[
{C: GoldenBlocksToEmereld_C , fv: 2, tv: 32},
{C: EmereldToGoldenNuggets_C , fv: 2, tv: 8}
]
)

;--------------------------------------------------
;--------------------------------------------------

;Conversion from 2 GoldenBlocks --> 8 CompRowGold

;Factor = 10.6667
;Size = 2, F/S = 5.33333

;GoldenBlocks 2 -> Emereld 32
;Emereld 12 -> CompRowGold 8

Global GoldenBlocksToCompRowGold_P :=
(Join
[
{C: GoldenBlocksToEmereld_C , fv: 2, tv: 32},
{C: EmereledToCompressedRowGold_C , fv: 12, tv: 8}
]
)

;--------------------------------------------------
;--------------------------------------------------

;Conversion from 2 GoldenBlocks --> 2 GoldenIngot

;Factor = 5.33333
;Size = 4, F/S = 1.33333

;GoldenBlocks 2 -> Emereld 32
;Emereld 12 -> CompRowGold 8
;CompRowGold 2 -> RowGold 32
;RowGold 64 -> GoldenIngot 2

Global GoldenBlocksToGoldenIgnot_P :=
(Join
[
    {C: GoldenBlocksToEmereld_C, fv: 2, tv: 32},
    {C: EmereledToCompressedRowGold_C, fv: 12, tv: 8},
    {C: CompressedRowGoldToRowGold_C3, fv: 2, tv: 32},
{C: RowGoldToGoldIgnot_C, fv: 64, tv: 2}
]
)

;--------------------------------------------------

;Conversion from 2 GoldenBlocks --> 2 GoldenBlocks

;Factor = 1.33333
;Size = 4, F/S = 0.333333

;GoldenBlocks 2 -> Emereld 32
;Emereld 12 -> CompRowGold 8
;CompRowGold 6 -> Diamond 12
;Diamond 32 -> GoldenBlocks 2

Global GoldenBlocksToGoldenBlocks_P :=
(Join
[
{C: GoldenBlocksToEmereld_C , fv: 2, tv: 32},
{C: EmereledToCompressedRowGold_C , fv: 12, tv: 8},
{C: CompressedRowGoldToDiamond_C5 , fv: 6, tv: 12},
{C: DiamondToGoldenBlock_C , fv: 32, tv: 2}
]
)
;--------------------------------------------------

;--------------------------------------------------

; Nether

;--------------------------------------------------

;Conversion from 2 NetherBlocks --> 3 Scrap

;Factor = 53.76
;Size = 4, F/S = 28

;NetherBlocks 2 -> CryingObsidian 64
;CryingObsidian 12 -> CompNethBrick 7
;CompNethBrick 1 -> AncientDebris 32
;AncientDebris 16 -> Scrap 3

Global NetherBlocksToScrap_P :=
(Join
[
{C: BlockToCryingObsidian_C11 , fv: 2, tv: 64},
{C: CryingObsidianToBrick_C5 , fv: 25, tv: 7},
{C: BrickToDebris_C2 , fv: 1, tv: 32},
{C: DebrisToScrap_C , fv: 16, tv: 3}
]
)
;--------------------------------------------------

;Conversion from 2 NetherBlocks --> 7 CompNethBrick

;Factor = 18.6667
;Size = 2, F/S = 9.33333

;NetherBlocks 2 -> CryingObsidian 64
;CryingObsidian 12 -> CompNethBrick 7

Global NetherBlocksToCompNethBrick_P :=
(Join
[
{C: BlockToCryingObsidian_C11 , fv: 2, tv: 64},
{C: CryingObsidianToBrick_C5 , fv: 25, tv: 7}
]
)
;--------------------------------------------------

;--------------------------------------------------

;Conversion from 2 NetherBlocks --> 3 NetherIngot

;Factor = 4.48
;Size = 4, F/S = 1.12

;NetherBlocks 2 -> CryingObsidian 64
;CryingObsidian 25 -> CompNethBrick 7
;CompNethBrick 3 -> Obsidian 32
;Obsidian 64 -> NetherIngot 3

Global NetherBlocksToNetherIngot_P :=
(Join
[
{C: BlockToCryingObsidian_C11 , fv: 2, tv: 64},
{C: CryingObsidianToBrick_C5 , fv: 25, tv: 7},
{C: BrickToObsidian_C5 , fv: 3, tv: 32},
{C: ObsidianToIgnot_C9 , fv: 64, tv: 3}
]
)

;--------------------------------------------------

; END

;--------------------------------------------------

;Conversion from 2 AmethystBlock --> 8 Shard

;Factor = 32
;Size = 2, F/S = 16

;AmethystBlock 2 -> BlackGlass 64
;BlackGlass 8 -> Shard 8

Global AmethystBlockToShard_P :=
(Join
[
{C: BlockToBlackeGlass_C11 , fv: 2, tv: 64},
{C: BlackGlassToShard_C , fv: 8, tv: 8}
]
)
;--------------------------------------------------

;--------------------------------------------------

;Conversion from 2 AmethystBlock --> 8 Bud

;Factor = 16
;Size = 2, F/S = 8

;AmethystBlock 2 -> BlackGlass 64
;BlackGlass 16 -> Bud 8

Global AmethystBlockToBud_P :=
(Join
[
{C: BlockToBlackeGlass_C11 , fv: 2, tv: 64},
{C: BlackGlassToBud_C5 , fv: 16, tv: 8}
]
)
;--------------------------------------------------

;---------------------------------------------------------------------------------------

Global AmethystBlockToCluster_P :=
(Join
[
{C: BlockToBlackeGlass_C11 , fv: 2, tv: 64},
{C: BlackGlassToShard_C , fv: 8, tv: 8},
{C: ShardsToMagnetaGlass_C , fv: 5, tv: 12},
{C: MagnetaClassToClusters_C , fv: 64, tv: 3}
]
)
;--------------------------------------------------

;Conversion from 2 GoldenBlocks --> 1 ArrowHarming

;Factor = 2.66667
;Size = 5, F/S = 0.533333

;GoldenBlocks 2 -> Emereld 32
;Emereld 12 -> CompRowGold 8
;CompRowGold 2 -> RowGold 32
;RowGold 64 -> GoldenIngot 2
;GoldenIngot 2 -> ArrowHarming 1

Global GoldenBlocksToArrowHarming_P :=
(Join
[
{C: GoldenBlocksToEmereld_C , fv: 2, tv: 32},
{C: EmereledToCompressedRowGold_C , fv: 12, tv: 8},
{C: CompressedRowGoldToRowGold_C3 , fv: 2, tv: 32},
{C: RowGoldToGoldIgnot_C , fv: 64, tv: 2},
{C: HarmingArrows_C , fv: 2, tv: 1}
]
)
;--------------------------------------------------

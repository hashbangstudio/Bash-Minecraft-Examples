#!/bin/bash


# Only source block if hasn't already been sourced
# can't redeclare readonly variables
if [[ $BLOCK_HAS_BEEN_SOURCED -ne 1 ]]
then
    declare BLOCK_HAS_BEEN_SOURCED=1
    declare -r BLOCK_ID=0
    declare -r BLOCK_DATA=1
    declare -r AIR=(0 0)
    declare -r STONE=(1 0)
    declare -r GRASS=(2 0)
    declare -r DIRT=(3 0)
    declare -r COBBLESTONE=(4 0)
    declare -r WOOD_PLANKS=(5 0)
    declare -r SAPLING=(6 0)
    declare -r BEDROCK=(7 0)
    declare -r WATER_FLOWING=(8 0)
    declare -r WATER=$WATER_FLOWING
    declare -r WATER_STATIONARY=(9 0)
    declare -r LAVA_FLOWING=(10 0)
    declare -r LAVA=$LAVA_FLOWING
    declare -r LAVA_STATIONARY=(11 0)
    declare -r SAND=(12 0)
    declare -r GRAVEL=(13 0)
    declare -r GOLD_ORE=(14 0)
    declare -r IRON_ORE=(15 0)
    declare -r COAL_ORE=(16 0)
    declare -r WOOD=(17 0)
    declare -r LEAVES=(18 0)
    declare -r GLASS=(20 0)
    declare -r LAPIS_LAZULI_ORE=(21 0)
    declare -r LAPIS_LAZULI_BLOCK=(22 0)
    declare -r SANDSTONE=(24 0)
    declare -r BED=(26 0)
    declare -r COBWEB=(30 0)
    declare -r GRASS_TALL=(31 0)
    declare -r WOOL=(35 0)
    declare -r FLOWER_YELLOW=(37 0)
    declare -r FLOWER_CYAN=(38 0)
    declare -r MUSHROOM_BROWN=(39 0)
    declare -r MUSHROOM_RED=(40 0)
    declare -r GOLD_BLOCK=(41 0)
    declare -r IRON_BLOCK=(42 0)
    declare -r STONE_SLAB_DOUBLE=(43 0)
    declare -r STONE_SLAB=(44 0)
    declare -r BRICK_BLOCK=(45 0)
    declare -r TNT=(46 0)
    declare -r BOOKSHELF=(47 0)
    declare -r MOSS_STONE=(48 0)
    declare -r OBSIDIAN=(49 0)
    declare -r TORCH=(50 0)
    declare -r FIRE=(51 0)
    declare -r STAIRS_WOOD=(53 0)
    declare -r CHEST=(54 0)
    declare -r DIAMOND_ORE=(56 0)
    declare -r DIAMOND_BLOCK=(57 0)
    declare -r CRAFTING_TABLE=(58 0)
    declare -r FARMLAND=(60 0)
    declare -r FURNACE_INACTIVE=(61 0)
    declare -r FURNACE_ACTIVE=(62 0)
    declare -r DOOR_WOOD=(64 0)
    declare -r LADDER=(65 0)
    declare -r STAIRS_COBBLESTONE=(67 0)
    declare -r DOOR_IRON=(71 0)
    declare -r REDSTONE_ORE=(73 0)
    declare -r SNOW=(78 0)
    declare -r ICE=(79 0)
    declare -r SNOW_BLOCK=(80 0)
    declare -r CACTUS=(81 0)
    declare -r CLAY=(82 0)
    declare -r SUGAR_CANE=(83 0)
    declare -r FENCE=(85 0)
    declare -r GLOWSTONE_BLOCK=(89 0)
    declare -r BEDROCK_INVISIBLE=(95 0)
    declare -r STONE_BRICK=(98 0)
    declare -r GLASS_PANE=(102 0)
    declare -r MELON=(103 0)
    declare -r FENCE_GATE=(107 0)
    declare -r GLOWING_OBSIDIAN=(246 0)
    declare -r NETHER_REACTOR_CORE=(247 0)

fi


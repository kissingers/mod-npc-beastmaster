-- ######################################################--
-- BEASTMASTER - 601026
-- ######################################################--
SET
@Entry      := 601026,
@Model      := 26314, -- Northrend Worgen White
@Name       := "史叔刚",
@Title      := "万兽山庄庄主",
@Icon       := "Speak",
@GossipMenu := 60102,
@MinLevel   := 80,
@MaxLevel   := 80,
@Faction    := 35,
@NPCFlag    := 4194433,
@Scale      := 1.0,
@Rank       := 0,
@Type       := 7,
@TypeFlags  := 0,
@FlagsExtra := 2,
@AIName     := "SmartAI",
@Script     := "BeastMaster";

-- NPC
DELETE FROM `creature_template` WHERE `entry` = @Entry;
INSERT INTO `creature_template` (`entry`, `name`, `subname`, `IconName`, `gossip_menu_id`, `minlevel`, `maxlevel`, `faction`, `npcflag`, `speed_walk`, `speed_run`, `scale`, `rank`, `unit_class`, `unit_flags`, `type`, `type_flags`, `RegenHealth`, `flags_extra`, `AiName`, `ScriptName`) VALUES
(@Entry, @Name, @Title, @Icon, @GossipMenu, @MinLevel, @MaxLevel, @Faction, @NPCFlag, 1, 1.14286, 1, @Rank, 1, 2, @Type, @TypeFlags, 1, @FlagsExtra, @AIName, @Script);

DELETE FROM `creature_template_model` WHERE `CreatureID` = @Entry;
INSERT INTO `creature_template_model` (`CreatureID`, `Idx`, `CreatureDisplayID`, `DisplayScale`, `Probability`) VALUES
(@Entry, 0, @Model, @Scale, 1);

-- NPC EQUIPPED
DELETE FROM `creature_equip_template` WHERE `CreatureID`=@Entry AND `ID`=1;
INSERT INTO `creature_equip_template` VALUES (@Entry, 1, 2196, 1906, 0, 18019); -- Haunch of Meat, Torch

-- NPC TEXT
DELETE FROM `npc_text` WHERE `ID` IN (601026, 601027);
INSERT INTO `npc_text` (`ID`, `text0_0`) VALUES 
(601026, '欢迎欢迎，$N.$b$b如果你正在寻找一个值得信赖的伴侣来旅行，那么你已经来到了正确的地方。我可以为你提供各种驯服的宠物供你选择。我还可以为你提供食物，这样你就可以好好照顾你的新朋友。'),
(601027, '你对什么样的宠物感兴趣？');

-- GOSSIP MENU
DELETE FROM `gossip_menu` WHERE `MenuID` = 60102;
INSERT INTO `gossip_menu` VALUES (60102, 68); -- Dummy gossip menu to prevent errors. Not used.

-- NPC ITEMS
DELETE FROM npc_vendor WHERE entry = @Entry;
INSERT INTO npc_vendor (entry, item) VALUES 
-- MEAT
(@Entry,35953), -- (75) -- Mead Blasted Caribou 
(@Entry,33454), -- (65) -- Salted Venison 
(@Entry,27854), -- (55) -- Smoked Talbuk Venison
(@Entry,8952),  -- (45) -- Roasted Quail 
(@Entry,4599),  -- (35) -- Cured Ham Steak  
(@Entry,3771),  -- (25) -- Wild Hog Shank 
(@Entry,3770),  -- (15) -- Mutton Chop
(@Entry,2287),  -- (5)  -- Haunch of Meat
(@Entry,117),   -- (1)  -- Tough Jerky
-- FUNGUS
(@Entry,35947), -- (75) -- Sparkling Frostcap
(@Entry,33452), -- (65) -- Honey-Spiced Lichen 
(@Entry,27859), -- (55) -- Zangar Caps
(@Entry,8948),  -- (45) -- Dried King Bolete
(@Entry,4608),  -- (35) -- Raw Black Truffle 
(@Entry,4607),  -- (25) -- Delicious Cave Mold
(@Entry,4606),  -- (15) -- Spongy Morel
(@Entry,4605),  -- (5)  -- Red-Speckled Mushroom 
(@Entry,4604),  -- (1)  -- Forest Mushroom Cap
-- BREAD
(@Entry,35950), -- (75) -- Sweet Potato Bread
(@Entry,33449), -- (65) -- Crusty Flatbread
(@Entry,27855), -- (55) -- Mag'har Grainbread
(@Entry,8950),  -- (45) -- Homemade Cherry Pie
(@Entry,4601),  -- (35) -- Soft Banana Bread
(@Entry,4544),  -- (25) -- Mulgore Spice Bread
(@Entry,4542),  -- (15) -- Moist Cornbread
(@Entry,4541),  -- (5)  -- Freshly Baked Bread
(@Entry,4540),  -- (1)  -- Tough Hunk of Bread
-- FRUIT
(@Entry,35948), -- (75) -- Savory Snowplum
(@Entry,35949), -- (65) -- Tundra Berries
(@Entry,27856), -- (55) -- Sklethyl Berries
(@Entry,8953),  -- (45) -- Deep Fried Plantains
(@Entry,4602),  -- (35) -- Moon Harvest Pumpkin
(@Entry,4539),  -- (25) -- Goldenbark Apple
(@Entry,4538),  -- (15) -- Snapvine Watermelon
(@Entry,4537),  -- (5)  -- Tel'Abim Banana
(@Entry,4536),  -- (1)  -- Shiny Red Apple
-- FISH
(@Entry,35951), -- (75) -- Poached Emperor Salmon
(@Entry,33451), -- (65) -- Filet of Icefin
(@Entry,27858), -- (55) -- Sunspring Carp
(@Entry,8957),  -- (45) -- Spinefin Halibut
(@Entry,21552), -- (35) -- Striped Yellowtail
(@Entry,4594),  -- (25) -- Rockscale Cod
(@Entry,4593),  -- (15) -- Bristle Whisker Catfish
(@Entry,4592),  -- (5)  -- Longjaw Mud Snapper
(@Entry,787),   -- (1)  -- Slitherskin Mackeral
-- CHEESE
(@Entry,35952), -- (75) -- Briny Hardcheese
(@Entry,33443), -- (65) -- Sour Goat Cheese
(@Entry,27857), -- (55) -- Gradar Sharp
(@Entry,8932),  -- (45) -- Alterac Swiss
(@Entry,3927),  -- (35) -- Fine Aged Chedder
(@Entry,1707),  -- (25) -- Stormwind Brie
(@Entry,422),   -- (15) -- Dwarven Mild
(@Entry,414),   -- (5)  -- Dalaran Sharp
(@Entry,2070),  -- (1)  -- Darnassian Bleu
-- BUFF
(@Entry,33875), -- Kibler's Bits
-- RARE
(@Entry,21024); -- Chimaerok Tenderloin

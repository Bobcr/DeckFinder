import Foundation

extension DataSet.Cards.Children {
    var variableStats: [VariableStats] {
        switch self {
        case .rascalBoy: return [
            VariableStats(hitpoints: 715, damage: 52),
            VariableStats(hitpoints: 786, damage: 57),
            VariableStats(hitpoints: 865, damage: 62),
            VariableStats(hitpoints: 950, damage: 69),
            VariableStats(hitpoints: 1043, damage: 75),
            VariableStats(hitpoints: 1144, damage: 83),
            VariableStats(hitpoints: 1258, damage: 91),
            VariableStats(hitpoints: 1379, damage: 100),
            VariableStats(hitpoints: 1515, damage: 110),
            VariableStats(hitpoints: 1665, damage: 121),
            VariableStats(hitpoints: 1830, damage: 133),
            VariableStats(hitpoints: 2009, damage: 146),
            VariableStats(hitpoints: 2209, damage: 160)]
        case .rascalGirls: return [
            VariableStats(hitpoints: 102, damagePerSecond: 34),
            VariableStats(hitpoints: 112, damagePerSecond: 38),
            VariableStats(hitpoints: 123, damagePerSecond: 41),
            VariableStats(hitpoints: 135, damagePerSecond: 46),
            VariableStats(hitpoints: 148, damagePerSecond: 50),
            VariableStats(hitpoints: 163, damagePerSecond: 55),
            VariableStats(hitpoints: 179, damagePerSecond: 60),
            VariableStats(hitpoints: 196, damagePerSecond: 66),
            VariableStats(hitpoints: 216, damagePerSecond: 73),
            VariableStats(hitpoints: 237, damagePerSecond: 80),
            VariableStats(hitpoints: 261, damagePerSecond: 88),
            VariableStats(hitpoints: 286, damagePerSecond: 97),
            VariableStats(hitpoints: 315, damagePerSecond: 106)]
        case .elixirGolemites: return [
            VariableStats(hitpoints: 340, damage: 60, damagePerSecond: 46),
            VariableStats(hitpoints: 374, damage: 66, damagePerSecond: 50),
            VariableStats(hitpoints: 411, damage: 72, damagePerSecond: 55),
            VariableStats(hitpoints: 452, damage: 79, damagePerSecond: 60),
            VariableStats(hitpoints: 496, damage: 87, damagePerSecond: 66),
            VariableStats(hitpoints: 544, damage: 96, damagePerSecond: 73),
            VariableStats(hitpoints: 598, damage: 105, damagePerSecond: 80),
            VariableStats(hitpoints: 656, damage: 115, damagePerSecond: 88),
            VariableStats(hitpoints: 720, damage: 127, damagePerSecond: 97),
            VariableStats(hitpoints: 792, damage: 139, damagePerSecond: 106),
            VariableStats(hitpoints: 870, damage: 153, damagePerSecond: 117)]
        case .elixirBlobs: return [
            VariableStats(hitpoints: 170, damage: 30, damagePerSecond: 23),
            VariableStats(hitpoints: 187, damage: 33, damagePerSecond: 25),
            VariableStats(hitpoints: 205, damage: 36, damagePerSecond: 27),
            VariableStats(hitpoints: 226, damage: 39, damagePerSecond: 30),
            VariableStats(hitpoints: 248, damage: 43, damagePerSecond: 33),
            VariableStats(hitpoints: 272, damage: 48, damagePerSecond: 36),
            VariableStats(hitpoints: 299, damage: 52, damagePerSecond: 40),
            VariableStats(hitpoints: 328, damage: 57, damagePerSecond: 43),
            VariableStats(hitpoints: 360, damage: 63, damagePerSecond: 48),
            VariableStats(hitpoints: 396, damage: 69, damagePerSecond: 53),
            VariableStats(hitpoints: 435, damage: 76, damagePerSecond: 58)]
        case .goblinBrawler: return [
            VariableStats(hitpoints: 485, damage: 159),
            VariableStats(hitpoints: 533, damage: 174),
            VariableStats(hitpoints: 586, damage: 192),
            VariableStats(hitpoints: 645, damage: 211),
            VariableStats(hitpoints: 708, damage: 232),
            VariableStats(hitpoints: 776, damage: 254),
            VariableStats(hitpoints: 853, damage: 279),
            VariableStats(hitpoints: 936, damage: 306),
            VariableStats(hitpoints: 1028, damage: 337),
            VariableStats(hitpoints: 1130, damage: 370),
            VariableStats(hitpoints: 1241, damage: 407)]
        case .lavaPups: return [
            VariableStats(hitpoints: 179, damage: 75),
            VariableStats(hitpoints: 196, damage: 82),
            VariableStats(hitpoints: 216, damage: 90),
            VariableStats(hitpoints: 238, damage: 99),
            VariableStats(hitpoints: 261, damage: 109)]
        case .rider: return [
            VariableStats(damage: 86),
            VariableStats(damage: 94),
            VariableStats(damage: 104),
            VariableStats(damage: 114),
            VariableStats(damage: 125)]
        case .golemites: return [
            VariableStats(hitpoints: 650, damage: 31, deathDamage: 62),
            VariableStats(hitpoints: 715, damage: 34, deathDamage: 68),
            VariableStats(hitpoints: 786, damage: 37, deathDamage: 75),
            VariableStats(hitpoints: 864, damage: 41, deathDamage: 82),
            VariableStats(hitpoints: 949, damage: 45, deathDamage: 90),
            VariableStats(hitpoints: 1040, damage: 49, deathDamage: 99),
            VariableStats(hitpoints: 1144, damage: 54, deathDamage: 109),
            VariableStats(hitpoints: 1254, damage: 59, deathDamage: 119)]
        }
    }
}

extension DataSet.Cards {
    var variableStats: [VariableStats] {
        switch self {
        case .unknownCard: return [
            VariableStats(),
            VariableStats(),
            VariableStats(),
            VariableStats(),
            VariableStats(),
            VariableStats(),
            VariableStats(),
            VariableStats(),
            VariableStats(),
            VariableStats(),
            VariableStats(),
            VariableStats(),
            VariableStats()]
        case .knight: return [
            VariableStats(hitpoints: 685, damage: 79, damagePerSecond: 65),
            VariableStats(hitpoints: 753, damage: 86, damagePerSecond: 71),
            VariableStats(hitpoints: 828, damage: 95, damagePerSecond: 79),
            VariableStats(hitpoints: 911, damage: 105, damagePerSecond: 87),
            VariableStats(hitpoints: 1000, damage: 115, damagePerSecond: 95),
            VariableStats(hitpoints: 1096, damage: 126, damagePerSecond: 105),
            VariableStats(hitpoints: 1205, damage: 139, damagePerSecond: 115),
            VariableStats(hitpoints: 1322, damage: 152, damagePerSecond: 126),
            VariableStats(hitpoints: 1452, damage: 167, damagePerSecond: 139),
            VariableStats(hitpoints: 1596, damage: 184, damagePerSecond: 153),
            VariableStats(hitpoints: 1753, damage: 202, damagePerSecond: 168),
            VariableStats(hitpoints: 1924, damage: 221, damagePerSecond: 184),
            VariableStats(hitpoints: 2116, damage: 244, damagePerSecond: 203)]
        case .archers: return [
            VariableStats(hitpoints: 119, rangedDamage: 42),
            VariableStats(hitpoints: 130, rangedDamage: 46),
            VariableStats(hitpoints: 143, rangedDamage: 50),
            VariableStats(hitpoints: 158, rangedDamage: 55),
            VariableStats(hitpoints: 173, rangedDamage: 61),
            VariableStats(hitpoints: 190, rangedDamage: 67),
            VariableStats(hitpoints: 209, rangedDamage: 73),
            VariableStats(hitpoints: 229, rangedDamage: 81),
            VariableStats(hitpoints: 252, rangedDamage: 89),
            VariableStats(hitpoints: 277, rangedDamage: 97),
            VariableStats(hitpoints: 304, rangedDamage: 107),
            VariableStats(hitpoints: 334, rangedDamage: 118),
            VariableStats(hitpoints: 367, rangedDamage: 129)]
        case .goblins: return [
            VariableStats(hitpoints: 79, damage: 47, damagePerSecond: 42),
            VariableStats(hitpoints: 86, damage: 51, damagePerSecond: 46),
            VariableStats(hitpoints: 95, damage: 56, damagePerSecond: 50),
            VariableStats(hitpoints: 105, damage: 62, damagePerSecond: 56),
            VariableStats(hitpoints: 115, damage: 68, damagePerSecond: 61),
            VariableStats(hitpoints: 126, damage: 75, damagePerSecond: 68),
            VariableStats(hitpoints: 139, damage: 82, damagePerSecond: 74),
            VariableStats(hitpoints: 152, damage: 90, damagePerSecond: 81),
            VariableStats(hitpoints: 167, damage: 99, damagePerSecond: 90),
            VariableStats(hitpoints: 184, damage: 109, damagePerSecond: 99),
            VariableStats(hitpoints: 202, damage: 120, damagePerSecond: 109),
            VariableStats(hitpoints: 221, damage: 132, damagePerSecond: 120),
            VariableStats(hitpoints: 244, damage: 145, damagePerSecond: 131)]
        case .giant: return [
            VariableStats(hitpoints: 1861, damage: 120, damagePerSecond: 80),
            VariableStats(hitpoints: 2047, damage: 132, damagePerSecond: 88),
            VariableStats(hitpoints: 2251, damage: 145, damagePerSecond: 96),
            VariableStats(hitpoints: 2475, damage: 159, damagePerSecond: 106),
            VariableStats(hitpoints: 2717, damage: 175, damagePerSecond: 116),
            VariableStats(hitpoints: 2977, damage: 192, damagePerSecond: 128),
            VariableStats(hitpoints: 3275, damage: 211, damagePerSecond: 140),
            VariableStats(hitpoints: 3591, damage: 231, damagePerSecond: 154),
            VariableStats(hitpoints: 3945, damage: 254, damagePerSecond: 169),
            VariableStats(hitpoints: 4336, damage: 279, damagePerSecond: 186),
            VariableStats(hitpoints: 4764, damage: 307, damagePerSecond: 204)]
        case .pekka: return [
            VariableStats(hitpoints: 2350, damage: 510, damagePerSecond: 283),
            VariableStats(hitpoints: 2585, damage: 561, damagePerSecond: 311),
            VariableStats(hitpoints: 2843, damage: 617, damagePerSecond: 342),
            VariableStats(hitpoints: 3125, damage: 678, damagePerSecond: 376),
            VariableStats(hitpoints: 3431, damage: 744, damagePerSecond: 413),
            VariableStats(hitpoints: 3760, damage: 816, damagePerSecond: 453),
            VariableStats(hitpoints: 4136, damage: 897, damagePerSecond: 498),
            VariableStats(hitpoints: 4535, damage: 984, damagePerSecond: 546)]
        case .minions: return [
            VariableStats(hitpoints: 90, rangedDamage: 40),
            VariableStats(hitpoints: 99, rangedDamage: 44),
            VariableStats(hitpoints: 108, rangedDamage: 48),
            VariableStats(hitpoints: 119, rangedDamage: 53),
            VariableStats(hitpoints: 131, rangedDamage: 58),
            VariableStats(hitpoints: 144, rangedDamage: 64),
            VariableStats(hitpoints: 158, rangedDamage: 70),
            VariableStats(hitpoints: 173, rangedDamage: 77),
            VariableStats(hitpoints: 190, rangedDamage: 84),
            VariableStats(hitpoints: 209, rangedDamage: 93),
            VariableStats(hitpoints: 230, rangedDamage: 102),
            VariableStats(hitpoints: 252, rangedDamage: 112),
            VariableStats(hitpoints: 278, rangedDamage: 123)]
        case .balloon: return [
            VariableStats(hitpoints: 1050, damage: 600, damagePerSecond: 205, deathDamage: 190),
            VariableStats(hitpoints: 1155, damage: 660, damagePerSecond: 225, deathDamage: 209),
            VariableStats(hitpoints: 1270, damage: 726, damagePerSecond: 248, deathDamage: 229),
            VariableStats(hitpoints: 1396, damage: 798, damagePerSecond: 272, deathDamage: 252),
            VariableStats(hitpoints: 1533, damage: 876, damagePerSecond: 299, deathDamage: 276),
            VariableStats(hitpoints: 1680, damage: 960, damagePerSecond: 328, deathDamage: 304),
            VariableStats(hitpoints: 1848, damage: 1056, damagePerSecond: 360, deathDamage: 334),
            VariableStats(hitpoints: 2026, damage: 1158, damagePerSecond: 395, deathDamage: 367)]
        case .witch: return [
            VariableStats(hitpoints: 524, areaDamage: 84, subTroopsLevel: 6),
            VariableStats(hitpoints: 576, areaDamage: 92, subTroopsLevel: 7),
            VariableStats(hitpoints: 634, areaDamage: 101, subTroopsLevel: 8),
            VariableStats(hitpoints: 696, areaDamage: 111, subTroopsLevel: 9),
            VariableStats(hitpoints: 765, areaDamage: 122, subTroopsLevel: 10),
            VariableStats(hitpoints: 838, areaDamage: 134, subTroopsLevel: 11),
            VariableStats(hitpoints: 922, areaDamage: 147, subTroopsLevel: 12),
            VariableStats(hitpoints: 1011, areaDamage: 162, subTroopsLevel: 13)]
        case .barbarians: return [
            VariableStats(hitpoints: 262, damage: 75, damagePerSecond: 53),
            VariableStats(hitpoints: 288, damage: 82, damagePerSecond: 58),
            VariableStats(hitpoints: 376, damage: 90, damagePerSecond: 64),
            VariableStats(hitpoints: 348, damage: 99, damagePerSecond: 70),
            VariableStats(hitpoints: 382, damage: 109, damagePerSecond: 77),
            VariableStats(hitpoints: 419, damage: 120, damagePerSecond: 85),
            VariableStats(hitpoints: 461, damage: 132, damagePerSecond: 94),
            VariableStats(hitpoints: 505, damage: 144, damagePerSecond: 102),
            VariableStats(hitpoints: 555, damage: 159, damagePerSecond: 113),
            VariableStats(hitpoints: 610, damage: 174, damagePerSecond: 124),
            VariableStats(hitpoints: 670, damage: 192, damagePerSecond: 137),
            VariableStats(hitpoints: 736, damage: 210, damagePerSecond: 150),
            VariableStats(hitpoints: 809, damage: 231, damagePerSecond: 165)]
        case .golem: return [
            VariableStats(hitpoints: 3200, damage: 195, damagePerSecond: 78, deathDamage: 195, subTroopsLevel: 6),
            VariableStats(hitpoints: 3520, damage: 214, damagePerSecond: 85, deathDamage: 214, subTroopsLevel: 7),
            VariableStats(hitpoints: 3872, damage: 235, damagePerSecond: 94, deathDamage: 235, subTroopsLevel: 8),
            VariableStats(hitpoints: 4256, damage: 259, damagePerSecond: 103, deathDamage: 259, subTroopsLevel: 9),
            VariableStats(hitpoints: 4672, damage: 284, damagePerSecond: 113, deathDamage: 284, subTroopsLevel: 10),
            VariableStats(hitpoints: 5120, damage: 312, damagePerSecond: 124, deathDamage: 312, subTroopsLevel: 11),
            VariableStats(hitpoints: 5632, damage: 343, damagePerSecond: 137, deathDamage: 343, subTroopsLevel: 12),
            VariableStats(hitpoints: 6176, damage: 376, damagePerSecond: 150, deathDamage: 376, subTroopsLevel: 13)]
        case .skeletons: return [
            VariableStats(hitpoints: 32, damage: 32),
            VariableStats(hitpoints: 35, damage: 35),
            VariableStats(hitpoints: 38, damage: 38),
            VariableStats(hitpoints: 42, damage: 42),
            VariableStats(hitpoints: 46, damage: 46),
            VariableStats(hitpoints: 51, damage: 51),
            VariableStats(hitpoints: 56, damage: 56),
            VariableStats(hitpoints: 61, damage: 61),
            VariableStats(hitpoints: 67, damage: 67),
            VariableStats(hitpoints: 74, damage: 74),
            VariableStats(hitpoints: 81, damage: 81),
            VariableStats(hitpoints: 89, damage: 89),
            VariableStats(hitpoints: 98, damage: 98)]
        case .valkyrie: return [
            VariableStats(hitpoints: 940, damage: 126, damagePerSecond: 84),
            VariableStats(hitpoints: 1034, damage: 138, damagePerSecond: 92),
            VariableStats(hitpoints: 1137, damage: 152, damagePerSecond: 101),
            VariableStats(hitpoints: 1250, damage: 167, damagePerSecond: 110),
            VariableStats(hitpoints: 1372, damage: 183, damagePerSecond: 122),
            VariableStats(hitpoints: 1504, damage: 201, damagePerSecond: 134),
            VariableStats(hitpoints: 1654, damage: 221, damagePerSecond: 147),
            VariableStats(hitpoints: 1814, damage: 243, damagePerSecond: 162),
            VariableStats(hitpoints: 1992, damage: 267, damagePerSecond: 178),
            VariableStats(hitpoints: 2190, damage: 293, damagePerSecond: 195),
            VariableStats(hitpoints: 2406, damage: 322, damagePerSecond: 214)]
        case .skeletonArmy: return [
            VariableStats(subTroopsLevel: 6),
            VariableStats(subTroopsLevel: 7),
            VariableStats(subTroopsLevel: 8),
            VariableStats(subTroopsLevel: 9),
            VariableStats(subTroopsLevel: 10),
            VariableStats(subTroopsLevel: 11),
            VariableStats(subTroopsLevel: 12),
            VariableStats(subTroopsLevel: 13)]
        case .bomber: return [
            VariableStats(hitpoints: 188, areaDamage: 128),
            VariableStats(hitpoints: 206, areaDamage: 140),
            VariableStats(hitpoints: 227, areaDamage: 154),
            VariableStats(hitpoints: 250, areaDamage: 170),
            VariableStats(hitpoints: 274, areaDamage: 186),
            VariableStats(hitpoints: 300, areaDamage: 204),
            VariableStats(hitpoints: 330, areaDamage: 225),
            VariableStats(hitpoints: 362, areaDamage: 247),
            VariableStats(hitpoints: 398, areaDamage: 271),
            VariableStats(hitpoints: 438, areaDamage: 298),
            VariableStats(hitpoints: 481, areaDamage: 327),
            VariableStats(hitpoints: 528, areaDamage: 359),
            VariableStats(hitpoints: 580, areaDamage: 395)]
        case .musketeer: return [
            VariableStats(hitpoints: 340, rangedDamage: 103),
            VariableStats(hitpoints: 374, rangedDamage: 113),
            VariableStats(hitpoints: 411, rangedDamage: 124),
            VariableStats(hitpoints: 452, rangedDamage: 136),
            VariableStats(hitpoints: 496, rangedDamage: 150),
            VariableStats(hitpoints: 544, rangedDamage: 164),
            VariableStats(hitpoints: 598, rangedDamage: 181),
            VariableStats(hitpoints: 656, rangedDamage: 198),
            VariableStats(hitpoints: 720, rangedDamage: 218),
            VariableStats(hitpoints: 792, rangedDamage: 239),
            VariableStats(hitpoints: 870, rangedDamage: 263)]
        case .babyDragon: return [
            VariableStats(hitpoints: 720, areaDamage: 100),
            VariableStats(hitpoints: 792, areaDamage: 110),
            VariableStats(hitpoints: 871, areaDamage: 121),
            VariableStats(hitpoints: 957, areaDamage: 133),
            VariableStats(hitpoints: 1051, areaDamage: 146),
            VariableStats(hitpoints: 1152, areaDamage: 160),
            VariableStats(hitpoints: 1267, areaDamage: 176),
            VariableStats(hitpoints: 1389, areaDamage: 193)]
        case .prince: return [
            VariableStats(hitpoints: 1255, damage: 245, damagePerSecond: 175, chargeDamage: 490),
            VariableStats(hitpoints: 1380, damage: 269, damagePerSecond: 192, chargeDamage: 539),
            VariableStats(hitpoints: 1518, damage: 296, damagePerSecond: 211, chargeDamage: 592),
            VariableStats(hitpoints: 1669, damage: 325, damagePerSecond: 232, chargeDamage: 651),
            VariableStats(hitpoints: 1832, damage: 357, damagePerSecond: 255, chargeDamage: 715),
            VariableStats(hitpoints: 2008, damage: 392, damagePerSecond: 280, chargeDamage: 784),
            VariableStats(hitpoints: 2208, damage: 431, damagePerSecond: 307, chargeDamage: 862),
            VariableStats(hitpoints: 2422, damage: 472, damagePerSecond: 337, chargeDamage: 945)]
        case .wizard: return [
            VariableStats(hitpoints: 340, areaDamage: 133),
            VariableStats(hitpoints: 374, areaDamage: 146),
            VariableStats(hitpoints: 411, areaDamage: 160),
            VariableStats(hitpoints: 452, areaDamage: 176),
            VariableStats(hitpoints: 496, areaDamage: 194),
            VariableStats(hitpoints: 544, areaDamage: 212),
            VariableStats(hitpoints: 598, areaDamage: 234),
            VariableStats(hitpoints: 656, areaDamage: 256),
            VariableStats(hitpoints: 720, areaDamage: 281),
            VariableStats(hitpoints: 792, areaDamage: 309),
            VariableStats(hitpoints: 870, areaDamage: 340)]
        case .miniPekka: return [
            VariableStats(hitpoints: 642, damage: 340, damagePerSecond: 188),
            VariableStats(hitpoints: 706, damage: 374, damagePerSecond: 207),
            VariableStats(hitpoints: 776, damage: 411, damagePerSecond: 228),
            VariableStats(hitpoints: 853, damage: 452, damagePerSecond: 251),
            VariableStats(hitpoints: 937, damage: 496, damagePerSecond: 275),
            VariableStats(hitpoints: 1027, damage: 544, damagePerSecond: 302),
            VariableStats(hitpoints: 1129, damage: 598, damagePerSecond: 332),
            VariableStats(hitpoints: 1239, damage: 656, damagePerSecond: 364),
            VariableStats(hitpoints: 1361, damage: 720, damagePerSecond: 400),
            VariableStats(hitpoints: 1495, damage: 792, damagePerSecond: 440),
            VariableStats(hitpoints: 1643, damage: 870, damagePerSecond: 483)]
        case .spearGoblins: return [
            VariableStats(hitpoints: 52, rangedDamage: 32),
            VariableStats(hitpoints: 57, rangedDamage: 35),
            VariableStats(hitpoints: 62, rangedDamage: 38),
            VariableStats(hitpoints: 69, rangedDamage: 42),
            VariableStats(hitpoints: 75, rangedDamage: 46),
            VariableStats(hitpoints: 83, rangedDamage: 51),
            VariableStats(hitpoints: 91, rangedDamage: 56),
            VariableStats(hitpoints: 100, rangedDamage: 61),
            VariableStats(hitpoints: 110, rangedDamage: 67),
            VariableStats(hitpoints: 121, rangedDamage: 74),
            VariableStats(hitpoints: 133, rangedDamage: 81),
            VariableStats(hitpoints: 146, rangedDamage: 89),
            VariableStats(hitpoints: 160, rangedDamage: 98)]
        case .giantSkeleton: return [
            VariableStats(hitpoints: 2100, damage: 130, damagePerSecond: 86, deathDamage: 720),
            VariableStats(hitpoints: 2310, damage: 143, damagePerSecond: 95, deathDamage: 792),
            VariableStats(hitpoints: 2541, damage: 157, damagePerSecond: 104, deathDamage: 871),
            VariableStats(hitpoints: 2793, damage: 172, damagePerSecond: 114, deathDamage: 957),
            VariableStats(hitpoints: 3066, damage: 189, damagePerSecond: 126, deathDamage: 1051),
            VariableStats(hitpoints: 3360, damage: 208, damagePerSecond: 138, deathDamage: 1152),
            VariableStats(hitpoints: 3696, damage: 228, damagePerSecond: 152, deathDamage: 1267),
            VariableStats(hitpoints: 4053, damage: 250, damagePerSecond: 166, deathDamage: 1389)]
        case .hogRider: return [
            VariableStats(hitpoints: 800, damage: 150, damagePerSecond: 93),
            VariableStats(hitpoints: 880, damage: 165, damagePerSecond: 103),
            VariableStats(hitpoints: 968, damage: 181, damagePerSecond: 113),
            VariableStats(hitpoints: 1064, damage: 199, damagePerSecond: 124),
            VariableStats(hitpoints: 1168, damage: 219, damagePerSecond: 136),
            VariableStats(hitpoints: 1280, damage: 240, damagePerSecond: 150),
            VariableStats(hitpoints: 1408, damage: 264, damagePerSecond: 165),
            VariableStats(hitpoints: 1544, damage: 289, damagePerSecond: 180),
            VariableStats(hitpoints: 1696, damage: 318, damagePerSecond: 198),
            VariableStats(hitpoints: 1864, damage: 349, damagePerSecond: 218),
            VariableStats(hitpoints: 2048, damage: 384, damagePerSecond: 240)]
        case .minionHorde: return [
            VariableStats(hitpoints: 90, rangedDamage: 40),
            VariableStats(hitpoints: 99, rangedDamage: 44),
            VariableStats(hitpoints: 108, rangedDamage: 48),
            VariableStats(hitpoints: 119, rangedDamage: 53),
            VariableStats(hitpoints: 131, rangedDamage: 58),
            VariableStats(hitpoints: 144, rangedDamage: 64),
            VariableStats(hitpoints: 158, rangedDamage: 70),
            VariableStats(hitpoints: 173, rangedDamage: 77),
            VariableStats(hitpoints: 190, rangedDamage: 84),
            VariableStats(hitpoints: 209, rangedDamage: 93),
            VariableStats(hitpoints: 230, rangedDamage: 102),
            VariableStats(hitpoints: 252, rangedDamage: 112),
            VariableStats(hitpoints: 278, rangedDamage: 123)]
        case .iceWizard: return [
            VariableStats(hitpoints: 590, areaDamage: 75),
            VariableStats(hitpoints: 649, areaDamage: 82),
            VariableStats(hitpoints: 713, areaDamage: 90),
            VariableStats(hitpoints: 784, areaDamage: 99),
            VariableStats(hitpoints: 861, areaDamage: 109)]
        case .royalGiant: return [
            VariableStats(hitpoints: 1200, rangedDamage: 120),
            VariableStats(hitpoints: 1320, rangedDamage: 132),
            VariableStats(hitpoints: 1452, rangedDamage: 145),
            VariableStats(hitpoints: 1596, rangedDamage: 159),
            VariableStats(hitpoints: 1752, rangedDamage: 175),
            VariableStats(hitpoints: 1920, rangedDamage: 192),
            VariableStats(hitpoints: 2112, rangedDamage: 211),
            VariableStats(hitpoints: 2316, rangedDamage: 231),
            VariableStats(hitpoints: 2544, rangedDamage: 254),
            VariableStats(hitpoints: 2796, rangedDamage: 279),
            VariableStats(hitpoints: 3072, rangedDamage: 307),
            VariableStats(hitpoints: 3372, rangedDamage: 337),
            VariableStats(hitpoints: 3708, rangedDamage: 370)]
        case .guards: return [
            VariableStats(hitpoints: 68, shieldHitpoints: 150, damage: 68, damagePerSecond: 61),
            VariableStats(hitpoints: 74, shieldHitpoints: 165, damage: 74, damagePerSecond: 67),
            VariableStats(hitpoints: 82, shieldHitpoints: 181, damage: 82, damagePerSecond: 74),
            VariableStats(hitpoints: 90, shieldHitpoints: 199, damage: 90, damagePerSecond: 81),
            VariableStats(hitpoints: 99, shieldHitpoints: 219, damage: 99, damagePerSecond: 90),
            VariableStats(hitpoints: 108, shieldHitpoints: 240, damage: 108, damagePerSecond: 98),
            VariableStats(hitpoints: 119, shieldHitpoints: 264, damage: 119, damagePerSecond: 108),
            VariableStats(hitpoints: 131, shieldHitpoints: 289, damage: 131, damagePerSecond: 119)]
        case .princess: return [
            VariableStats(hitpoints: 216, damage: 140, damagePerSecond: 46),
            VariableStats(hitpoints: 237, damage: 154, damagePerSecond: 51),
            VariableStats(hitpoints: 261, damage: 169, damagePerSecond: 56),
            VariableStats(hitpoints: 287, damage: 186, damagePerSecond: 62),
            VariableStats(hitpoints: 315, damage: 204, damagePerSecond: 68)]
        case .darkPrince: return [
            // damagePerSecond doesnt fit when showing stats to user
            VariableStats(hitpoints: 775, shieldHitpoints: 150, areaDamage: 155,
                          /*damagePerSecond: 119, */chargeDamage: 310),
            VariableStats(hitpoints: 852, shieldHitpoints: 165, areaDamage: 170,
                          /*damagePerSecond: 130, */chargeDamage: 341),
            VariableStats(hitpoints: 937, shieldHitpoints: 181, areaDamage: 187,
                          /*damagePerSecond: 143, */chargeDamage: 375),
            VariableStats(hitpoints: 1030, shieldHitpoints: 199, areaDamage: 206,
                          /*damagePerSecond: 158, */chargeDamage: 412),
            VariableStats(hitpoints: 1131, shieldHitpoints: 219, areaDamage: 226,
                          /*damagePerSecond: 173, */chargeDamage: 452),
            VariableStats(hitpoints: 1240, shieldHitpoints: 240, areaDamage: 248,
                          /*damagePerSecond: 190, */chargeDamage: 496),
            VariableStats(hitpoints: 1364, shieldHitpoints: 264, areaDamage: 272,
                          /*damagePerSecond: 209, */chargeDamage: 545),
            VariableStats(hitpoints: 1495, shieldHitpoints: 289, areaDamage: 299,
                          /*damagePerSecond: 230, */chargeDamage: 598)]
        case .threeMusketeers: return [
            VariableStats(hitpoints: 340, rangedDamage: 103),
            VariableStats(hitpoints: 374, rangedDamage: 113),
            VariableStats(hitpoints: 411, rangedDamage: 124),
            VariableStats(hitpoints: 452, rangedDamage: 136),
            VariableStats(hitpoints: 496, rangedDamage: 150),
            VariableStats(hitpoints: 544, rangedDamage: 164),
            VariableStats(hitpoints: 598, rangedDamage: 181),
            VariableStats(hitpoints: 656, rangedDamage: 198),
            VariableStats(hitpoints: 720, rangedDamage: 218),
            VariableStats(hitpoints: 792, rangedDamage: 239),
            VariableStats(hitpoints: 870, rangedDamage: 263)]
        case .lavaHound: return [
            VariableStats(hitpoints: 3150, rangedDamage: 45, subTroopsLevel: 9),
            VariableStats(hitpoints: 3465, rangedDamage: 49, subTroopsLevel: 10),
            VariableStats(hitpoints: 3811, rangedDamage: 54, subTroopsLevel: 11),
            VariableStats(hitpoints: 4189, rangedDamage: 59, subTroopsLevel: 12),
            VariableStats(hitpoints: 4599, rangedDamage: 65, subTroopsLevel: 13)]
        case .iceSpirit: return [
            VariableStats(hitpoints: 90, areaDamage: 43),
            VariableStats(hitpoints: 99, areaDamage: 47),
            VariableStats(hitpoints: 108, areaDamage: 52),
            VariableStats(hitpoints: 119, areaDamage: 57),
            VariableStats(hitpoints: 131, areaDamage: 62),
            VariableStats(hitpoints: 144, areaDamage: 68),
            VariableStats(hitpoints: 158, areaDamage: 75),
            VariableStats(hitpoints: 173, areaDamage: 82),
            VariableStats(hitpoints: 190, areaDamage: 91),
            VariableStats(hitpoints: 209, areaDamage: 100),
            VariableStats(hitpoints: 230, areaDamage: 110),
            VariableStats(hitpoints: 252, areaDamage: 120),
            VariableStats(hitpoints: 278, areaDamage: 132)]
        case .fireSpirits: return [
            VariableStats(hitpoints: 43, areaDamage: 84),
            VariableStats(hitpoints: 47, areaDamage: 92),
            VariableStats(hitpoints: 52, areaDamage: 101),
            VariableStats(hitpoints: 57, areaDamage: 111),
            VariableStats(hitpoints: 62, areaDamage: 122),
            VariableStats(hitpoints: 68, areaDamage: 134),
            VariableStats(hitpoints: 75, areaDamage: 147),
            VariableStats(hitpoints: 82, areaDamage: 162),
            VariableStats(hitpoints: 91, areaDamage: 178),
            VariableStats(hitpoints: 100, areaDamage: 195),
            VariableStats(hitpoints: 110, areaDamage: 215),
            VariableStats(hitpoints: 120, areaDamage: 236),
            VariableStats(hitpoints: 132, areaDamage: 259)]
        case .miner: return [
            VariableStats(hitpoints: 1000, damage: 160, damagePerSecond: 133, crownTowerDamage: 48),
            VariableStats(hitpoints: 1100, damage: 176, damagePerSecond: 146, crownTowerDamage: 52),
            VariableStats(hitpoints: 1210, damage: 193, damagePerSecond: 160, crownTowerDamage: 59),
            VariableStats(hitpoints: 1330, damage: 212, damagePerSecond: 176, crownTowerDamage: 63),
            VariableStats(hitpoints: 1460, damage: 233, damagePerSecond: 194, crownTowerDamage: 70)]
        case .sparky: return [
            VariableStats(hitpoints: 1200, areaDamage: 1100),
            VariableStats(hitpoints: 1320, areaDamage: 1210),
            VariableStats(hitpoints: 1452, areaDamage: 1331),
            VariableStats(hitpoints: 1596, areaDamage: 1463),
            VariableStats(hitpoints: 1752, areaDamage: 1606)]
        case .bowler: return [
            VariableStats(hitpoints: 1300, areaDamage: 180),
            VariableStats(hitpoints: 1430, areaDamage: 198),
            VariableStats(hitpoints: 1573, areaDamage: 217),
            VariableStats(hitpoints: 1729, areaDamage: 239),
            VariableStats(hitpoints: 1898, areaDamage: 262),
            VariableStats(hitpoints: 2080, areaDamage: 288),
            VariableStats(hitpoints: 2288, areaDamage: 316),
            VariableStats(hitpoints: 2509, areaDamage: 347)]
        case .lumberjack: return [
            VariableStats(hitpoints: 1060, damage: 200, damagePerSecond: 250),
            VariableStats(hitpoints: 1165, damage: 220, damagePerSecond: 275),
            VariableStats(hitpoints: 1282, damage: 242, damagePerSecond: 302),
            VariableStats(hitpoints: 1409, damage: 266, damagePerSecond: 332),
            VariableStats(hitpoints: 1547, damage: 292, damagePerSecond: 365)]
        case .battleRam: return [
            VariableStats(hitpoints: 430, damage: 125, chargeDamage: 250, subTroopsLevel: 3),
            VariableStats(hitpoints: 473, damage: 137, chargeDamage: 275, subTroopsLevel: 4),
            VariableStats(hitpoints: 520, damage: 151, chargeDamage: 302, subTroopsLevel: 5),
            VariableStats(hitpoints: 571, damage: 166, chargeDamage: 332, subTroopsLevel: 6),
            VariableStats(hitpoints: 627, damage: 182, chargeDamage: 365, subTroopsLevel: 7),
            VariableStats(hitpoints: 688, damage: 200, chargeDamage: 400, subTroopsLevel: 8),
            VariableStats(hitpoints: 756, damage: 220, chargeDamage: 440, subTroopsLevel: 9),
            VariableStats(hitpoints: 829, damage: 241, chargeDamage: 482, subTroopsLevel: 10),
            VariableStats(hitpoints: 911, damage: 265, chargeDamage: 530, subTroopsLevel: 11),
            VariableStats(hitpoints: 1001, damage: 291, chargeDamage: 582, subTroopsLevel: 12),
            VariableStats(hitpoints: 1100, damage: 320, chargeDamage: 640, subTroopsLevel: 13)]
        case .infernoDragon: return [
            VariableStats(hitpoints: 1070, expDamage: "30-350", expDamagePerSecond: "75-875"),
            VariableStats(hitpoints: 1177, expDamage: "33-385", expDamagePerSecond: "83-962"),
            VariableStats(hitpoints: 1294, expDamage: "36-423", expDamagePerSecond: "90-1057"),
            VariableStats(hitpoints: 1423, expDamage: "39-465", expDamagePerSecond: "97-1162"),
            VariableStats(hitpoints: 1562, expDamage: "43-511", expDamagePerSecond: "107-1277")]
        case .iceGolem: return [
            VariableStats(hitpoints: 565, damage: 40, damagePerSecond: 16, deathDamage: 40),
            VariableStats(hitpoints: 621, damage: 44, damagePerSecond: 17, deathDamage: 44),
            VariableStats(hitpoints: 683, damage: 48, damagePerSecond: 19, deathDamage: 48),
            VariableStats(hitpoints: 751, damage: 53, damagePerSecond: 21, deathDamage: 53),
            VariableStats(hitpoints: 824, damage: 58, damagePerSecond: 23, deathDamage: 58),
            VariableStats(hitpoints: 904, damage: 64, damagePerSecond: 25, deathDamage: 64),
            VariableStats(hitpoints: 994, damage: 70, damagePerSecond: 28, deathDamage: 70),
            VariableStats(hitpoints: 1090, damage: 77, damagePerSecond: 30, deathDamage: 77),
            VariableStats(hitpoints: 1197, damage: 84, damagePerSecond: 33, deathDamage: 84),
            VariableStats(hitpoints: 1316, damage: 93, damagePerSecond: 37, deathDamage: 93),
            VariableStats(hitpoints: 1446, damage: 102, damagePerSecond: 40, deathDamage: 102)]
        case .megaMinion: return [
            VariableStats(hitpoints: 395, rangedDamage: 147),
            VariableStats(hitpoints: 434, rangedDamage: 161),
            VariableStats(hitpoints: 477, rangedDamage: 177),
            VariableStats(hitpoints: 525, rangedDamage: 195),
            VariableStats(hitpoints: 576, rangedDamage: 214),
            VariableStats(hitpoints: 632, rangedDamage: 235),
            VariableStats(hitpoints: 695, rangedDamage: 258),
            VariableStats(hitpoints: 762, rangedDamage: 283),
            VariableStats(hitpoints: 837, rangedDamage: 311),
            VariableStats(hitpoints: 920, rangedDamage: 342),
            VariableStats(hitpoints: 1011, rangedDamage: 376)]
        case .dartGoblin: return [
            VariableStats(hitpoints: 123, rangedDamage: 57),
            VariableStats(hitpoints: 135, rangedDamage: 62),
            VariableStats(hitpoints: 148, rangedDamage: 68),
            VariableStats(hitpoints: 163, rangedDamage: 75),
            VariableStats(hitpoints: 179, rangedDamage: 83),
            VariableStats(hitpoints: 196, rangedDamage: 91),
            VariableStats(hitpoints: 216, rangedDamage: 100),
            VariableStats(hitpoints: 237, rangedDamage: 109),
            VariableStats(hitpoints: 260, rangedDamage: 120),
            VariableStats(hitpoints: 286, rangedDamage: 132),
            VariableStats(hitpoints: 314, rangedDamage: 145)]
        case .goblinGang: return [
            VariableStats(subTroopsLevel: 1),
            VariableStats(subTroopsLevel: 2),
            VariableStats(subTroopsLevel: 3),
            VariableStats(subTroopsLevel: 4),
            VariableStats(subTroopsLevel: 5),
            VariableStats(subTroopsLevel: 6),
            VariableStats(subTroopsLevel: 7),
            VariableStats(subTroopsLevel: 8),
            VariableStats(subTroopsLevel: 9),
            VariableStats(subTroopsLevel: 10),
            VariableStats(subTroopsLevel: 11),
            VariableStats(subTroopsLevel: 12),
            VariableStats(subTroopsLevel: 13)]
        case .electroWizard: return [
            VariableStats(hitpoints: 590, damage: 192, damagePerSecond: 106, spawnDamage: 159),
            VariableStats(hitpoints: 649, damage: 210, damagePerSecond: 116, spawnDamage: 174),
            VariableStats(hitpoints: 713, damage: 232, damagePerSecond: 128, spawnDamage: 192),
            VariableStats(hitpoints: 784, damage: 254, damagePerSecond: 140, spawnDamage: 210),
            VariableStats(hitpoints: 861, damage: 280, damagePerSecond: 154, spawnDamage: 231)]
        case .eliteBarbarians: return [
            VariableStats(hitpoints: 458, damage: 142, damagePerSecond: 83),
            VariableStats(hitpoints: 503, damage: 156, damagePerSecond: 91),
            VariableStats(hitpoints: 554, damage: 171, damagePerSecond: 100),
            VariableStats(hitpoints: 609, damage: 188, damagePerSecond: 110),
            VariableStats(hitpoints: 668, damage: 207, damagePerSecond: 121),
            VariableStats(hitpoints: 732, damage: 227, damagePerSecond: 133),
            VariableStats(hitpoints: 806, damage: 249, damagePerSecond: 146),
            VariableStats(hitpoints: 883, damage: 274, damagePerSecond: 161),
            VariableStats(hitpoints: 970, damage: 301, damagePerSecond: 177),
            VariableStats(hitpoints: 1067, damage: 330, damagePerSecond: 194),
            VariableStats(hitpoints: 1172, damage: 363, damagePerSecond: 213),
            VariableStats(hitpoints: 1286, damage: 399, damagePerSecond: 234),
            VariableStats(hitpoints: 1415, damage: 438, damagePerSecond: 257)]
        case .hunter: return [
            VariableStats(hitpoints: 524, rangedDamage: 530),
            VariableStats(hitpoints: 576, rangedDamage: 580),
            VariableStats(hitpoints: 634, rangedDamage: 640),
            VariableStats(hitpoints: 696, rangedDamage: 700),
            VariableStats(hitpoints: 765, rangedDamage: 770),
            VariableStats(hitpoints: 838, rangedDamage: 840),
            VariableStats(hitpoints: 922, rangedDamage: 930),
            VariableStats(hitpoints: 1011, rangedDamage: 1020)]
        case .executioner: return [
            VariableStats(hitpoints: 760, areaDamage: 212),
            VariableStats(hitpoints: 836, areaDamage: 232),
            VariableStats(hitpoints: 919, areaDamage: 256),
            VariableStats(hitpoints: 1010, areaDamage: 280),
            VariableStats(hitpoints: 1109, areaDamage: 308),
            VariableStats(hitpoints: 1216, areaDamage: 338),
            VariableStats(hitpoints: 1337, areaDamage: 372),
            VariableStats(hitpoints: 1466, areaDamage: 408)]
        case .bandit: return [
            VariableStats(hitpoints: 750, damage: 160, damagePerSecond: 160, chargeDamage: 320),
            VariableStats(hitpoints: 825, damage: 176, damagePerSecond: 176, chargeDamage: 352),
            VariableStats(hitpoints: 907, damage: 193, damagePerSecond: 193, chargeDamage: 386),
            VariableStats(hitpoints: 997, damage: 212, damagePerSecond: 212, chargeDamage: 424),
            VariableStats(hitpoints: 1095, damage: 233, damagePerSecond: 233, chargeDamage: 466)]
        case .royalRecruits: return [
            VariableStats(hitpoints: 208, shieldHitpoints: 94, damage: 52, damagePerSecond: 40),
            VariableStats(hitpoints: 228, shieldHitpoints: 103, damage: 57, damagePerSecond: 43),
            VariableStats(hitpoints: 251, shieldHitpoints: 113, damage: 62, damagePerSecond: 47),
            VariableStats(hitpoints: 276, shieldHitpoints: 125, damage: 69, damagePerSecond: 53),
            VariableStats(hitpoints: 303, shieldHitpoints: 137, damage: 75, damagePerSecond: 57),
            VariableStats(hitpoints: 332, shieldHitpoints: 150, damage: 83, damagePerSecond: 63),
            VariableStats(hitpoints: 366, shieldHitpoints: 165, damage: 91, damagePerSecond: 70),
            VariableStats(hitpoints: 401, shieldHitpoints: 181, damage: 100, damagePerSecond: 76),
            VariableStats(hitpoints: 440, shieldHitpoints: 199, damage: 110, damagePerSecond: 84),
            VariableStats(hitpoints: 484, shieldHitpoints: 219, damage: 121, damagePerSecond: 93),
            VariableStats(hitpoints: 532, shieldHitpoints: 240, damage: 133, damagePerSecond: 102),
            VariableStats(hitpoints: 584, shieldHitpoints: 264, damage: 146, damagePerSecond: 112),
            VariableStats(hitpoints: 642, shieldHitpoints: 290, damage: 160, damagePerSecond: 123)]
        case .nightWitch: return [
            VariableStats(hitpoints: 750, damage: 260, damagePerSecond: 173, subTroopsLevel: 9),
            VariableStats(hitpoints: 854, damage: 286, damagePerSecond: 190, subTroopsLevel: 10),
            VariableStats(hitpoints: 907, damage: 314, damagePerSecond: 209, subTroopsLevel: 11),
            VariableStats(hitpoints: 997, damage: 345, damagePerSecond: 230, subTroopsLevel: 12),
            VariableStats(hitpoints: 1095, damage: 379, damagePerSecond: 252, subTroopsLevel: 13)]
        case .bats: return [
            VariableStats(hitpoints: 32, damage: 32, damagePerSecond: 29),
            VariableStats(hitpoints: 35, damage: 35, damagePerSecond: 31),
            VariableStats(hitpoints: 38, damage: 38, damagePerSecond: 35),
            VariableStats(hitpoints: 42, damage: 42, damagePerSecond: 38),
            VariableStats(hitpoints: 46, damage: 46, damagePerSecond: 42),
            VariableStats(hitpoints: 51, damage: 51, damagePerSecond: 46),
            VariableStats(hitpoints: 56, damage: 56, damagePerSecond: 50),
            VariableStats(hitpoints: 61, damage: 61, damagePerSecond: 55),
            VariableStats(hitpoints: 67, damage: 67, damagePerSecond: 60),
            VariableStats(hitpoints: 74, damage: 74, damagePerSecond: 67),
            VariableStats(hitpoints: 81, damage: 81, damagePerSecond: 74),
            VariableStats(hitpoints: 89, damage: 89, damagePerSecond: 81),
            VariableStats(hitpoints: 98, damage: 98, damagePerSecond: 89)]
        case .royalGhost: return [
            VariableStats(hitpoints: 1000, areaDamage: 216, damagePerSecond: 120),
            VariableStats(hitpoints: 1100, areaDamage: 237, damagePerSecond: 131),
            VariableStats(hitpoints: 1210, areaDamage: 261, damagePerSecond: 145),
            VariableStats(hitpoints: 1330, areaDamage: 287, damagePerSecond: 159),
            VariableStats(hitpoints: 1460, areaDamage: 315, damagePerSecond: 175)]
        case .ramRider: return [
            VariableStats(hitpoints: 1461, damage: 220, damagePerSecond: 122, chargeDamage: 440, subTroopsLevel: 9),
            VariableStats(hitpoints: 1607, damage: 242, damagePerSecond: 134, chargeDamage: 484, subTroopsLevel: 10),
            VariableStats(hitpoints: 1767, damage: 266, damagePerSecond: 148, chargeDamage: 532, subTroopsLevel: 11),
            VariableStats(hitpoints: 1943, damage: 292, damagePerSecond: 162, chargeDamage: 584, subTroopsLevel: 12),
            VariableStats(hitpoints: 2133, damage: 321, damagePerSecond: 178, chargeDamage: 642, subTroopsLevel: 13)]
        case .zappies: return [
            VariableStats(hitpoints: 250, damage: 55, damagePerSecond: 26),
            VariableStats(hitpoints: 275, damage: 60, damagePerSecond: 28),
            VariableStats(hitpoints: 302, damage: 66, damagePerSecond: 31),
            VariableStats(hitpoints: 332, damage: 73, damagePerSecond: 34),
            VariableStats(hitpoints: 365, damage: 80, damagePerSecond: 38),
            VariableStats(hitpoints: 400, damage: 88, damagePerSecond: 41),
            VariableStats(hitpoints: 440, damage: 96, damagePerSecond: 45),
            VariableStats(hitpoints: 482, damage: 106, damagePerSecond: 50),
            VariableStats(hitpoints: 530, damage: 116, damagePerSecond: 55),
            VariableStats(hitpoints: 582, damage: 128, damagePerSecond: 60),
            VariableStats(hitpoints: 640, damage: 140, damagePerSecond: 66)]
        case .rascals: return [
            VariableStats(subTroopsLevel: 1),
            VariableStats(subTroopsLevel: 2),
            VariableStats(subTroopsLevel: 3),
            VariableStats(subTroopsLevel: 4),
            VariableStats(subTroopsLevel: 5),
            VariableStats(subTroopsLevel: 6),
            VariableStats(subTroopsLevel: 7),
            VariableStats(subTroopsLevel: 8),
            VariableStats(subTroopsLevel: 9),
            VariableStats(subTroopsLevel: 10),
            VariableStats(subTroopsLevel: 11),
            VariableStats(subTroopsLevel: 12),
            VariableStats(subTroopsLevel: 13)]
        case .cannonCart: return [
            VariableStats(hitpoints: 558, shieldHitpoints: 558, rangedDamage: 133),
            VariableStats(hitpoints: 613, shieldHitpoints: 613, rangedDamage: 146),
            VariableStats(hitpoints: 675, shieldHitpoints: 675, rangedDamage: 160),
            VariableStats(hitpoints: 742, shieldHitpoints: 742, rangedDamage: 176),
            VariableStats(hitpoints: 814, shieldHitpoints: 814, rangedDamage: 193),
            VariableStats(hitpoints: 892, shieldHitpoints: 892, rangedDamage: 214),
            VariableStats(hitpoints: 982, shieldHitpoints: 982, rangedDamage: 234),
            VariableStats(hitpoints: 1076, shieldHitpoints: 1076, rangedDamage: 256)]
        case .megaKnight: return [
            // damagePerSecond doesnt fit when showing stats to user
            VariableStats(hitpoints: 3300, areaDamage: 222, /*damagePerSecond: 130, */spawnDamage: 444, chargeDamage: 444),
            VariableStats(hitpoints: 3630, areaDamage: 244, /*damagePerSecond: 142, */spawnDamage: 488, chargeDamage: 488),
            VariableStats(hitpoints: 3993, areaDamage: 268, /*damagePerSecond: 157, */spawnDamage: 537, chargeDamage: 537),
            VariableStats(hitpoints: 4389, areaDamage: 295, /*damagePerSecond: 172, */spawnDamage: 590, chargeDamage: 590),
            VariableStats(hitpoints: 4818, areaDamage: 324, /*damagePerSecond: 190, */spawnDamage: 648, chargeDamage: 648)]
        case .skeletonBarrel: return [
            VariableStats(hitpoints: 255, deathDamage: 52, subTroopsLevel: 1),
            VariableStats(hitpoints: 280, deathDamage: 57, subTroopsLevel: 2),
            VariableStats(hitpoints: 308, deathDamage: 62, subTroopsLevel: 3),
            VariableStats(hitpoints: 339, deathDamage: 69, subTroopsLevel: 4),
            VariableStats(hitpoints: 372, deathDamage: 75, subTroopsLevel: 5),
            VariableStats(hitpoints: 408, deathDamage: 83, subTroopsLevel: 6),
            VariableStats(hitpoints: 448, deathDamage: 91, subTroopsLevel: 7),
            VariableStats(hitpoints: 492, deathDamage: 100, subTroopsLevel: 8),
            VariableStats(hitpoints: 540, deathDamage: 110, subTroopsLevel: 9),
            VariableStats(hitpoints: 594, deathDamage: 121, subTroopsLevel: 10),
            VariableStats(hitpoints: 652, deathDamage: 133, subTroopsLevel: 11),
            VariableStats(hitpoints: 716, deathDamage: 146, subTroopsLevel: 12),
            VariableStats(hitpoints: 787, deathDamage: 160, subTroopsLevel: 13)]
        case .flyingMachine: return [
            VariableStats(hitpoints: 290, rangedDamage: 81),
            VariableStats(hitpoints: 319, rangedDamage: 89),
            VariableStats(hitpoints: 350, rangedDamage: 98),
            VariableStats(hitpoints: 385, rangedDamage: 107),
            VariableStats(hitpoints: 423, rangedDamage: 118),
            VariableStats(hitpoints: 464, rangedDamage: 129),
            VariableStats(hitpoints: 510, rangedDamage: 142),
            VariableStats(hitpoints: 559, rangedDamage: 156),
            VariableStats(hitpoints: 614, rangedDamage: 171),
            VariableStats(hitpoints: 675, rangedDamage: 188),
            VariableStats(hitpoints: 742, rangedDamage: 207)]
        case .wallBreakers: return [
            VariableStats(hitpoints: 207, areaDamage: 245),
            VariableStats(hitpoints: 228, areaDamage: 269),
            VariableStats(hitpoints: 250, areaDamage: 295),
            VariableStats(hitpoints: 275, areaDamage: 325),
            VariableStats(hitpoints: 302, areaDamage: 357),
            VariableStats(hitpoints: 332, areaDamage: 392),
            VariableStats(hitpoints: 364, areaDamage: 430),
            VariableStats(hitpoints: 400, areaDamage: 473)]
        case .royalHogs: return [
            VariableStats(hitpoints: 395, damage: 34, damagePerSecond: 28),
            VariableStats(hitpoints: 434, damage: 37, damagePerSecond: 30),
            VariableStats(hitpoints: 477, damage: 41, damagePerSecond: 34),
            VariableStats(hitpoints: 525, damage: 45, damagePerSecond: 37),
            VariableStats(hitpoints: 576, damage: 49, damagePerSecond: 40),
            VariableStats(hitpoints: 632, damage: 54, damagePerSecond: 45),
            VariableStats(hitpoints: 695, damage: 59, damagePerSecond: 49),
            VariableStats(hitpoints: 762, damage: 65, damagePerSecond: 54),
            VariableStats(hitpoints: 837, damage: 72, damagePerSecond: 60),
            VariableStats(hitpoints: 920, damage: 79, damagePerSecond: 65),
            VariableStats(hitpoints: 1011, damage: 87, damagePerSecond: 72)]
        case .goblinGiant: return [
            VariableStats(hitpoints: 1967, damage: 110, damagePerSecond: 64, subTroopsLevel: 6),
            VariableStats(hitpoints: 2164, damage: 121, damagePerSecond: 71, subTroopsLevel: 7),
            VariableStats(hitpoints: 2380, damage: 133, damagePerSecond: 78, subTroopsLevel: 8),
            VariableStats(hitpoints: 2616, damage: 146, damagePerSecond: 85, subTroopsLevel: 9),
            VariableStats(hitpoints: 2871, damage: 160, damagePerSecond: 94, subTroopsLevel: 10),
            VariableStats(hitpoints: 3147, damage: 176, damagePerSecond: 103, subTroopsLevel: 11),
            VariableStats(hitpoints: 3461, damage: 193, damagePerSecond: 113, subTroopsLevel: 12),
            VariableStats(hitpoints: 3796, damage: 212, damagePerSecond: 124, subTroopsLevel: 13)]
        case .fisherman: return [
            VariableStats(hitpoints: 800, damage: 160, damagePerSecond: 106),
            VariableStats(hitpoints: 880, damage: 176, damagePerSecond: 117),
            VariableStats(hitpoints: 986, damage: 193, damagePerSecond: 128),
            VariableStats(hitpoints: 1064, damage: 212, damagePerSecond: 141),
            VariableStats(hitpoints: 1168, damage: 233, damagePerSecond: 155)]
        case .magicArcher: return [
            VariableStats(hitpoints: 440, areaDamage: 111),
            VariableStats(hitpoints: 484, areaDamage: 122),
            VariableStats(hitpoints: 532, areaDamage: 134),
            VariableStats(hitpoints: 585, areaDamage: 147),
            VariableStats(hitpoints: 642, areaDamage: 162)]
        case .electroDragon: return [
            VariableStats(hitpoints: 594, rangedDamage: 120),
            VariableStats(hitpoints: 653, rangedDamage: 132),
            VariableStats(hitpoints: 718, rangedDamage: 145),
            VariableStats(hitpoints: 790, rangedDamage: 159),
            VariableStats(hitpoints: 867, rangedDamage: 175),
            VariableStats(hitpoints: 950, rangedDamage: 192),
            VariableStats(hitpoints: 1045, rangedDamage: 211),
            VariableStats(hitpoints: 1146, rangedDamage: 231)]
        case .cannon: return [
            VariableStats(hitpoints: 350, rangedDamage: 83),
            VariableStats(hitpoints: 385, rangedDamage: 91),
            VariableStats(hitpoints: 423, rangedDamage: 100),
            VariableStats(hitpoints: 465, rangedDamage: 110),
            VariableStats(hitpoints: 511, rangedDamage: 121),
            VariableStats(hitpoints: 560, rangedDamage: 132),
            VariableStats(hitpoints: 616, rangedDamage: 146),
            VariableStats(hitpoints: 675, rangedDamage: 160),
            VariableStats(hitpoints: 742, rangedDamage: 175),
            VariableStats(hitpoints: 815, rangedDamage: 193),
            VariableStats(hitpoints: 896, rangedDamage: 212),
            VariableStats(hitpoints: 983, rangedDamage: 233),
            VariableStats(hitpoints: 1081, rangedDamage: 256)]
        case .goblinHut: return [
            VariableStats(hitpoints: 480, subTroopsLevel: 3),
            VariableStats(hitpoints: 528, subTroopsLevel: 4),
            VariableStats(hitpoints: 580, subTroopsLevel: 5),
            VariableStats(hitpoints: 638, subTroopsLevel: 6),
            VariableStats(hitpoints: 700, subTroopsLevel: 7),
            VariableStats(hitpoints: 768, subTroopsLevel: 8),
            VariableStats(hitpoints: 844, subTroopsLevel: 9),
            VariableStats(hitpoints: 926, subTroopsLevel: 10),
            VariableStats(hitpoints: 1017, subTroopsLevel: 11),
            VariableStats(hitpoints: 1118, subTroopsLevel: 12),
            VariableStats(hitpoints: 1228, subTroopsLevel: 13)]
        case .mortar: return [
            VariableStats(hitpoints: 575, areaDamage: 104),
            VariableStats(hitpoints: 632, areaDamage: 114),
            VariableStats(hitpoints: 695, areaDamage: 126),
            VariableStats(hitpoints: 764, areaDamage: 138),
            VariableStats(hitpoints: 839, areaDamage: 152),
            VariableStats(hitpoints: 920, areaDamage: 166),
            VariableStats(hitpoints: 1012, areaDamage: 183),
            VariableStats(hitpoints: 1109, areaDamage: 201),
            VariableStats(hitpoints: 1219, areaDamage: 220),
            VariableStats(hitpoints: 1339, areaDamage: 242),
            VariableStats(hitpoints: 1472, areaDamage: 266),
            VariableStats(hitpoints: 1615, areaDamage: 292),
            VariableStats(hitpoints: 1776, areaDamage: 321)]
        case .infernoTower: return [
            VariableStats(hitpoints: 825, expDamage: "20-400", expDamagePerSecond: "50-1000"),
            VariableStats(hitpoints: 907, expDamage: "22-440", expDamagePerSecond: "55-1100"),
            VariableStats(hitpoints: 998, expDamage: "24-484", expDamagePerSecond: "60-1210"),
            VariableStats(hitpoints: 1097, expDamage: "26-532", expDamagePerSecond: "65-1330"),
            VariableStats(hitpoints: 1204, expDamage: "29-584", expDamagePerSecond: "72-1460"),
            VariableStats(hitpoints: 1320, expDamage: "32-640", expDamagePerSecond: "80-1600"),
            VariableStats(hitpoints: 1452, expDamage: "35-704", expDamagePerSecond: "87-1760"),
            VariableStats(hitpoints: 1592, expDamage: "38-772", expDamagePerSecond: "95-1930"),
            VariableStats(hitpoints: 1749, expDamage: "42-848", expDamagePerSecond: "105-2120"),
            VariableStats(hitpoints: 1922, expDamage: "46-932", expDamagePerSecond: "115-2330"),
            VariableStats(hitpoints: 2112, expDamage: "51-1024", expDamagePerSecond: "127-2560")]
        case .bombTower: return [
            VariableStats(hitpoints: 640, areaDamage: 105, deathDamage: 210),
            VariableStats(hitpoints: 704, areaDamage: 115, deathDamage: 231),
            VariableStats(hitpoints: 774, areaDamage: 127, deathDamage: 254),
            VariableStats(hitpoints: 851, areaDamage: 139, deathDamage: 279),
            VariableStats(hitpoints: 934, areaDamage: 153, deathDamage: 306),
            VariableStats(hitpoints: 1024, areaDamage: 168, deathDamage: 336),
            VariableStats(hitpoints: 1126, areaDamage: 184, deathDamage: 369),
            VariableStats(hitpoints: 1235, areaDamage: 202, deathDamage: 405),
            VariableStats(hitpoints: 1356, areaDamage: 222, deathDamage: 445),
            VariableStats(hitpoints: 1491, areaDamage: 244, deathDamage: 489),
            VariableStats(hitpoints: 1638, areaDamage: 268, deathDamage: 537)]
        case .barbarianHut: return [
            VariableStats(hitpoints: 825, subTroopsLevel: 3),
            VariableStats(hitpoints: 907, subTroopsLevel: 4),
            VariableStats(hitpoints: 998, subTroopsLevel: 5),
            VariableStats(hitpoints: 1097, subTroopsLevel: 6),
            VariableStats(hitpoints: 1204, subTroopsLevel: 7),
            VariableStats(hitpoints: 1320, subTroopsLevel: 8),
            VariableStats(hitpoints: 1452, subTroopsLevel: 9),
            VariableStats(hitpoints: 1592, subTroopsLevel: 10),
            VariableStats(hitpoints: 1749, subTroopsLevel: 11),
            VariableStats(hitpoints: 1922, subTroopsLevel: 12),
            VariableStats(hitpoints: 2112, subTroopsLevel: 13)]
        case .tesla: return [
            VariableStats(hitpoints: 450, damage: 90, damagePerSecond: 81),
            VariableStats(hitpoints: 495, damage: 99, damagePerSecond: 90),
            VariableStats(hitpoints: 544, damage: 108, damagePerSecond: 98),
            VariableStats(hitpoints: 598, damage: 119, damagePerSecond: 108),
            VariableStats(hitpoints: 657, damage: 131, damagePerSecond: 119),
            VariableStats(hitpoints: 720, damage: 144, damagePerSecond: 130),
            VariableStats(hitpoints: 792, damage: 158, damagePerSecond: 143),
            VariableStats(hitpoints: 868, damage: 173, damagePerSecond: 157),
            VariableStats(hitpoints: 954, damage: 190, damagePerSecond: 172),
            VariableStats(hitpoints: 1048, damage: 209, damagePerSecond: 190),
            VariableStats(hitpoints: 1152, damage: 230, damagePerSecond: 209),
            VariableStats(hitpoints: 1264, damage: 252, damagePerSecond: 229),
            VariableStats(hitpoints: 1390, damage: 278, damagePerSecond: 252)]
        case .elixirCollector: return [
            VariableStats(hitpoints: 505),
            VariableStats(hitpoints: 555),
            VariableStats(hitpoints: 611),
            VariableStats(hitpoints: 671),
            VariableStats(hitpoints: 737),
            VariableStats(hitpoints: 808),
            VariableStats(hitpoints: 888),
            VariableStats(hitpoints: 974),
            VariableStats(hitpoints: 1070),
            VariableStats(hitpoints: 1176),
            VariableStats(hitpoints: 1292)]
        case .xBow: return [
            VariableStats(hitpoints: 1040, rangedDamage: 20),
            VariableStats(hitpoints: 1144, rangedDamage: 22),
            VariableStats(hitpoints: 1258, rangedDamage: 24),
            VariableStats(hitpoints: 1383, rangedDamage: 26),
            VariableStats(hitpoints: 1518, rangedDamage: 29),
            VariableStats(hitpoints: 1664, rangedDamage: 32),
            VariableStats(hitpoints: 1830, rangedDamage: 35),
            VariableStats(hitpoints: 2007, rangedDamage: 38)]
        case .tombstone: return [
            VariableStats(hitpoints: 240, subTroopsLevel: 3),
            VariableStats(hitpoints: 264, subTroopsLevel: 4),
            VariableStats(hitpoints: 290, subTroopsLevel: 5),
            VariableStats(hitpoints: 319, subTroopsLevel: 6),
            VariableStats(hitpoints: 350, subTroopsLevel: 7),
            VariableStats(hitpoints: 384, subTroopsLevel: 8),
            VariableStats(hitpoints: 422, subTroopsLevel: 9),
            VariableStats(hitpoints: 462, subTroopsLevel: 10),
            VariableStats(hitpoints: 508, subTroopsLevel: 11),
            VariableStats(hitpoints: 558, subTroopsLevel: 12),
            VariableStats(hitpoints: 614, subTroopsLevel: 13)]
        case .furnace: return [
            VariableStats(hitpoints: 480, subTroopsLevel: 3),
            VariableStats(hitpoints: 525, subTroopsLevel: 4),
            VariableStats(hitpoints: 580, subTroopsLevel: 5),
            VariableStats(hitpoints: 638, subTroopsLevel: 6),
            VariableStats(hitpoints: 700, subTroopsLevel: 7),
            VariableStats(hitpoints: 768, subTroopsLevel: 8),
            VariableStats(hitpoints: 844, subTroopsLevel: 9),
            VariableStats(hitpoints: 926, subTroopsLevel: 10),
            VariableStats(hitpoints: 1017, subTroopsLevel: 11),
            VariableStats(hitpoints: 1118, subTroopsLevel: 12),
            VariableStats(hitpoints: 1228, subTroopsLevel: 13)]
        case .goblinCage: return [
            VariableStats(hitpoints: 455, subTroopsLevel: 3),
            VariableStats(hitpoints: 500, subTroopsLevel: 4),
            VariableStats(hitpoints: 550, subTroopsLevel: 5),
            VariableStats(hitpoints: 605, subTroopsLevel: 6),
            VariableStats(hitpoints: 664, subTroopsLevel: 7),
            VariableStats(hitpoints: 728, subTroopsLevel: 8),
            VariableStats(hitpoints: 800, subTroopsLevel: 9),
            VariableStats(hitpoints: 878, subTroopsLevel: 10),
            VariableStats(hitpoints: 964, subTroopsLevel: 11),
            VariableStats(hitpoints: 1060, subTroopsLevel: 12),
            VariableStats(hitpoints: 1164, subTroopsLevel: 13)]
        case .fireball: return [
            VariableStats(areaDamage: 325, crownTowerDamage: 98),
            VariableStats(areaDamage: 357, crownTowerDamage: 110),
            VariableStats(areaDamage: 393, crownTowerDamage: 118),
            VariableStats(areaDamage: 432, crownTowerDamage: 130),
            VariableStats(areaDamage: 474, crownTowerDamage: 143),
            VariableStats(areaDamage: 520, crownTowerDamage: 156),
            VariableStats(areaDamage: 572, crownTowerDamage: 172),
            VariableStats(areaDamage: 627, crownTowerDamage: 189),
            VariableStats(areaDamage: 689, crownTowerDamage: 207),
            VariableStats(areaDamage: 757, crownTowerDamage: 228),
            VariableStats(areaDamage: 832, crownTowerDamage: 250)]
        case .arrows: return [
            VariableStats(damage: 144, crownTowerDamage: 45),
            VariableStats(damage: 156, crownTowerDamage: 48),
            VariableStats(damage: 166, crownTowerDamage: 54),
            VariableStats(damage: 189, crownTowerDamage: 57),
            VariableStats(damage: 210, crownTowerDamage: 63),
            VariableStats(damage: 228, crownTowerDamage: 69),
            VariableStats(damage: 252, crownTowerDamage: 78),
            VariableStats(damage: 276, crownTowerDamage: 84),
            VariableStats(damage: 303, crownTowerDamage: 93),
            VariableStats(damage: 333, crownTowerDamage: 102),
            VariableStats(damage: 366, crownTowerDamage: 111),
            VariableStats(damage: 402, crownTowerDamage: 123),
            VariableStats(damage: 444, crownTowerDamage: 135)]
        case .rage: return [
            VariableStats(duration: 6.0),
            VariableStats(duration: 6.5),
            VariableStats(duration: 7.0),
            VariableStats(duration: 7.5),
            VariableStats(duration: 8.0),
            VariableStats(duration: 8.5),
            VariableStats(duration: 9.0),
            VariableStats(duration: 9.5)]
        case .rocket: return [
            VariableStats(areaDamage: 700, crownTowerDamage: 210),
            VariableStats(areaDamage: 770, crownTowerDamage: 231),
            VariableStats(areaDamage: 847, crownTowerDamage: 255),
            VariableStats(areaDamage: 931, crownTowerDamage: 280),
            VariableStats(areaDamage: 1022, crownTowerDamage: 307),
            VariableStats(areaDamage: 1120, crownTowerDamage: 336),
            VariableStats(areaDamage: 1232, crownTowerDamage: 370),
            VariableStats(areaDamage: 1351, crownTowerDamage: 406),
            VariableStats(areaDamage: 1484, crownTowerDamage: 446),
            VariableStats(areaDamage: 1631, crownTowerDamage: 490),
            VariableStats(areaDamage: 1792, crownTowerDamage: 538)]
        case .goblinBarrel: return [
            VariableStats(subTroopsLevel: 6),
            VariableStats(subTroopsLevel: 7),
            VariableStats(subTroopsLevel: 8),
            VariableStats(subTroopsLevel: 9),
            VariableStats(subTroopsLevel: 10),
            VariableStats(subTroopsLevel: 11),
            VariableStats(subTroopsLevel: 12),
            VariableStats(subTroopsLevel: 13)]
        case .freeze: return [
            VariableStats(areaDamage: 72, crownTowerDamage: 22),
            VariableStats(areaDamage: 79, crownTowerDamage: 24),
            VariableStats(areaDamage: 87, crownTowerDamage: 27),
            VariableStats(areaDamage: 95, crownTowerDamage: 29),
            VariableStats(areaDamage: 105, crownTowerDamage: 32),
            VariableStats(areaDamage: 115, crownTowerDamage: 35),
            VariableStats(areaDamage: 126, crownTowerDamage: 38),
            VariableStats(areaDamage: 138, crownTowerDamage: 42)]
        case .mirror: return [
            VariableStats(clonedOrMirroredCardsLevel: 7),
            VariableStats(clonedOrMirroredCardsLevel: 8),
            VariableStats(clonedOrMirroredCardsLevel: 9),
            VariableStats(clonedOrMirroredCardsLevel: 10),
            VariableStats(clonedOrMirroredCardsLevel: 11),
            VariableStats(clonedOrMirroredCardsLevel: 12),
            VariableStats(clonedOrMirroredCardsLevel: 13),
            VariableStats(clonedOrMirroredCardsLevel: 14)]
        case .lightning: return [
            VariableStats(damage: 660, crownTowerDamage: 198),
            VariableStats(damage: 726, crownTowerDamage: 218),
            VariableStats(damage: 798, crownTowerDamage: 240),
            VariableStats(damage: 877, crownTowerDamage: 264),
            VariableStats(damage: 963, crownTowerDamage: 289),
            VariableStats(damage: 1056, crownTowerDamage: 317),
            VariableStats(damage: 1161, crownTowerDamage: 349),
            VariableStats(damage: 1273, crownTowerDamage: 382)]
        case .zap: return [
            VariableStats(areaDamage: 75, crownTowerDamage: 23),
            VariableStats(areaDamage: 82, crownTowerDamage: 25),
            VariableStats(areaDamage: 90, crownTowerDamage: 27),
            VariableStats(areaDamage: 99, crownTowerDamage: 30),
            VariableStats(areaDamage: 109, crownTowerDamage: 33),
            VariableStats(areaDamage: 120, crownTowerDamage: 36),
            VariableStats(areaDamage: 132, crownTowerDamage: 40),
            VariableStats(areaDamage: 144, crownTowerDamage: 44),
            VariableStats(areaDamage: 159, crownTowerDamage: 48),
            VariableStats(areaDamage: 174, crownTowerDamage: 53),
            VariableStats(areaDamage: 192, crownTowerDamage: 58),
            VariableStats(areaDamage: 210, crownTowerDamage: 63),
            VariableStats(areaDamage: 231, crownTowerDamage: 70)]
        case .poison: return [
            VariableStats(damagePerSecond: 57, crownTowerDamage: 144, crownTowerDamagePerSecond: 18),
            VariableStats(damagePerSecond: 62, crownTowerDamage: 152, crownTowerDamagePerSecond: 19),
            VariableStats(damagePerSecond: 68, crownTowerDamage: 168, crownTowerDamagePerSecond: 21),
            VariableStats(damagePerSecond: 75, crownTowerDamage: 184, crownTowerDamagePerSecond: 23),
            VariableStats(damagePerSecond: 83, crownTowerDamage: 200, crownTowerDamagePerSecond: 25),
            VariableStats(damagePerSecond: 91, crownTowerDamage: 224, crownTowerDamagePerSecond: 28),
            VariableStats(damagePerSecond: 100, crownTowerDamage: 240, crownTowerDamagePerSecond: 30),
            VariableStats(damagePerSecond: 110, crownTowerDamage: 264, crownTowerDamagePerSecond: 33)]
        case .graveyard: return [
            VariableStats(subTroopsLevel: 9),
            VariableStats(subTroopsLevel: 10),
            VariableStats(subTroopsLevel: 11),
            VariableStats(subTroopsLevel: 12),
            VariableStats(subTroopsLevel: 13)]
        case .theLog: return [
            VariableStats(areaDamage: 240, crownTowerDamage: 72),
            VariableStats(areaDamage: 264, crownTowerDamage: 80),
            VariableStats(areaDamage: 290, crownTowerDamage: 87),
            VariableStats(areaDamage: 319, crownTowerDamage: 96),
            VariableStats(areaDamage: 350, crownTowerDamage: 105)]
        case .tornado: return [
            VariableStats(damagePerSecond: 106, crownTowerDamage: 36),
            VariableStats(damagePerSecond: 116, crownTowerDamage: 40),
            VariableStats(damagePerSecond: 128, crownTowerDamage: 44),
            VariableStats(damagePerSecond: 140, crownTowerDamage: 48),
            VariableStats(damagePerSecond: 154, crownTowerDamage: 54),
            VariableStats(damagePerSecond: 169, crownTowerDamage: 58),
            VariableStats(damagePerSecond: 186, crownTowerDamage: 64),
            VariableStats(damagePerSecond: 204, crownTowerDamage: 70)]
        case .clone: return [
            VariableStats(clonedOrMirroredCardsLevel: 6),
            VariableStats(clonedOrMirroredCardsLevel: 7),
            VariableStats(clonedOrMirroredCardsLevel: 8),
            VariableStats(clonedOrMirroredCardsLevel: 9),
            VariableStats(clonedOrMirroredCardsLevel: 10),
            VariableStats(clonedOrMirroredCardsLevel: 11),
            VariableStats(clonedOrMirroredCardsLevel: 12),
            VariableStats(clonedOrMirroredCardsLevel: 13)]
        case .earthquake: return [
            VariableStats(damagePerSecond: 39, buildingDamagePerSecond: 106),
            VariableStats(damagePerSecond: 42, buildingDamagePerSecond: 116),
            VariableStats(damagePerSecond: 47, buildingDamagePerSecond: 128),
            VariableStats(damagePerSecond: 51, buildingDamagePerSecond: 140),
            VariableStats(damagePerSecond: 56, buildingDamagePerSecond: 154),
            VariableStats(damagePerSecond: 62, buildingDamagePerSecond: 169),
            VariableStats(damagePerSecond: 68, buildingDamagePerSecond: 186),
            VariableStats(damagePerSecond: 75, buildingDamagePerSecond: 204),
            VariableStats(damagePerSecond: 82, buildingDamagePerSecond: 224),
            VariableStats(damagePerSecond: 90, buildingDamagePerSecond: 246),
            VariableStats(damagePerSecond: 99, buildingDamagePerSecond: 271)]
        case .barbarianBarrel: return [
            VariableStats(areaDamage: 151, subTroopsLevel: 6),
            VariableStats(areaDamage: 166, subTroopsLevel: 7),
            VariableStats(areaDamage: 182, subTroopsLevel: 8),
            VariableStats(areaDamage: 200, subTroopsLevel: 9),
            VariableStats(areaDamage: 220, subTroopsLevel: 10),
            VariableStats(areaDamage: 241, subTroopsLevel: 11),
            VariableStats(areaDamage: 265, subTroopsLevel: 12),
            VariableStats(areaDamage: 291, subTroopsLevel: 13)]
        case .healSpirit: return [
            VariableStats(hitpoints: 109, damage: 52, healing: 189),
            VariableStats(hitpoints: 119, damage: 57, healing: 207),
            VariableStats(hitpoints: 131, damage: 62, healing: 228),
            VariableStats(hitpoints: 144, damage: 69, healing: 251),
            VariableStats(hitpoints: 159, damage: 75, healing: 275),
            VariableStats(hitpoints: 174, damage: 83, healing: 302),
            VariableStats(hitpoints: 191, damage: 91, healing: 332),
            VariableStats(hitpoints: 210, damage: 100, healing: 364),
            VariableStats(hitpoints: 231, damage: 110, healing: 400),
            VariableStats(hitpoints: 253, damage: 121, healing: 440),
            VariableStats(hitpoints: 279, damage: 133, healing: 483)]
        case .giantSnowball: return [
            VariableStats(areaDamage: 75, crownTowerDamage: 23),
            VariableStats(areaDamage: 82, crownTowerDamage: 25),
            VariableStats(areaDamage: 90, crownTowerDamage: 27),
            VariableStats(areaDamage: 99, crownTowerDamage: 30),
            VariableStats(areaDamage: 109, crownTowerDamage: 33),
            VariableStats(areaDamage: 120, crownTowerDamage: 36),
            VariableStats(areaDamage: 132, crownTowerDamage: 40),
            VariableStats(areaDamage: 144, crownTowerDamage: 44),
            VariableStats(areaDamage: 159, crownTowerDamage: 48),
            VariableStats(areaDamage: 174, crownTowerDamage: 53),
            VariableStats(areaDamage: 192, crownTowerDamage: 58),
            VariableStats(areaDamage: 210, crownTowerDamage: 63),
            VariableStats(areaDamage: 231, crownTowerDamage: 70)]
        case .elixirGolem: return [
            VariableStats(hitpoints: 680, damage: 120, damagePerSecond: 92, subTroopsLevel: 3),
            VariableStats(hitpoints: 748, damage: 132, damagePerSecond: 101, subTroopsLevel: 4),
            VariableStats(hitpoints: 822, damage: 145, damagePerSecond: 111, subTroopsLevel: 5),
            VariableStats(hitpoints: 905, damage: 159, damagePerSecond: 122, subTroopsLevel: 6),
            VariableStats(hitpoints: 992, damage: 175, damagePerSecond: 134, subTroopsLevel: 7),
            VariableStats(hitpoints: 1088, damage: 192, damagePerSecond: 147, subTroopsLevel: 8),
            VariableStats(hitpoints: 1196, damage: 211, damagePerSecond: 162, subTroopsLevel: 9),
            VariableStats(hitpoints: 1312, damage: 231, damagePerSecond: 178, subTroopsLevel: 10),
            VariableStats(hitpoints: 1441, damage: 254, damagePerSecond: 195, subTroopsLevel: 11),
            VariableStats(hitpoints: 1584, damage: 279, damagePerSecond: 214, subTroopsLevel: 12),
            VariableStats(hitpoints: 1740, damage: 307, damagePerSecond: 236, subTroopsLevel: 13)]
        case .battleHealer: return [
            VariableStats(hitpoints: 810, damage: 70, damagePerSecond: 46),
            VariableStats(hitpoints: 891, damage: 77, damagePerSecond: 51),
            VariableStats(hitpoints: 980, damage: 84, damagePerSecond: 56),
            VariableStats(hitpoints: 1077, damage: 93, damagePerSecond: 62),
            VariableStats(hitpoints: 1182, damage: 102, damagePerSecond: 68),
            VariableStats(hitpoints: 1296, damage: 112, damagePerSecond: 74),
            VariableStats(hitpoints: 1425, damage: 123, damagePerSecond: 82),
            VariableStats(hitpoints: 1563, damage: 135, damagePerSecond: 90),
            VariableStats(hitpoints: 1717, damage: 148, damagePerSecond: 98),
            VariableStats(hitpoints: 1887, damage: 163, damagePerSecond: 108),
            VariableStats(hitpoints: 2073, damage: 179, damagePerSecond: 119)]
        case .firecracker: return [
            VariableStats(hitpoints: 119, rangedDamage: 125),
            VariableStats(hitpoints: 130, rangedDamage: 135),
            VariableStats(hitpoints: 143, rangedDamage: 150),
            VariableStats(hitpoints: 158, rangedDamage: 165),
            VariableStats(hitpoints: 173, rangedDamage: 180),
            VariableStats(hitpoints: 190, rangedDamage: 200),
            VariableStats(hitpoints: 209, rangedDamage: 220),
            VariableStats(hitpoints: 229, rangedDamage: 240),
            VariableStats(hitpoints: 252, rangedDamage: 265),
            VariableStats(hitpoints: 276, rangedDamage: 290),
            VariableStats(hitpoints: 304, rangedDamage: 320),
            VariableStats(hitpoints: 334, rangedDamage: 350),
            VariableStats(hitpoints: 367, rangedDamage: 385)]
        case .royalDelivery: return [
            VariableStats(areaDamage: 171),
            VariableStats(areaDamage: 188),
            VariableStats(areaDamage: 206),
            VariableStats(areaDamage: 227),
            VariableStats(areaDamage: 249),
            VariableStats(areaDamage: 273),
            VariableStats(areaDamage: 300),
            VariableStats(areaDamage: 330),
            VariableStats(areaDamage: 362),
            VariableStats(areaDamage: 398),
            VariableStats(areaDamage: 437),
            VariableStats(areaDamage: 480),
            VariableStats(areaDamage: 528)]
        case .skeletonDragons: return [
            VariableStats(hitpoints: 208, areaDamage: 63),
            VariableStats(hitpoints: 228, areaDamage: 69),
            VariableStats(hitpoints: 251, areaDamage: 76),
            VariableStats(hitpoints: 276, areaDamage: 83),
            VariableStats(hitpoints: 303, areaDamage: 91),
            VariableStats(hitpoints: 332, areaDamage: 100),
            VariableStats(hitpoints: 366, areaDamage: 110),
            VariableStats(hitpoints: 401, areaDamage: 121),
            VariableStats(hitpoints: 440, areaDamage: 133),
            VariableStats(hitpoints: 484, areaDamage: 146),
            VariableStats(hitpoints: 532, areaDamage: 161),
            VariableStats(hitpoints: 584, areaDamage: 177),
            VariableStats(hitpoints: 642, areaDamage: 194)]
        case .electroGiant: return [
            VariableStats(hitpoints: 2400, damage: 120, damagePerSecond: 57),
            VariableStats(hitpoints: 2640, damage: 132, damagePerSecond: 62),
            VariableStats(hitpoints: 2904, damage: 145, damagePerSecond: 68),
            VariableStats(hitpoints: 3192, damage: 159, damagePerSecond: 75),
            VariableStats(hitpoints: 3504, damage: 175, damagePerSecond: 83),
            VariableStats(hitpoints: 3840, damage: 192, damagePerSecond: 91),
            VariableStats(hitpoints: 4224, damage: 211, damagePerSecond: 100),
            VariableStats(hitpoints: 4632, damage: 231, damagePerSecond: 110)]
        case .electroSpirit: #warning("Check This")
            return [
            VariableStats(hitpoints: 90, areaDamage: 43),
            VariableStats(hitpoints: 99, areaDamage: 47),
            VariableStats(hitpoints: 108, areaDamage: 52),
            VariableStats(hitpoints: 119, areaDamage: 57),
            VariableStats(hitpoints: 131, areaDamage: 62),
            VariableStats(hitpoints: 144, areaDamage: 68),
            VariableStats(hitpoints: 158, areaDamage: 75),
            VariableStats(hitpoints: 173, areaDamage: 82),
            VariableStats(hitpoints: 190, areaDamage: 91),
            VariableStats(hitpoints: 209, areaDamage: 100),
            VariableStats(hitpoints: 230, areaDamage: 110),
            VariableStats(hitpoints: 252, areaDamage: 120),
            VariableStats(hitpoints: 278, areaDamage: 132)]
        }
    }
}

// these are to change variable stats to a user-readeable form
// that i can make the UI with

extension Array where Element == DataSet.CardVariableStats {
    func convertToKeyValuePairs() -> [StringArrayOfStringPair] {
        let keys = variableStatsKeys(stats: self)
        let values = variableStatsValues(stats: self)
        
        var pairs = [StringArrayOfStringPair]()
        for (idx, value) in values.enumerated() {
            pairs.append(.init(key: keys[idx], values: value))
        }
        
        return pairs
    }
}

private func variableStatsValues(stats: [DataSet.CardVariableStats]) -> [[String]] {
    
    var allValues: [[String]] = []
    
    func appendValues(_ intPath: KeyPath<DataSet.CardVariableStats, Int>, doesntMatter: Int = 0) {
        if stats[0][keyPath: intPath] != .init() {
            var values: [String] = []
            
            for idx in stats.indices {
                values.append("\(stats[idx][keyPath: intPath])")
            }
            allValues.append(values)
        }
    }
    
    func appendValues(_ stringPath: KeyPath<DataSet.CardVariableStats, String>, arbitraryArg: Int = 0) {
        if stats[0][keyPath: stringPath] != .init() {
            var values: [String] = []
            
            for idx in stats.indices {
                values.append(stats[idx][keyPath: stringPath])
            }
            allValues.append(values)
        }
    }
    
    var levels = [String]()
    for idx in stats.indices {
        levels.append("\(13-idx)")
    }
    allValues.append(levels.reversed())
    
    appendValues(\.areaDamage)
    appendValues(\.buildingDamagePerSecond)
    appendValues(\.chargeDamage)
    appendValues(\.clonedOrMirroredCardsLevel)
    appendValues(\.crownTowerDamage)
    appendValues(\.crownTowerDamagePerSecond)
    appendValues(\.damage)
    appendValues(\.expDamage)
    appendValues(\.damagePerSecond)
    appendValues(\.expDamagePerSecond)
    appendValues(\.deathDamage)
    
    //    \.duration, only rage has a variable duration
    if stats[0].duration != .init() {
        var values: [String] = []
        
        for idx in stats.indices {
            values.append("\(NSString(format: "%.2g", stats[idx].duration))")
        }
        allValues.append(values)
    }
    appendValues(\.healingPerSecond)
    appendValues(\.healing)
    appendValues(\.hitpoints)
    appendValues(\.rangedDamage)
    appendValues(\.shieldHitpoints)
    appendValues(\.spawnDamage)
    /*appendValues(\.subTroopsLevel)*/
    
    return allValues
}

private func variableStatsKeys(stats: [DataSet.CardVariableStats]) -> [String] {
    
    var keys: [String] = ["Level"]
    
    let stats = stats[0]
    
    if stats.areaDamage != .init() { keys.append("Area Dmg") }
    if stats.buildingDamagePerSecond != .init() { keys.append("Building Dmg/s") }
    if stats.chargeDamage != .init() { keys.append("Charge Dmg") }
    if stats.clonedOrMirroredCardsLevel != .init() { keys.append("Affected Cards' level") }
    if stats.crownTowerDamage != .init() { keys.append("Tower Dmg") }
    if stats.crownTowerDamagePerSecond != .init() { keys.append("Tower Dmg/s") }
    if stats.damage != .init() { keys.append("Dmg") }
    if stats.expDamage != .init() { keys.append("Dmg") }
    if stats.damagePerSecond != .init() { keys.append("Dmg/s") }
    if stats.expDamagePerSecond != .init() { keys.append("Dmg/s") }
    if stats.deathDamage != .init() { keys.append("Death Dmg") }
    if stats.duration != .init() { keys.append("Duration") }
    if stats.healingPerSecond != .init() { keys.append("Healing/s") }
    if stats.healing != .init() { keys.append("Healing") }
    if stats.hitpoints != .init() { keys.append("HP") }
    if stats.rangedDamage != .init() { keys.append("Ranged Dmg") }
    if stats.shieldHitpoints != .init() { keys.append("Shield") } //HP
    if stats.spawnDamage != .init() { keys.append("Spawn Dmg") }
    if stats.subTroopsLevel != .init() { /*keys.append("SubTroops level")*/ }
    
    return keys
}

extension Array where Element == DataSet.CardVariableStats {
    func imageIconNames() -> [String] {
        let stats = self[0]
        var imageIconNames = ["troop"]
        
        if stats.areaDamage != .init() { imageIconNames.append("dmg-area") }
        if stats.buildingDamagePerSecond != .init() { imageIconNames.append("dmg-dps") }
        if stats.chargeDamage != .init() { imageIconNames.append("dmg") }
        if stats.clonedOrMirroredCardsLevel != .init() { imageIconNames.append("troop") }
        if stats.crownTowerDamage != .init() { imageIconNames.append("dmg") }
        if stats.crownTowerDamagePerSecond != .init() { imageIconNames.append("dmg-dps") }
        if stats.damage != .init() { imageIconNames.append("dmg") }
        if stats.expDamage != .init() { imageIconNames.append("dmg") }
        if stats.damagePerSecond != .init() { imageIconNames.append("dmg-dps") }
        if stats.expDamagePerSecond != .init() { imageIconNames.append("dmg-dps") }
        if stats.deathDamage != .init() { imageIconNames.append("dmg") }
        if stats.duration != .init() { imageIconNames.append("deploy-time") }
        if stats.healingPerSecond != .init() { imageIconNames.append("boost-heal") }
        if stats.healing != .init() { imageIconNames.append("boost-heal") }
        if stats.hitpoints != .init() { imageIconNames.append("hp") }
        if stats.rangedDamage != .init() { imageIconNames.append("dmg") }
        if stats.shieldHitpoints != .init() { imageIconNames.append("hp") }
        if stats.spawnDamage != .init() { imageIconNames.append("dmg") }
        if stats.subTroopsLevel != .init() { /*imageIconNames.append("troop")*/ }
        
        return imageIconNames
    }
}

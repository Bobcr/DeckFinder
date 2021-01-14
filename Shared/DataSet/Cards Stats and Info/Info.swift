import Foundation

extension DataSet.Cards {
    var info: Info {
        switch self {
        case .unknownCard: return Info(
            arena: .arena0,
            description: "Unknown Card, please check for updates.",
            elixir: 0,
            id: 25000000,
            key: "unknown-card",
            name: "Unknown Card",
            rarity: .common,
            type: .troop,
            starLevels: 1)
        case .knight: return Info(
            arena: .arena0,
            description: "A tough melee fighter. The Barbarian's handsome, cultured cousin. Rumor has it that he was knighted based on the sheer awesomeness of his mustache alone.",
            elixir: 3,
            id: 26000000,
            key: "knight",
            name: "Knight",
            rarity: .common,
            type: .troop,
            starLevels: 3)
        case .archers: return Info(
            arena: .arena0,
            description: "A pair of lightly armored ranged attackers. They'll help you take down ground and air units, but you're on your own with hair coloring advice.",
            elixir: 3,
            id: 26000001,
            key: "archers",
            name: "Archers",
            rarity: .common,
            type: .troop,
            starLevels: 2)
        case .goblins: return Info(
            arena: .arena1,
            description: "Three fast, unarmored melee attackers. Small, fast, green and mean!",
            elixir :2,
            id: 26000002,
            key: "goblins",
            name: "Goblins",
            rarity: .common,
            type: .troop,
            starLevels: 3)
        case .giant: return Info(
            arena: .arena0,
            description: "Slow but durable, only attacks buildings. A real one-man wrecking crew!",
            elixir: 5,
            id: 26000003,
            key: "giant",
            name: "Giant",
            rarity: .rare,
            type: .troop,
            starLevels: 2)
        case .pekka: return Info(
            arena: .arena4,
            description: "A heavily armored, slow melee fighter. Swings from the hip, but packs a huge punch.",
            elixir: 7,
            id: 26000004,
            key: "pekka",
            name: "P.E.K.K.A",
            rarity: .epic,
            type: .troop,
            starLevels: 2)
        case .minions: return Info(
            arena: .arena0,
            description: "Three fast, unarmored flying attackers. Roses are red, minions are blue, they can fly, and will crush you!",
            elixir: 3,
            id: 26000005,
            key: "minions",
            name: "Minions",
            rarity: .common,
            type: .troop,
            starLevels: 3)
        case .balloon: return Info(
            arena: .arena6,
            description : "As pretty as they are, you won't want a parade of THESE balloons showing up on the horizon. Drops powerful bombs and when shot down, crashes dealing area damage.",
            elixir: 5,
            id: 26000006,
            key: "balloon",
            name: "Balloon",
            rarity: .epic,
            type: .troop,
            starLevels: 3)
        case .witch: return Info(
            arena: .arena2,
            description: "Summons Skeletons, shoots destructo beams, has glowing pink eyes that unfortunately don't shoot lasers.",
            elixir: 5,
            id: 26000007,
            key: "witch",
            name: "Witch",
            rarity: .epic,
            type: .troop,
            starLevels: 2)
        case .barbarians: return Info(
            arena: .arena3,
            description: "A horde of melee attackers with mean mustaches and even meaner tempers.",
            elixir: 5,
            id: 26000008,
            key: "barbarians",
            name: "Barbarians",
            rarity: .common,
            type: .troop,
            starLevels: 2)
        case .golem: return Info(
            arena: .arena3,
            description: "Slow but durable, only attacks buildings. When destroyed, explosively splits into two Golemites and deals area damage!",
            elixir: 8,
            id: 26000009,
            key: "golem",
            name: "Golem",
            rarity: .epic,
            type: .troop,
            starLevels: 2)
        case .skeletons: return Info(
            arena: .arena2,
            description: "Three fast, very weak melee fighters. Surround your enemies with this pile of bones!",
            elixir: 1,
            id: 26000010,
            key: "skeletons",
            name: "Skeletons",
            rarity: .common,
            type: .troop,
            starLevels: 3)
        case .valkyrie: return Info(
            arena: .arena2,
            description: "Tough melee fighter, deals area damage around her. Swarm or horde, no problem! She can take them all out with a few spins.",
            elixir: 4,
            id: 26000011,
            key: "valkyrie",
            name: "Valkyrie",
            rarity: .rare,
            type: .troop,
            starLevels: 2)
        case .skeletonArmy: return Info(
            arena: .arena0,
            description: "Spawns an army of Skeletons. Meet Larry and his friends Harry, Gerry, Terry, Mary, etc.",
            elixir: 3,
            id: 26000012,
            key: "skeleton-army",
            name: "Skeleton Army",
            rarity: .epic,
            type: .troop,
            starLevels: 3)
        case .bomber: return Info(
            arena: .arena2,
            description: "Small, lightly protected skeleton who throws bombs. Deals area damage that can wipe out a swarm of enemies.",
            elixir: 3,
            id: 26000013,
            key: "bomber",
            name: "Bomber",
            rarity: .common,
            type: .troop,
            starLevels: 2)
        case .musketeer: return Info(
            arena: .arena0,
            description: "Don't be fooled by her delicately coiffed hair, the Musketeer is a mean shot with her trusty boomstick.",
            elixir: 4,
            id: 26000014,
            key: "musketeer",
            name: "Musketeer",
            rarity: .rare,
            type: .troop,
            starLevels: 2)
        case .babyDragon: return Info(
            arena: .arena0,
            description: "Burps fireballs from the sky that deal area damage. Baby dragons hatch cute, hungry and ready for a barbeque.",
            elixir: 4,
            id: 26000015,
            key: "baby-dragon",
            name: "Baby Dragon",
            rarity: .epic,
            type: .troop,
            starLevels: 2)
        case .prince: return Info(
            arena: .arena0,
            description: "Don't let the little pony fool you. Once the Prince gets a running start, you WILL be trampled. Deals double damage once he gets charging.",
            elixir: 5,
            id : 26000016,
            key: "prince",
            name: "Prince",
            rarity: .epic,
            type: .troop,
            starLevels: 1)
        case .wizard: return Info(
            arena: .arena5,
            description: "The most awesome man to ever set foot in the Arena, the Wizard will blow you away with his handsomeness... and/or fireballs.",
            elixir: 5,
            id: 26000017,
            key: "wizard",
            name: "Wizard",
            rarity: .rare,
            type: .troop,
            starLevels: 2)
        case .miniPekka: return Info(
            arena: .arena0,
            description: "The Arena is a certified butterfly-free zone. No distractions for P.E.K.K.A, only destruction.",
            elixir: 4,
            id: 26000018,
            key: "mini-pekka",
            name: "Mini P.E.K.K.A",
            rarity: .rare,
            type: .troop,
            starLevels: 2)
        case .spearGoblins: return Info(
            arena: .arena1,
            description: "Three unarmored ranged attackers. Who the heck taught these guys to throw spears!? Who thought that was a good idea?!",
            elixir: 2,
            id: 26000019,
            key: "spear-goblins",
            name: "Spear Goblins",
            rarity: .common,
            type: .troop,
            starLevels: 3)
        case .giantSkeleton: return Info(
            arena: .arena2,
            description: "The bigger the skeleton, the bigger the bomb. Carries a bomb that blows up when the Giant Skeleton dies.",
            elixir: 6,
            id: 26000020,
            key: "giant-skeleton",
            name: "Giant Skeleton",
            rarity: .epic,
            type: .troop,
            starLevels: 3)
        case .hogRider: return Info(
            arena: .arena1,
            description: "Fast melee troop that targets buildings and can jump over the river. He followed the echoing call of \"Hog Riderrrrr\" all the way through the Arena doors.",
            elixir: 4,
            id: 26000021,
            key: "hog-rider",
            name: "Hog Rider",
            rarity: .rare,
            type: .troop,
            starLevels: 3)
        case .minionHorde: return Info(
            arena: .arena4,
            description: "Six fast, unarmored flying attackers. Three's a crowd, six is a horde!",
            elixir: 5,
            id: 26000022,
            key: "minion-horde",
            name: "Minion Horde",
            rarity: .common,
            type: .troop,
            starLevels: 3)
        case .iceWizard: return Info(
            arena: .arena8,
            description: "This chill caster throws ice shards that slow down enemies' movement and attack speed. Despite being freezing cold, he has a handlebar mustache that's too hot for TV.",
            elixir: 3,
            id: 26000023,
            key: "ice-wizard",
            name: "Ice Wizard",
            rarity: .legendary,
            type: .troop,
            starLevels: 1)
        case .royalGiant: return Info(
            arena: .arena7,
            description: "Destroying enemy buildings with his massive cannon is his job, making a raggedy blond beard look good is his passion.",
            elixir: 6,
            id: 26000024,
            key: "royal-giant",
            name: "Royal Giant",
            rarity: .common,
            type: .troop,
            starLevels: 2)
        case .guards: return Info(
            arena: .arena7,
            description: "Three ruthless bone brothers with shields. Knock off their shields and all that's left are three ruthless bone brothers.",
            elixir: 3,
            id: 26000025,
            key: "guards",
            name: "Guards",
            rarity: .epic,
            type: .troop,
            starLevels: 2)
        case .princess: return Info(
            arena: .arena7,
            description: "This stunning Princess shoots flaming arrows from long range. If you're feeling warm feelings towards her, it's probably because you're on fire.",
            elixir: 3,
            id: 26000026,
            key: "princess",
            name: "Princess",
            rarity: .legendary,
            type: .troop,
            starLevels: 1)
        case .darkPrince: return Info(
            arena: .arena7,
            description: "The Dark Prince deals area damage and lets his spiked club do the talking for him - because when he does talk, it sounds like he has a bucket on his head.",
            elixir: 4,
            id: 26000027,
            key: "dark-prince",
            name: "Dark Prince",
            rarity: .epic,
            type: .troop,
            starLevels: 1)
        case .threeMusketeers: return Info(
            arena: .arena7,
            description: "Trio of powerful, independent markswomen, fighting for justice and honor. Disrespecting them would not be just a mistake, it would be a cardinal sin!",
            elixir: 9,
            id: 26000028,
            key: "three-musketeers",
            name: "Three Musketeers",
            rarity: .rare,
            type: .troop,
            starLevels: 2)
        case .lavaHound: return Info(
            arena: .arena4,
            description: "The Lava Hound is a majestic flying beast that attacks buildings. The Lava Pups are less majestic angry babies that attack anything.",
            elixir: 7,
            id: 26000029,
            key: "lava-hound",
            name: "Lava Hound",
            rarity: .legendary,
            type: .troop,
            starLevels: 2)
        case .iceSpirit: return Info(
            arena: .arena8,
            description: "Spawns one lively little Ice Spirit to freeze a group of enemies. Stay frosty.",
            elixir :1,
            id: 26000030,
            key: "ice-spirit",
            name: "Ice Spirit",
            rarity: .common,
            type: .troop,
            starLevels: 1)
        case .fireSpirits: return Info(
            arena: .arena5,
            description: "These three Fire Spirits are on a kamikaze mission to give you a warm hug. It'd be adorable if they weren't on fire.",
            elixir: 2,
            id: 26000031,
            key: "fire-spirits",
            name: "Fire Spirits",
            rarity: .common,
            type: .troop,
            starLevels: 1)
        case .miner: return Info(
            arena: .arena4,
            description: "The Miner can burrow his way underground and appear anywhere in the Arena. It's not magic, it's a shovel.",
            elixir: 3,
            id: 26000032,
            key: "miner",
            name:"Miner",
            rarity: .legendary,
            type: .troop,
            starLevels: 2)
        case .sparky: return Info(
            arena: .arena11,
            description: "Sparky slowly charges up, then unloads MASSIVE area damage. Overkill isn't in her vocabulary.",
            elixir: 6,
            id: 26000033,
            key: "sparky",
            name: "Sparky",
            rarity: .legendary,
            type: .troop,
            starLevels: 1)
        case .bowler: return Info(
            arena: .arena8,
            description: "This big blue dude digs the simple things in life - Dark Elixir drinks and throwing rocks. His massive boulders roll through their target, hitting everything behind for a strike!",
            elixir: 5,
            id: 26000034,
            key: "bowler",
            name: "Bowler",
            rarity: .epic,
            type: .troop,
            starLevels: 2)
        case .lumberjack: return Info(
            arena: .arena8,
            description: "He chops trees by day and hunts The Log by night. His bottle of Rage spills everywhere when he's defeated.",
            elixir: 4,
            id: 26000035,
            key: "lumberjack",
            name: "Lumberjack",
            rarity: .legendary,
            type: .troop,
            starLevels: 1)
        case .battleRam: return Info(
            arena: .arena3,
            description: "Two Barbarians holding a big log charge at the nearest building, dealing significant damage if they connect, then they go to town with their swords!",
            elixir: 4,
            id: 26000036,
            key: "battle-ram",
            name: "Battle Ram",
            rarity: .rare,
            type: .troop,
            starLevels: 2)
        case .infernoDragon: return Info(
            arena: .arena6,
            description: "Shoots a focused beam of fire that increases in damage over time. Wears a helmet because flying can be dangerous.",
            elixir: 4,
            id: 26000037,
            key: "inferno-dragon",
            name: "Inferno Dragon",
            rarity: .legendary,
            type: .troop,
            starLevels: 3)
        case .iceGolem: return Info(
            arena: .arena8,
            description: "He's tough, targets buildings and explodes when destroyed, slowing nearby enemies. Made entirely out of ice... or is he?! Yes.",
            elixir: 2,
            id: 26000038,
            key: "ice-golem",
            name: "Ice Golem",
            rarity: .rare,
            type: .troop,
            starLevels: 1)
        case .megaMinion: return Info(
            arena: .arena4,
            description: "Flying, armored and powerful. What could be its weakness?! Cupcakes.",
            elixir: 3,
            id: 26000039,
            key: "mega-minion",
            name: "Mega Minion",
            rarity: .rare,
            type: .troop,
            starLevels: 2)
        case .dartGoblin: return Info(
            arena: .arena9,
            description: "Runs fast, shoots far and chews gum. How does he blow darts with a mouthful of Double Trouble Gum? Years of didgeridoo lessons.",
            elixir: 3,
            id: 26000040,
            key: "dart-goblin",
            name: "Dart Goblin",
            rarity: .rare,
            type: .troop,
            starLevels: 2)
        case .goblinGang: return Info(
            arena: .arena9,
            description: "Spawns five Goblins - three with knives, two with spears - at a discounted Elixir cost. It's like a Goblin Value Pack!",
            elixir: 3,
            id: 26000041,
            key: "goblin-gang",
            name: "Goblin Gang",
            rarity: .common,
            type: .troop,
            starLevels: 3)
        case .electroWizard: return Info(
            arena: .arena11,
            description: "He lands with a \"POW!\", stuns nearby enemies and shoots lightning with both hands! What a show off.",
            elixir: 4,
            id: 26000042,
            key: "electro-wizard",
            name: "Electro Wizard",
            rarity: .legendary,
            type: .troop,
            starLevels: 1)
        case .eliteBarbarians: return Info(
            arena: .arena10,
            description: "Spawns a pair of leveled up Barbarians. They're like regular Barbarians, only harder, better, faster and stronger.",
            elixir: 6,
            id: 26000043,
            key: "elite-barbarians",
            name: "Elite Barbarians",
            rarity: .common,
            type: .troop,
            starLevels: 2)
        case .hunter: return Info(
            arena: .arena1,
            description: "He deals BIG damage up close - not so much at range. What he lacks in accuracy, he makes up for with his impressively bushy eyebrows.",
            elixir: 4,
            id: 26000044,
            key: "hunter",
            name: "Hunter",
            rarity: .epic,
            type: .troop,
            starLevels: 3)
        case .executioner: return Info(
            arena: .arena12,
            description: "He throws his axe like a boomerang, striking all enemies on the way out AND back. It's a miracle he doesn't lose an arm.",
            elixir: 5,
            id: 26000045,
            key: "executioner",
            name: "Executioner",
            rarity: .epic,
            type: .troop,
            starLevels: 2)
        case .bandit: return Info(
            arena: .arena9,
            description: "The Bandit dashes to her target and delivers an extra big hit! While dashing, she can't be touched. The mask keeps her identity safe, and gives her bonus cool points!",
            elixir: 3,
            id: 26000046,
            key: "bandit",
            name: "Bandit",
            rarity: .legendary,
            type: .troop,
            starLevels: 1)
        case .royalRecruits: return Info(
            arena: .arena7,
            description: "Deploys a line of recruits armed with spears, shields and wooden buckets. They dream of ponies and one day wearing metal buckets.",
            elixir: 7,
            id: 26000047,
            key: "royal-recruits",
            name: "Royal Recruits",
            rarity: .common,
            type: .troop,
            starLevels: 2)
        case .nightWitch: return Info(
            arena: .arena5,
            description: "Summons Bats to do her bidding, even after death! If you get too close, she isn't afraid of pitching in with her mean-looking battle staff.",
            elixir: 4,
            id: 26000048,
            key: "night-witch",
            name: "Night Witch",
            rarity: .legendary,
            type: .troop,
            starLevels: 2)
        case .bats: return Info(
            arena: .arena5,
            description: "Spawns a handful of tiny flying creatures. Think of them as sweet, purple... balls of DESTRUCTION!",
            elixir: 2,
            id: 26000049,
            key: "bats",
            name: "Bats",
            rarity: .common,
            type: .troop,
            starLevels: 2)
        case .royalGhost: return Info(
            arena: .arena12,
            description: "He drifts invisibly through the Arena until he's startled by an enemy... then he attacks! Then he's invisible again! Zzzz.",
            elixir: 3,
            id: 26000050,
            key: "royal-ghost",
            name: "Royal Ghost",
            rarity: .legendary,
            type: .troop,
            starLevels: 1)
        case .ramRider: return Info(
            arena: .arena10,
            description: "Together they charge through the Arena, snaring enemies, knocking down towers ... and chewing grass!?",
            elixir: 5,
            id: 26000051,
            key: "ram-rider",
            name: "Ram Rider",
            rarity: .legendary,
            type: .troop,
            starLevels: 1)
        case .zappies: return Info(
            arena: .arena11,
            description: "Spawns a pack of miniature Zap machines. Who controls them...? Only the Master Builder knows.",
            elixir: 4,
            id: 26000052,
            key: "zappies",
            name: "Zappies",
            rarity: .rare,
            type: .troop,
            starLevels: 2)
        case .rascals: return Info(
            arena: .arena9,
            description: "Spawns a mischievous trio of Rascals! The boy takes the lead, while the girls pelt enemies from behind... with slingshots full of Double Trouble Gum!",
            elixir: 5,
            id: 26000053,
            key: "rascals",
            name: "Rascals",
            rarity: .common,
            type: .troop,
            starLevels: 2)
        case .cannonCart: return Info(
            arena: .arena10,
            description: "A Cannon on wheels?! Bet they won't see that coming! Once you break its shield, it becomes a Cannon not on wheels.",
            elixir: 5,
            id: 26000054,
            key: "cannon-cart",
            name: "Cannon Cart",
            rarity: .epic,
            type: .troop,
            starLevels: 3)
        case .megaKnight: return Info(
            arena: .arena7,
            description: "He lands with the force of 1,000 mustaches, then jumps from one foe to the next dealing huge area damage. Stand aside!",
            elixir: 7,
            id: 26000055,
            key: "mega-knight",
            name: "Mega Knight",
            rarity: .legendary,
            type: .troop,
            starLevels: 2)
        case .skeletonBarrel: return Info(
            arena: .arena6,
            description: "It's a Skeleton party in the sky, until all the balloons pop... then it's a Skeleton party on the ground!",
            elixir: 3,
            id: 26000056,
            key: "skeleton-barrel",
            name: "Skeleton Barrel",
            rarity: .common,
            type: .troop,
            starLevels: 3)
        case .flyingMachine: return Info(
            arena: .arena6,
            description: "The Master Builder has sent his first contraption to the Arena! It's a fast and fun flying machine, but fragile!",
            elixir: 4,
            id: 26000057,
            key: "flying-machine",
            name: "Flying Machine",
            rarity: .rare,
            type: .troop,
            starLevels: 1)
        case .wallBreakers: return Info(
            arena: .arena0,
            description: "A daring duo of dangerous dive bombers. Nothing warms a Wall Breaker's cold and undead heart like blowing up buildings.",
            elixir: 2,
            id: 26000058,
            key: "wall-breakers",
            name: "Wall Breakers",
            rarity: .epic,
            type: .troop,
            starLevels: 3)
        case .royalHogs: return Info(
            arena: .arena10,
            description: "The King's personal pets are loose! They love to chomp on apples and towers alike - who let the hogs out?!",
            elixir: 5,
            id: 26000059,
            key: "royal-hogs",
            name: "Royal Hogs",
            rarity: .rare,
            type: .troop,
            starLevels: 2)
        case .goblinGiant: return Info(
            arena: .arena9,
            description: "This jolly green Goblin Giant stomps towards enemy buildings. He carries two Spear Goblins everywhere he goes. It's a weird but functional arrangement.",
            elixir: 6,
            id: 26000060,
            key: "goblin-giant",
            name: "Goblin Giant",
            rarity: .epic,
            type: .troop,
            starLevels: 3)
        case .fisherman: return Info(
            arena: .arena10,
            description: "His Ranged Attack can pull enemies towards him, and pull himself to enemy buildings. He's also mastered the ancient art of 'Fish Slapping'.",
            elixir: 3,
            id: 26000061,
            key: "fisherman",
            name: "Fisherman",
            rarity: .legendary,
            type: .troop,
            starLevels: 1)
        case .magicArcher: return Info(
            arena: .arena5,
            description: "Not quite a Wizard, nor an Archer - he shoots a magic arrow that passes through and damages all enemies in its path. It's not a trick, it's magic!",
            elixir: 4,
            id: 26000062,
            key: "magic-archer",
            name: "Magic Archer",
            rarity: .legendary,
            type: .troop,
            starLevels: 3)
        case .electroDragon: return Info(
            arena: .arena11,
            description: "Spits out bolts of electricity hitting up to three targets. Suffers from middle child syndrome to boot.",
            elixir: 5,
            id: 26000063,
            key: "electro-dragon",
            name: "Electro Dragon",
            rarity: .epic,
            type: .troop,
            starLevels: 1)
        case .cannon: return Info(
            arena: .arena3,
            description: "Defensive building. Shoots cannonballs with deadly effect, but cannot target flying troops.",
            elixir: 3,
            id: 27000000,
            key: "cannon",
            name: "Cannon",
            rarity: .common,
            type: .building,
            starLevels: 3)
        case .goblinHut: return Info(
            arena: .arena1,
            description: "Building that spawns Spear Goblins. Don't look inside... you don't want to see how they're made.",
            elixir: 5,
            id: 27000001,
            key: "goblin-hut",
            name: "Goblin Hut",
            rarity: .rare,
            type: .building,
            starLevels: 3)
        case .mortar: return Info(
            arena: .arena6,
            description: "Defensive building with a long range. Shoots big boulders that deal area damage, but cannot hit targets that get too close!",
            elixir: 4,
            id: 27000002,
            key: "mortar",
            name: "Mortar",
            rarity: .common,
            type: .building,
            starLevels: 2)
        case .infernoTower: return Info(
            arena: .arena4,
            description: "Defensive building, roasts targets for damage that increases over time. Burns through even the biggest and toughest enemies!",
            elixir: 5,
            id: 27000003,
            key: "inferno-tower",
            name: "Inferno Tower",
            rarity: .rare,
            type: .building,
            starLevels: 2)
        case .bombTower: return Info(
            arena: .arena10,
            description: "Defensive building that houses a Bomber. Deals area damage to anything dumb enough to stand near it.",
            elixir: 4,
            id: 27000004,
            key: "bomb-tower",
            name: "Bomb Tower",
            rarity: .rare,
            type: .building,
            starLevels: 1)
        case .barbarianHut: return Info(
            arena: .arena3,
            description: "Building that periodically spawns Barbarians to fight the enemy. Time to make the Barbarians!",
            elixir: 7,
            id: 27000005,
            key: "barbarian-hut",
            name: "Barbarian Hut",
            rarity: .rare,
            type: .building,
            starLevels: 2)
        case .tesla: return Info(
            arena: .arena11,
            description: "Defensive building. Whenever it's not zapping the enemy, the power of Electrickery is best kept grounded.",
            elixir: 4,
            id: 27000006,
            key: "tesla",
            name: "Tesla",
            rarity: .common,
            type: .building,
            starLevels: 2)
        case .elixirCollector: return Info(
            arena: .arena8,
            description: "You gotta spend Elixir to make Elixir! This building makes 8 Elixir over its Lifetime. Does not appear in your starting hand.",
            elixir: 6,
            id: 27000007,
            key: "elixir-collector",
            name: "Elixir Collector",
            rarity: .rare,
            type: .building,
            starLevels: 2)
        case .xBow: return Info(
            arena: .arena6,
            description: "Nice tower you got there. Would be a shame if this X-Bow whittled it down from this side of the Arena...",
            elixir: 6,
            id: 27000008,
            key: "x-bow",
            name: "X-Bow",
            rarity: .epic,
            type: .building,
            starLevels: 3)
        case .tombstone: return Info(
            arena: .arena2,
            description: "Building that periodically spawns Skeletons to fight the enemy... and when destroyed, spawns 3 more Skeletons! Creepy.",
            elixir: 3,
            id: 27000009,
            key: "tombstone",
            name: "Tombstone",
            rarity: .rare,
            type: .building,
            starLevels: 2)
        case .furnace: return Info(
            arena: .arena5,
            description:"The Furnace spawns two Fire Spirits at a time. It also makes great brick-oven pancakes.",
            elixir: 4,
            id: 27000010,
            key: "furnace",
            name: "Furnace",
            rarity: .rare,
            type: .building,
            starLevels: 1)
        case .goblinCage: return Info(
            arena: .arena12,
            description: "When the Goblin Cage is destroyed, a Goblin Brawler is unleashed into the Arena! Goblin Brawler always skips leg day.",
            elixir: 4,
            id: 27000012,
            key: "goblin-cage",
            name: "Goblin Cage",
            rarity: .rare,
            type: .building,
            starLevels: 3)
        case .fireball: return Info(
            arena: .arena0,
            description: "Annnnnd... Fireball. Incinerates a small area, dealing high damage. Reduced damage to Crown Towers.",
            elixir: 4,
            id: 28000000,
            key: "fireball",
            name: "Fireball",
            rarity: .rare,
            type: .spell,
            starLevels: 2)
        case .arrows: return Info(
            arena: .arena0,
            description: "Arrows pepper a large area, damaging all enemies hit. Reduced damage to Crown Towers.",
            elixir: 3,
            id: 28000001,
            key: "arrows",
            name: "Arrows",
            rarity: .common,
            type: .spell,
            starLevels: 3)
        case .rage: return Info(
            arena: .arena10,
            description: "Increases troop movement and attack speed. Buildings attack faster and summon troops quicker, too. Chaaaarge!",
            elixir: 2,
            id: 28000002,
            key: "rage",
            name: "Rage",
            rarity: .epic,
            type: .spell,
            starLevels: 1)
        case .rocket: return Info(
            arena: .arena6,
            description: "Deals high damage to a small area. Looks really awesome doing it. Reduced damage to Crown Towers.",
            elixir: 6,
            id: 28000003,
            key: "rocket",
            name: "Rocket",
            rarity: .rare,
            type: .spell,
            starLevels: 3)
        case .goblinBarrel: return Info(
            arena: .arena1,
            description: "Spawns three Goblins anywhere in the Arena. It's going to be a thrilling ride, boys!",
            elixir: 3,
            id: 28000004,
            key: "goblin-barrel",
            name: "Goblin Barrel",
            rarity: .epic,
            type: .spell,
            starLevels: 3)
        case .freeze: return Info(
            arena: .arena8,
            description: "Freezes and damages enemy troops and buildings, making them unable to move or attack. Everybody chill.",
            elixir: 4,
            id: 28000005,
            key: "freeze",
            name: "Freeze",
            rarity: .epic,
            type: .spell,
            starLevels: 1)
        case .mirror: return Info(
            arena: .arena12,
            description: "Mirrors your last card played for +1 Elixir. Does not appear in your starting hand.",
            elixir: 0,
            id: 28000006,
            key: "mirror",
            name: "Mirror",
            rarity: .epic,
            type: .spell,
            starLevels: 3)
        case .lightning: return Info(
            arena: .arena4,
            description: "Bolts of lightning damage and stun up to three enemy troops or buildings with the most hitpoints in the target area. Reduced damage to Crown Towers.",
            elixir: 6,
            id: 28000007,
            key: "lightning",
            name: "Lightning",
            rarity: .epic,
            type: .spell,
            starLevels: 1)
        case .zap: return Info(
            arena: .arena4,
            description: "Zaps enemies, briefly stunning them and dealing damage inside a small radius. Reduced damage to Crown Towers.",
            elixir: 2,
            id: 28000008,
            key: "zap",
            name: "Zap",
            rarity: .common,
            type: .spell,
            starLevels: 1)
        case .poison: return Info(
            arena: .arena5,
            description: "Covers the area in a deadly toxin, damaging enemy troops and buildings over time. Yet somehow leaves the grass green and healthy. Go figure!",
            elixir: 4,
            id: 28000009,
            key: "poison",
            name: "Poison",
            rarity: .epic,
            type: .spell,
            starLevels: 1)
        case .graveyard: return Info(
            arena: .arena12,
            description: "Surprise! It's a party. A Skeleton party, anywhere in the Arena. Yay!",
            elixir: 5,
            id: 28000010,
            key: "graveyard",
            name: "Graveyard",
            rarity: .legendary,
            type: .spell,
            starLevels: 3)
        case .theLog: return Info(
            arena: .arena6,
            description: "A spilt bottle of Rage turned an innocent tree trunk into \"The Log\". Now, it seeks revenge by crushing anything in its path!",
            elixir: 2,
            id: 28000011,
            key: "the-log",
            name: "The Log",
            rarity: .legendary,
            type: .spell,
            starLevels: 1)
        case .tornado: return Info(
            arena: .arena5,
            description: "Drags enemy troops to its center while dealing damage over time, just like a magnet. A big, swirling, Tornado-y magnet. Doesn't affect buildings.",
            elixir: 3,
            id: 28000012,
            key: "tornado",
            name: "Tornado",
            rarity: .epic,
            type: .spell,
            starLevels: 1)
        case .clone: return Info(
            arena: .arena11,
            description: "Duplicates all friendly troops in the target area. Cloned troops are fragile, but pack the same punch as the original! Doesn't affect buildings.",
            elixir: 3,
            id: 28000013,
            key: "clone",
            name: "Clone",
            rarity: .epic,
            type: .spell,
            starLevels: 1)
        case .earthquake: return Info(
            arena: .arena9,
            description: "Deals Damage per second to Troops and Crown Towers. Deals huge Building Damage! Does not affect flying units (it is an EARTHquake, after all).",
            elixir: 3,
            id: 28000014,
            key: "earthquake",
            name: "Earthquake",
            rarity: .rare,
            type: .spell,
            starLevels: 3)
        case .barbarianBarrel: return Info(
            arena: .arena3,
            description: "It rolls over and damages anything in its path, then breaks open and out pops a Barbarian! How did he get inside?!",
            elixir: 2,
            id: 28000015,
            key: "barbarian-barrel",
            name: "Barbarian Barrel",
            rarity: .epic,
            type: .spell,
            starLevels: 2)
        case .healSpirit: return Info(
            arena: .arena7,
            description: "A mischevious Spirit that leaps at enemies, dealing Damage and leaving behind a powerful healing effect that restores Hitpoints to friendly Troops!\nR.I.P Heal\n2017 - 2020\nAlas, we hardly used ye.",
            elixir: 1,
            id: 28000016,
            key: "heal-spirit",
            name: "Heal Spirit",
            rarity: .rare,
            type: .spell,
            starLevels: 1)
        case .giantSnowball: return Info(
            arena: .arena8,
            description: "It's HUGE! Once it began rolling down Frozen Peak, there was no stopping it. Enemies hit are knocked back and slowed down.",
            elixir: 2,
            id: 28000017,
            key: "giant-snowball",
            name: "Giant Snowball",
            rarity: .common,
            type: .spell,
            starLevels: 1)
        case .elixirGolem: return Info(
            arena: .arena11,
            description: "Splits into two Elixir Golemites when destroyed, which split into two sentient Blobs when defeated. A Blob gives your opponent 1 Elixir when destroyed!",
            elixir: 3,
            id: 26000067,
            key: "elixir-golem",
            name: "Elixir Golem",
            rarity: .rare,
            type: .troop,
            starLevels: 1)
        case .battleHealer: return Info(
            arena: .arena12,
            description: "With each attack, she unleashes a powerful healing aura that restores Hitpoints to herself and friendly Troops. When she isn't attacking, she passively heals herself!",
            elixir: 4,
            id: 26000068,
            key: "battle-healer",
            name: "Battle Healer",
            rarity: .rare,
            type: .troop,
            starLevels: 1)
        case .firecracker: return Info(
            arena: .arena10,
            description: "Shoots a firework that explodes upon impact, damaging the target and showering anything directly behind it with sparks. This is what happens when Archers get bored!",
            elixir: 3,
            id: 26000064,
            key: "firecracker",
            name: "Firecracker",
            rarity: .common,
            type: .troop,
            starLevels: 1)
        case .royalDelivery: return Info(
            arena: .arena12,
            description: "No need to sign for this package! Dropped from the sky, it damages and knocks back enemy Troops before delivering a Royal Recruit. The empty box is also handy for espionage.",
            elixir: 3,
            id: 28000018,
            key: "royal-delivery",
            name: "Royal Delivery",
            rarity: .common,
            type: .spell,
            starLevels: 1)
        case .skeletonDragons: return Info(
            arena: .arena10,
            description: "This pair of skeletal scorchers deal Area Damage and fly above the Arena. They also play a mean rib cage xylophone duet.",
            elixir: 4,
            id: 26000080,
            key: "skeleton-dragons",
            name: "Skeleton Dragons",
            rarity: .common,
            type: .troop,
            starLevels: 1)
            
        case .electroGiant: return Info(
            arena: .arena10,
            description: "He channels electricity through his Zap Pack, a unique device that stuns and damages any Troop attacking him within its range.\nDon't tell him that his finger guns aren't real! He'll zap you.",
            elixir: 8,
            id: 26000085,
            key: "electro-giant",
            name: "Electro Giant",
            rarity: .epic,
            type: .troop,
            starLevels: 1)
            
        case .electroSpirit: return Info(
            arena: .arena10,
            description: "Jumps on enemies, dealing Area Damage and stunning up to 9 enemy Troops. Locked in an eternal battle with Knight for the best mustache.",
            elixir: 1,
            id: 26000084,
            key: "electro-spirit",
            name: "Electro Spirit",
            rarity: .common,
            type: .spell,
            starLevels: 1)
        case .motherWitch: return Info(
            arena: .arena9,
            description: "Places a curse on enemy Troops with each attack. When a cursed Troop is destroyed, it turns into a building-targrting Hog that fights alongside the Mother Witch!\nShe also bakes great cookies.",
            elixir: 4,
            id: 26000083,
            key: "mother-witch",
            name: "Mother Witch",
            rarity: .legendary,
            type: .troop,
            starLevels: 1)
        }
    }
}

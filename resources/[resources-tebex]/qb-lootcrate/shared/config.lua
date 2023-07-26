Config = {}
Config.Image = "nui://ps-inventory/html/"

Config.Rewards = {
    ['crate_common'] = { --Case item name in your inventory
        [1] = {
            item = 'weapon_assaultrifle',
            image = Config.Image..'images/weapon_assaultrifle.png',
            weight = 1
        },
        [2] = {
            item = 'crate_rare',
            image = Config.Image..'images/crate_rare.png',
            weight = 5
        },    
        [3] = {
            item = 'weapon_pistol', --Item name in your inventory. Can be any item.
            image = Config.Image..'images/weapon_pistol.png', --Image location of item. This can also be changed to a remote image, ex 'https://i.imgur.com/aCTLp4L.png'
            weight = 20 --Weighted chance of item dropping. Higher the number, higher the chance. 70/100 == high chance, common. 5/100 == low chance, rare. Duh.
        },
        [4] = {
            item = 'pistol_ammo',
            image = Config.Image..'images/pistol_ammo.png', --This is an example of using the inventory item image directly from the inventory resources. Thanks TrueSunnyD for the tip.
            weight = 20
        },
        [5] = {
            item = 'smg_ammo',
            image = Config.Image..'images/smg_ammo.png',
            weight = 20
        },
        [6] = {
            item = 'weapon_microsmg',
            image = Config.Image..'images/weapon_microsmg.png',
            weight = 20
        },
        [7] = {
            item = 'weapon_revolver',
            image = Config.Image..'images/weapon_revolver.png',
            weight = 20
        },
        [8] = {
            item = 'voicechanger',
            image = Config.Image..'images/voicechanger.png',
            weight = 14
        },
    },
    ['crate_rare'] = { --Case item name in your inventory
        [1] = {
            item = 'weapon_assaultrifle',
            image = Config.Image..'images/weapon_assaultrifle.png',
            weight = 1
        },
        [2] = {
            item = 'crate_car',
            image = Config.Image..'images/crate_car.png',
            weight = 3
        },    
        [3] = {
            item = 'weapon_pistol', --Item name in your inventory. Can be any item.
            image = Config.Image..'images/weapon_pistol.png', --Image location of item. This can also be changed to a remote image, ex 'https://i.imgur.com/aCTLp4L.png'
            weight = 8 --Weighted chance of item dropping. Higher the number, higher the chance. 70/100 == high chance, common. 5/100 == low chance, rare. Duh.
        },
        [4] = {
            item = 'pistol_ammo',
            image = Config.Image..'images/pistol_ammo.png', --This is an example of using the inventory item image directly from the inventory resources. Thanks TrueSunnyD for the tip.
            weight = 8
        },
        [5] = {
            item = 'smg_ammo',
            image = Config.Image..'images/smg_ammo.png',
            weight = 8
        },
        [6] = {
            item = 'weapon_microsmg',
            image = Config.Image..'images/weapon_microsmg.png',
            weight = 8
        },
        [7] = {
            item = 'weapon_revolver',
            image = Config.Image..'images/weapon_revolver.png',
            weight = 8
        },
        [8] = {
            item = 'voicechanger',
            image = Config.Image..'images/voicechanger.png',
            weight = 8
        },
        [9] = {
            item = 'fakeplate', --Item name in your inventory. Can be any item.
            image = Config.Image..'images/fakeplate.png', --Image location of item. This can also be changed to a remote image, ex 'https://i.imgur.com/aCTLp4L.png'
            weight = 8 --Weighted chance of item dropping. Higher the number, higher the chance. 70/100 == high chance, common. 5/100 == low chance, rare. Duh.
        },
        [10] = {
            item = 'harness',
            image = Config.Image..'images/harness.png', --This is an example of using the inventory item image directly from the inventory resources. Thanks TrueSunnyD for the tip.
            weight = 8
        },
        [11] = {
            item = 'smg_ammo',
            image = Config.Image..'images/smg_ammo.png',
            weight = 8
        },
        [12] = {
            item = 'trackerdisabler',
            image = Config.Image..'images/trackerdisabler.png',
            weight = 8
        },
        [13] = {
            item = 'vpn',
            image = Config.Image..'images/vpn.png',
            weight = 8
        },
        [14] = {
            item = 'megaphone',
            image = Config.Image..'images/megaphone.png',
            weight = 8
        },
    },
    ['crate_car'] = { --Case item name in your inventory
        [1] = {
            item = "carslip",
            car = 'adder',
            image = 'img/adder.png',
            weight = 5
        },
        [2] = {
            item = "carslip",
            car = 'baller4',
            image = 'img/baller4.png',
            weight = 5
        },
        [3] = {
            item = "carslip",
            car = 'banshee',
            image = 'img/banshee.png',
            weight = 5
        },
        [4] = {
            item = "carslip",
            car = 'bf400',
            image = 'img/bf400.png',
            weight = 5
        },
        [5] = {
            item = "carslip",
            car = 'bfinjection',
            image = 'img/bfinjection.png',
            weight = 5
        },
        [6] = {
            item = "carslip",
            car = 'blazer',
            image = 'img/blazer.png',
            weight = 5
        },
        [7] = {
            item = "carslip",
            car = 'btype',
            image = 'img/btype.png',
            weight = 5
        },
        [8] = {
            item = "carslip",
            car = 'journey',
            image = 'img/journey.png',
            weight = 5
        },
        [9] = {
            item = "carslip",
            car = 'regina',
            image = 'img/regina.png',
            weight = 5
        },
        [10] = {
            item = "carslip",
            car = 's80',
            image = 'img/s80.png',
            weight = 5
        },
        [11] = {
            item = "carslip",
            car = 'sanchez',
            image = 'img/sanchez.png',
            weight = 5
        },
        [12] = {
            item = "carslip",
            car = 'ztype',
            image = 'img/ztype.png',
            weight = 5
        },
        [13] = {
            item = "carslip",
            car = 'schafter4',
            image = 'img/schafter4.png',
            weight = 5
        },
        [14] = {
            item = "carslip",
            car = 'shotaro',
            image = 'img/shotaro.png',
            weight = 5
        },
        [15] = {
            item = "carslip",
            car = 'stalion',
            image = 'img/stalion.png',
            weight = 5
        },
        [16] = {
            item = "carslip",
            car = 'sultan2',
            image = 'img/sultan2.png',
            weight = 5
        },
        [17] = {
            item = "carslip",
            car = 'sultanrs',
            image = 'img/sultanrs.png',
            weight = 5
        },
        [18] = {
            item = "carslip",
            car = 't20',
            image = 'img/t20.png',
            weight = 5
        },
        [19] = {
            item = "carslip",
            car = 'vagner',
            image = 'img/vagner.png',
            weight = 5
        },
        [20] = {
            item = "carslip",
            car = 'virgo',
            image = 'img/virgo.png',
            weight = 5
        },
    },
}

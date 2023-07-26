Welcome to qb-businesses, the most advanced FiveM - business script.

#### - 4 #s means its a category
## - 2 #s means its a subcatagory

#### HOW TO INSTALL ####
    ## QB-Core ##
        - Installing is quite simple! Make sure you have the absoloute LATEST QBCore, from 29th of march or after that date.
        - Headover to qb-core/shared/items.lua
        - After making sure your Core is up to date please do the following changes (This is to make sure we can use links for items.)
        - Go to your replace tool in Visual Studio Code and do the following replace | ["image"] = " with ["image"] = "images/
        - And do it one more time for this Replace | ['image'] = ' with ['image'] = 'images/
        - Make sure to have all images and items.lua installed into your core or there will be errors!
        - Also install the jobs from jobs.lua

    ## Inventory ## (Note for inventory we have to do a couple of changes!)
        - First make sure you have an up to date inventory! (This will just help making sure no errors!)
        - If you don't want to update your inventory due to changes thats alright! Make sure these changes are happening on client and server! (Put them under local QBCore = exports['qb-core']:GetCoreObject())
            Client: 
            RegisterNetEvent('QBCore:Client:UpdateObject', function()
                QBCore = exports['qb-core']:GetCoreObject()
            end)

            Server: 

            RegisterNetEvent('QBCore:Server:UpdateObject', function()
                if source ~= '' then return false end -- Safety check if the event was not called from the server.
                QBCore = exports['qb-core']:GetCoreObject()
            end)
        - If you need further assistance making sure this work please refere to my Pullrequest on QBCore (https://github.com/qbcore-framework/qb-inventory/pull/239)
        - After we've done that part we move on to the Javascript for QBCore please do the following
        * use the replace feature in Visual Studio Code and replace src="images/' with src="'

    ## qb-businesses ##
        - After doing the above your business script is now ready to be moved into your server please do make sure you have the following dependencies
        * PolyZone
        * qb-target
        - Once you've ensured the 2 dependencies now move qb-businesses to whatever folder you are going to be using and ensure qb-businesses AFTER the dependencies. And now the script is fully useable!

#### FAQ ####

    ## INGREDIENTS PICTURES DON'T WORK IN MENUS ##
        - In this case headover to Config.FileDict and change it to your inventory's name, if it still dosnt work then make sure you did Category 1 and 2 in HOW TO INSTALL

    ## ITEMS DON'T GET CREATED ON MY SERVER WHEN I MAKE ONE ##
        - You do not have an updated QBCore please reinstall and set it up!

    ## AN ERROR HAPPENS WHEN I TRY TO ALTER RECIPES ##
        - You are missing some items inside your shared.lua make sure you have done the shared.lua provided correctly!

    ## ITEMS ARE GONE AFTER A RESTART ##
        - Make sure you have run the SQL and the items are inside there.

    ## I CAN'T SPAWN IN THE ITEMS ##
        - Make sure these are inside your inventory just under local QBCore = exports['qb-core']:GetCoreObject()
            Client: 

            RegisterNetEvent('QBCore:Client:UpdateObject', function()
                QBCore = exports['qb-core']:GetCoreObject()
            end)

            Server: 

            RegisterNetEvent('QBCore:Server:UpdateObject', function()
                if source ~= '' then return false end -- Safety check if the event was not called from the server.
                QBCore = exports['qb-core']:GetCoreObject()
            end)
    
    ## WHICH BUSINESSES ARE THE SCRIPT SETUP FOR? ##
    The script comes with these businesses out of the box
        -- BEAN MACHINE https://fivem.gabzv.com/package/4976870
        -- PIZZA THIS https://fivem.gabzv.com/package/4724795
        -- UwU Cafe https://fivem.gabzv.com/package/4724734
        -- Vanilla Unicorn https://fivem.gabzv.com/package/4724693
        -- Pops Diner https://fivem.gabzv.com/package/4775182
        -- Tequilala https://forum.cfx.re/t/mlo-all-hassaric-s-maps-for-free/4776406
        -- Burgershot https://www.youtube.com/watch?v=h47N3ES_4tA&ab_channel=Gusepe73-GNMods
        -- Hen House https://www.youtube.com/watch?v=1h-XbJFLa_k&ab_channel=Smokey

#### Editing the Default Values ####
    ## File Dict ##
        - Headover to Config.FileDict
        - By default it looks like this Config.FileDict = "lj-inventory/html/", rename it to whatever inventory you use whether thats qb, lj or your own.
    ## Wash Counter ##
        - Headover to Config.WashCounter
        - By default this is set to 10, which means you can make 10 foods before having to wash hands!
    ## Enable Buffs ##
        - Headover to Config.EnableBuffs
        - By default this is set to true to enable buffs such as speed buffs for eating x amount of sugar!
        - Make sure you also change Config.Limits, this is just a check to make sure noone is trying to exploit by just adding sugar as that makes the value less than 25!
    ## Items and Values ##
        - Headover to Config.Ingredients
        - Here's the list with ALL the recipes, these are shared between businesses!
        - the [""] and name = "" is the SPAWNCODE of the item
        - The Value is equal to the amount of hunger it replenish, so making a recipe with 6 ingredients have a combined value of 25 means 25% of the hunger bar goes up!
        - SugarAmt equals to the amount of sugar inside the foods, this can have various effects which you can find and custmize inside the folder client and file cl_buffs
        - Drinks have an additional called alcoAmt, which is the amount of alcohol in each drink recipe item
        
#### Making a new business ####
    ## PolyZone ##
        - When starting to setup a new business start by setting up the PolyZones which you can find under Config.BusinessZone (You can use another business as reference: https://i.gyazo.com/77526928cc246502cdf7e5da49a27feb.png)
        - The label represent the jobname which is what you use with /setjob, if you change it away from the jobcode the script will not function.
        - The zones is represented by the points within polyzone, if you want to make it fit perfectly I would suggest using the PZCreator which you can access by doing the following
        - /pzcreate poly - Then a prompt pops up call it whatever, and boom your first point is set.
        - Now headover to where your point 2 will be set and do /pzadd, here it will add another point onto the, redo this untill you're done.
        - When your PolyZone is finished do /pzfinish and it will make a new file next to your server.cfg called "polyzone_created_zones.txt", now just paste the zones into the zone.
        - MinZ and MaxZ is the lowest and highest points of the business make sure it fits perfectly!
    ## Handwash ##
        - Headover to Config.HandWash
        - Settingup the handwashing is quite simple, once again access your /pzcreate and this time put in circle, call it whatever.
        - Once you've seen it pop up press Z to make a sphere here you can then just make it fit however you'd like, and then put in the vector 3 and then afterwards the size next to vector3!
    ## Cutting Board ##
        - Headover to Config.CuttingBoardCoords
        - Setting up the Cutting Board is also quite simple, once again access your /pzcreate and this time put in circle, call it whatever.
        - Once you've seen it pop up press Z to make a sphere here you can then just make it fit however you'd like, and then put in the vector 3 and then afterwards the size next to vector3!
    ## Blips ##
        - Headover to Config.Blips
        - "Label" is what people see on their minimap
        - "Coords" is the coordinates of the business
        - "blip" is the fivem blips thats avaible you can find them all here: https://docs.fivem.net/docs/game-references/blips/
        - "color" is just the color of the blip which you can find here by scrolling all the way down: https://docs.fivem.net/docs/game-references/blips/
    ## Manager ##
        - Headover to Config.BusinessManager
        - Here we can start to setup where the manager can access the menu for the entire Food Business
        - once again access your /pzcreate and this time put in circle, call it whatever.
        - Once you've seen it pop up press Z to make a sphere here you can then just make it fit however you'd like.
        - Afters it done then but the vector3 after coords.
        - Icons are from favicon which is used in qb-target you can find them here https://fontawesome.com/search?m=free&s=solid%2Cbrands
        - Last but not least we have the job = {["job"] = 0}, in this case "job" is the codename, and the 0 is the grade you can play around with this for your liking!
    ## Table- and stashes ## (these are accessible by EVERYONE on the server)
        - Headover to Config.Tables
        - Once again do /pzcreate, use a circle and make it fit, however you'd like.
        - After that just put in the coords where its supposed to so coords = YourCoords
        - After this also put in the business, this is just for security steps so modders shouldnt be able to access the tables if they are not in the business.
    ## Staff Stashes ## (only avaible to certain jobs)
        - Headover to Config.StaffStashes
        - Once again do /pzcreate, create a circle and make it fit however you'd like.
        - Put in the coords after coords like coords = YourNewCoords, Size is the Size of the circlezone, job is the jobcode and the number = the grade
        - Stash size is the size of the stash 1500000 = 1.5k, Stashslots is the amount of slots there's supposed to be in that slot, and the name just have to be unique as we use that for a security step.
    ## Chairs ##
        - Making new sitable chairs have never been easier!
        - Go ontop of the chair you want to make sitable and then head over to /admin - devloper options - copy vector4.
        - Paste it in the chairs.lua under the shared folder and minus the z which is the 3rd value with 0.5 this should make your character sit almost perfect at any chairs.



local Translations = {
    error = {
        license_already = 'Player already has a license',
        cancelled = 'Cancelled...',
        maxium = 'You already have the maximum amount of menu items!',
        exist = 'Item already exist!',
        error_food = 'You dont have a %s',
        sweet = 'Food is overly sweet',
        sweat = 'Beginning to sweat',
    },

    success = {
        uncuffed = 'You have been uncuffed',
        submit = 'Submit',

        available = 'You made %s availabe in the restaurant!',
        removed = 'You removed %s for the menu!',
    },

    info = {
        making_food = "Making %{name}",
        food_made = "You made %{name}",
        wrong_ingredients = "You do not have the right ingredients!",
        no_handwash = "You haven't washed your hands!",
        hands_washed = "You washed your hands!",
    },

    menu = {
        cutting_header = "Start Cutting %s",
        cutting_info = "Cut %s into %s",
        management = "Managment",
    },

    progressbar = {
        hand_wash = 'Washing Hands...',
        cutting_board = "Cutting %s...",
    },

    target = {
        chairs_sitdown = "Sit Down",
        table_open = "Open Table",
        change_picture = "Change Picture %{id}",
        reset_picture = "Reset All Pictures",
        cash_register = "Open Cash Register",
        stash_open = "Open Stash",
        soda_menu = "Grab a Soda!",
        wine_menu = "Grab a bottle of Wine!",
        coffee_menu = "Grab Coffee!",
        beer_menu = "Grab a Beer!",
        manager_menu = "Manage Business",
        cut_vegetables = "Cutting Board",
        hand_wash = "Wash Hands",
        dj_booth = "Play Music",
        use_station = "Use Station!",
    },

    header = {
        painting = 'Change Painting (512x512)',
        new_item = 'Create New Item',
        newmenu_item = 'Create a new menu item!',
        manage_menu = 'Manage Menu Items',
        newfood_item = 'Create a new Food Item!',
        newdrink_item = 'Create a new Drinks Item!',
        createdrink = 'Create new drink',
        create_main = 'Create Main Course',
        create_side = 'Create Side Dish',
        create_dessert = 'Create Dessert Item',
        manage_food = 'Manage Food Items!',
        manage_main = 'Manage Main Course',
        manage_side = 'Manage Side Dish',
        manage_desserts = 'Manage Desserts',
        manage_drinks = 'Manage Drinks',

        alter_recipe = 'Alter Recipe',
        new_recipe = 'New Recipe',
        create_new_recipe = 'Alter Recipe',
        remove_menu = 'Remove From Menu',

        make_active = 'Make Active',

        ingredients = 'Ingredient Type %s',

        boss = 'Boss Menu',
        closemenu = 'Close Menu',
        goback = 'Go back',

    },

    subtext = {
        recipes = 'Add Recipes, and more!',
        hire = 'Hire, Fire and Manage Employees!',
        main_text = 'Creates a new Main Course Item',
        side_text = 'Creates a new Side Dish Item',
        dessert_text = 'Creates a new Dessert Item',
        alter_recipes = 'Alter Recipes, Redo Emotes and More!',

        recipe_text = 'Alter %s Recipe',
        remove_text = 'Remove %s From the menu!!',

        active_item = 'Make %s Active to be made!',
        note = 'Note (Not Required)',

        station = '(Choose Station)',
        prep = '(prep)',
    },

    input = {
        painting = 'Insert a .png link (512 x 512)',
        cap_name = 'Name',
        cap_description = 'Description',
        img_size = 'Image (100x100 pixels)',

        emotemenu = '(Emote from /emotemenu)',

        using = '🔵| Currently In Use',
        notusing = '🔴| Currently NOT in Use!',
    },

    logs = {
        play_song = "%{name} started playing %{song} at the %{zone} dj booth.",
        play_song_unauth = "%{name} tried to play %{song} at the %{zone} dj booth. But is not authorized!",
        stop_song = "%{name} has stopped music at the %{zone} dj booth.",
        stop_song_unauth = "%{name} tried to stop music at the %{zone} dj booth. But is not authorized!",
        pause_song = "%{name} has paused music at the %{zone} dj booth.",
        pause_song_unauth = "%{name} tried to pause music at the %{zone} dj booth. But is not authorized!",
        resume_song = "%{name} has resumed music at the %{zone} dj booth.",
        resume_song_unauth = "%{name} tried to resume the song at the %{zone} dj booth. But is not authorized!",
        change_volume = "%{name} has change the song volume to %{volume} at the %{zone} dj booth.",
        change_volume_unauth = "%{name} tried to change the song volume to %{volume} at the %{zone} dj booth. But is not authorized!",
        dui_update = "%{name} has change the DUI image at %{id} to %{url} at the %{zone}.",
        dui_update_unauth = "%{name} tried to change the DUI image at %{id} to %{url} at the %{zone}. But is not authorized!",
        dui_reset = "%{name} has reset all DUI images at the %{zone}.",
        dui_reset_unauth = "%{name} tried to reset all DUI images at the %{zone}. But is not authorized!",
        create_item = "%{name} has created an item for %{zone}.\nItem: %{item}\nImage: %{image}\nDescription: %{desc}\nType: %{type}",
        create_item_unauth = "%{name} has tried to created an item for %{zone}. But is not authorized! \nItem: %{item}\nImage: %{image}\nDescription: %{desc}\nType: %{type}",
    }
}

Lang = Locale:new({
    phrases = Translations,
    warnOnMissing = true
})
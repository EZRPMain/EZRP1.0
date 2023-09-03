Config = {}

Target = {}

Config.Dumpster = {
    'prop_skip_05a',
    'prop_dumpster_3a',
    'prop_skip_08a',
    'prop_dumpster_4b',
    'prop_bin_14a',
    'prop_skip_03',
    'prop_dumpster_01a',
    'prop_dumpster_4a',
    'prop_skip_10a',
    'prop_dumpster_02b',
    'prop_bin_14b',
    'prop_skip_06a',
    'prop_dumpster_02a',
    'prop_bin_07a',
    'prop_skip_02a',
}

Config.Timer = 20

Config.Rewards = {
    CashMin = 7,
    CashMax = 10,
    items = {
        {'phone', 1},
        {'sandwich', math.random(1,6)},
    }
}

Config.RewardTypes = {
    [1] = {
        type = "item"
    },
    [2] = {
        type = "cash",
    },
    [3] = {
        type = "nothing",
    }
}


-- Target Stuff

Target.IconsHighLight = {
    smallBins = "fa-solid fa-hand-back-fist",
    bigBins = "fa-solid fa-hand-back-fist",
}

Target.Icon = {
    smallBins = "fa fa-trash",
    bigBins = "fa fa-dumpster",
}

Target.Label = {
    smallBins = "Search Bin",
    bigBins = "Search Dumpster",
}

Config.Distance = 2

-- Text

Config.Text = {
    SearchingTrash = "Searching Threw Trash",
    SearchDumpster = "Searching Threw Dumpster",

    --Successfully
    FoundSomething = "You Found Something",
    FoundCash = "You Found Cash",

    -- Error
    FoundNothing = "You found nothing in this bin",
    SmallTrashAlreadySearched = "This bin has been searched",
    BigDumsterAlreadySerached = "This dumpster has already been searched",
}
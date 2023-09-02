local Translations = {
    error = {
        ["missing_something"] = "Something is still missing...",
        ["not_enough_police"] = "Not enough law enforcement..",
        ["door_open"] = "It's already open..",
        ["process_cancelled"] = "Cancelled..",
        ["didnt_work"] = "Failed..",
        ["emty_box"] = "It was empty.",
    },
    success = {
        ["worked"] = "Success!",
    }
}
Lang = Locale:new({
phrases = Translations,
warnOnMissing = true})
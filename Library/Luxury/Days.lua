function check_today_special_day()

    local day = os.date("%d")
    local month = os.date("%m")

    local special_days = {
        ["31/12"] = "New Year's Eve 🎉",
        ["01/01"] = "New Year's Day 🥳",
        ["14/02"] = "Valentine's Day 💖",
        ["25/12"] = "Christmas Day 🎄",
        ["14/03"] = "White Day 🍫",
        ["01/04"] = "April Fool's Day 🤡",
        ["31/10"] = "Halloween Day 🎃",
        ["11/11"] = "Singles' Day 💔",
        ["09/03"] = "Barbie Day 🦄",
        ["04/05"] = "Star Wars Day 🌌",
        ["07/07"] = "Tanabata (Star Festival) 🌟",
        ["01/08"] = "Friendship Day 🤝",
        ["12/08"] = "International Youth Day 🌍",
        ["13/09"] = "Roald Dahl Day 📚",
        ["05/10"] = "World Teachers' Day 👩‍🏫",
        ["13/11"] = "World Kindness Day 💕",
        ["08/03"] = "International Women's Day 👩‍🦰",
        ["20/03"] = "International Day of Happiness 😊",
        ["22/04"] = "Earth Day 🌎",
        ["05/05"] = "Children's Day (Japan and Korea) 👶",
        ["08/06"] = "World Oceans Day 🌊",
        ["21/06"] = "International Yoga Day 🧘‍♀️",
        ["30/07"] = "International Friendship Day 🌈",
        ["19/08"] = "World Photography Day 📸",
        ["21/09"] = "International Day of Peace 🕊️",
        ["04/10"] = "World Animal Day 🐾",
        -- 2024
        ["22/10"] = "The Founder Day of Seraphic Hub💫",
        ["28/10"] = "Official Release Day of Seraphic Hub💜",
    }

    local date_key = string.format("%02d/%02d", day, month)

    if special_days[date_key] then
        return true, special_days[date_key]
    else
        return false, "Still Nothing."
    end
end

local Notification = loadstring(game:HttpGet("https://raw.githubusercontent.com/Jxereas/UI-Libraries/main/notification_gui_library.lua", true))()
local is_special_day, message = check_today_special_day()
if is_special_day then
    Notification.new("warning", "Message from Developers", "Happy "..message):deleteTimeout(5)
else
    return ''
end

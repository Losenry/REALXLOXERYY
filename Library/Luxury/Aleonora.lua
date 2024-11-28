if not _G.Scripts_Language or _G.Scripts_Language == "" then
    _G.Scripts_Language = "English"
end

local function loadScript(url)
    if not url then return end

    local success, input = pcall(game.HttpGet, game, url)
    if success and input then
        warn("[1] Loading script from URL: " .. url)
        local func, loadError = loadstring(input)
        if func then
            func()
        else
            warn("Error loading script: " .. loadError)
        end
    else
        warn("[2] Loading script from URL: " .. url)
        loadstring(game:HttpGet(url))();
    end
end

local function Loader(language)
    if language:lower():find("thai") then
        loadScript("https://raw.githubusercontent.com/Losenry/seraph.script/main/Client/LocalScript/Premium/Fisch[2].lua")
    elseif language:lower():find("english") or language:lower():find("international") then
        loadScript("https://raw.githubusercontent.com/Losenry/seraph.script/main/Client/LocalScript/Premium/Fisch[1].lua")
    else
        warn("Unsupported language. Defaulting to English.")
        loadScript("https://raw.githubusercontent.com/Losenry/seraph.script/main/Client/LocalScript/Premium/Fisch[1].lua")
    end
end

Loader(_G.Scripts_Language)

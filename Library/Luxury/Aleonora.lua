if not _G.Scripts_Language or _G.Scripts_Language == "" then
    _G.Scripts_Language = "English"
end

local function loadScript(url)
    loadstring(game:HttpGet(url))();
end

local function Loader(language)
    if language:lower():find("thai") then
        print(language)
        loadScript("https://raw.githubusercontent.com/Losenry/seraph.script/main/Client/LocalScript/Premium/Fisch[2].lua")
    elseif language:lower():find("english") or language:lower():find("international") then
        print(language)
        loadScript("https://raw.githubusercontent.com/Losenry/seraph.script/main/Client/LocalScript/Premium/Fisch[1].lua")
    else
        warn("Unsupported language. Defaulting to English.")
        loadScript("https://raw.githubusercontent.com/Losenry/seraph.script/main/Client/LocalScript/Premium/Fisch[1].lua")
    end
end

Loader(_G.Scripts_Language)

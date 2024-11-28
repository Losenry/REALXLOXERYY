local Language = "English"

if _G.Scripts_Language ~= nil then
    Language = _G.Scripts_Language
else
    Language = "English"
end

local function Loader(language)
    if language:lower():find("thai") then
        print(language)
        loadstring(game:HttpGet("https://raw.githubusercontent.com/Losenry/seraph.script/refs/heads/main/Client/LocalScript/Premium/Fisch_Thai.lua"))();
    elseif language:lower():find("english") or language:lower():find("international") then
        print(language)
        loadstring(game:HttpGet("https://raw.githubusercontent.com/Losenry/seraph.script/refs/heads/main/Client/LocalScript/Premium/Fisch_English.lua"))();
    else
        warn("Unsupported language. Defaulting to English.")
        loadstring(game:HttpGet("https://raw.githubusercontent.com/Losenry/seraph.script/refs/heads/main/Client/LocalScript/Premium/Fisch_English.lua"))();
    end
end

Loader(Language)

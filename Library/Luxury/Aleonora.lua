if _G.Scripts_Language == nil or _G.Scripts_Language == "" then
    _G.Scripts_Language = "English"
end

load = function(url)
    local Input = nil
    if url ~= nil then
        Input = game:HttpGet(url)
        if Input ~= nil then
            warn(url)
            loadstring(Input)();
        end
    end
end

Loader = function(language)
    if string.find(language,"Thai") or string.find(language,"thai") then
        load("https://raw.githubusercontent.com/Losenry/seraph.script/main/Client/LocalScript/Premium/Fisch[2].lua")
    elseif string.find(language,"English") or string.find(language,"International") or nil then
        load("https://raw.githubusercontent.com/Losenry/seraph.script/main/Client/LocalScript/Premium/Fisch[1].lua")
    end
end

Loader(_G.Scripts_Language)

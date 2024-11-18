if _G.Scripts_Language == nil or _G.Scripts_Language == "" then
    _G.Scripts_Language = "English"
end
task.wait(1.5)
if not shared.BetaMode then
    if _G.Scripts_Language == "Thailand" or _G.Scripts_Language == "Thai" then
        warn("[THAI VERSION]")
        loadstring(game:HttpGet("https://raw.githubusercontent.com/Losenry/REALXLOXERYY/main/Library/Luxury/Raphael/Thailand.zen"))()
    elseif _G.Scripts_Language == "English" or _G.Scripts_Language == "Eng" then
        warn("[ENGLISH VERSION]")
        loadstring(game:HttpGet("https://raw.githubusercontent.com/Losenry/REALXLOXERYY/main/Library/Luxury/Raphael/International.zen"))()
    else
        loadstring(game:HttpGet("https://raw.githubusercontent.com/Losenry/REALXLOXERYY/main/Library/Luxury/Raphael/International.zen"))() 
    end
else
    warn("PROJECT 1.5H1 BETA DEVELOPER\n    CLIENT KEYS: ".._G.Key,"\n    ".."CLIENT IDS: ".._G.DiscordId);
    loadstring(game:HttpGet("https://raw.githubusercontent.com/Losenry/REALXLOXERYY/refs/heads/main/Library/Luxury/Hinutt3.lua"))();
end

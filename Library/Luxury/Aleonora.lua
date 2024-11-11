if _G.Scripts_Language == nil or _G.Scripts_Language == "" then
    _G.Scripts_Language = "English"
end
wait(2)
if _G.Scripts_Language == "Thailand" or _G.Scripts_Language == "Thai" then
    warn("[THAI VERSION]")
    loadstring(game:HttpGet("https://raw.githubusercontent.com/Losenry/REALXLOXERYY/main/Library/Luxury/Raphael/Thailand.zen"))()
elseif _G.Scripts_Language == "English" or _G.Scripts_Language == "Eng" then
    warn("[ENGLISH VERSION]")
    loadstring(game:HttpGet("https://raw.githubusercontent.com/Losenry/REALXLOXERYY/main/Library/Luxury/Raphael/International.zen"))()
else
    loadstring(game:HttpGet("https://raw.githubusercontent.com/Losenry/REALXLOXERYY/main/Library/Luxury/Raphael/International.zen"))() 
end

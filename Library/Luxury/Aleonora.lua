if _G.Version == "Thailand" or _G.Version == "Thai" then
    warn("[THAI VERSION]")
    loadstring(game:HttpGet("https://raw.githubusercontent.com/Losenry/REALXLOXERYY/main/Library/Luxury/Raphael/Thailand.zen"))()
elseif _G.Version == "English" or _G.Version == "Eng" then
    warn("[ENGLISH VERSION]")
    loadstring(game:HttpGet("https://raw.githubusercontent.com/Losenry/REALXLOXERYY/main/Library/Luxury/Raphael/International.zen"))()
else
   loadstring(game:HttpGet("https://raw.githubusercontent.com/Losenry/REALXLOXERYY/main/Library/Luxury/Raphael/International.zen"))() 
end

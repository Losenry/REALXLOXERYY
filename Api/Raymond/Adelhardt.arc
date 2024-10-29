--# PATCHED

Alice = function()
    local function generateSecureHash(data)
        local result = ""
        for i = 1, #data do
            result = result .. string.char(bit32.bxor(string.byte(data, i), 0x55))
        end
        return result
    end

    local Aleonor =
        "nez.ronoelA/dnomyaR/ipA/niam/sdaeh/sfer/YYREXOLXLAER/yrnesoL/moc.tnetnocresubuhtig.war//:sptth"
    local Arm0 = string.reverse(Aleonor)
    local Arm1
    local Arm2
    local function validateRequest()
        local success, response =
            pcall(
            function()
                local result =
                    game:HttpGet(
                    Arm0
                )
                if type(result) == "string" then
                    if result:match("valid_response") then
                        return true
                    end
                end
                return false
            end
        )
        return success and response
    end

    local function validateEnvironment()
        local success =
            pcall(
            function()
                local Players = game:GetService("Players")
                local LocalPlayer = Players.LocalPlayer
                local RunService = game:GetService("RunService")

                if not game:IsLoaded() then
                    return false
                end
                if not LocalPlayer then
                    return false
                end
                if RunService:IsStudio() then
                    return false
                end

                local httpCheck = validateRequest()
                if not httpCheck then
                    return false
                end

                return true
            end
        )
        return success
    end

    local function initializeSecureSystem()
        if not validateEnvironment() then
            warn("Security validation failed")
            task.wait(2)
            game.Players.LocalPlayer:Kick("\n Security Check Failed")
            return false
        end

        local heartbeat = 0
        game:GetService("RunService").Heartbeat:Connect(
            function(delta)
                heartbeat = heartbeat + delta
                if heartbeat >= 15 then
                    heartbeat = 0
                    -- ตรวจสอบระบบทุก 15 วินาที
                    if not validateEnvironment() then
                        game.Players.LocalPlayer:Kick("\n Security Violation")
                    end
                end
            end
        )

        return true
    end

    Seraph = function(args)
        P1 = "2ER4PH"
        P2 = P1.."/Grace.txt"
        P3 = P1.."/Logs.txt"

        if not isfolder(P1) then
            makefolder(P1)
        end

        if not isfile(P2) then
            writefile(P2,0)
        end

        if not isfile(P3) then
            writefile(P3,"nil")
        end

        local Arm3 = readfile(P2)
        local Arm4 = Arm3 + 1
        local Arm5 = writefile(P2,Arm4)
        if args then
            local Arm6 = writefile(P3,"Success")
        else
            local Arm6 = writefile(P3,"Error")
        end
        warn("["..Arm4.."] : Success")
    end

    local success =
        pcall(
        function()
            if initializeSecureSystem() then
                A3R0 = function(args, aerotype)
                    invalue = game:HttpGet(args)
                    if type(invalue) == "string" then
                        if aerotype == 1 then
                            return true
                        elseif aerotype == 2 then
                            return invalue
                        end
                    else
                        error("dumb ass")
                    end
                end

                Arm1 = loadstring(game:HttpGet(Arm0))()
                Arm2 = A3R0(Arm0, 2)
                if A3R0(Arm0, 1) == true then
                    if
                        Arm1:match("Aleonor.api") and 
                        Arm2:match('return "Aleonor.api"') and 
                        string.reverse(Arm0) == Aleonor and
                        string.reverse(Aleonor) == Arm0
                    then
                        Seraph(true) 
                        Adreno = true
                    end
                end
            else
                Seraph(false) 
                warn("Security validation failed")
            end
        end
    )

    if not success then
        warn("Critical security error")
        Seraph(false) 
        task.wait(2)
        game.Players.LocalPlayer:Kick("\n Critical Security Error")
    end
    if 
        Adreno and
        Arm1:match("Aleonor.api") and 
        Arm2:match('return "Aleonor.api"') and 
        string.reverse(Arm0) == Aleonor and
        string.reverse(Aleonor) == Arm0 then
        return "N3XT G3NERAT1ON 0F S3RAPH1C SCR1PT"
    else
        Seraph(false) 
        game.Players.LocalPlayer:Kick("\n Patch!!")
    end
end

local UserInputService = game:GetService("UserInputService")
    local TweenService = game:GetService("TweenService")
    
    local function MakeDraggable(topbarobject, object)
        local Dragging = nil
        local DragInput = nil
        local DragStart = nil
        local StartPosition = nil
    
        local function Update(input)
            local Delta = input.Position - DragStart
            local pos =
                UDim2.new(
                    StartPosition.X.Scale,
                    StartPosition.X.Offset + Delta.X,
                    StartPosition.Y.Scale,
                    StartPosition.Y.Offset + Delta.Y
                )
            local Tween = TweenService:Create(object, TweenInfo.new(0.2), {Position = pos})
            Tween:Play()
        end
    
        topbarobject.InputBegan:Connect(
            function(input)
                if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
                    Dragging = true
                    DragStart = input.Position
                    StartPosition = object.Position
    
                    input.Changed:Connect(
                        function()
                            if input.UserInputState == Enum.UserInputState.End then
                                Dragging = false
                            end
                        end
                    )
                end
            end
        )
    
        topbarobject.InputChanged:Connect(
            function(input)
                if
                    input.UserInputType == Enum.UserInputType.MouseMovement or
                    input.UserInputType == Enum.UserInputType.Touch
                then
                    DragInput = input
                end
            end
        )
    
        UserInputService.InputChanged:Connect(
            function(input)
                if input == DragInput and Dragging then
                    Update(input)
                end
            end
        )
    end
    
    
    local function GetDate(med)
        GetSubPrefix = function(d)
        local d = tostring(d):gsub(" ","")
        local M = ""
            if #d == 2 then 
                local N = string.sub(d, #d ,#d + 1)
                M = N == "1" and "st" or N== "2" and "nd"or N == "3" and "rd" or "th"
            end
            return M
        end
        local E = "%A, %B"
        local P = os.date(" %d",os.time())
        local Q = ", %Y."
    
        function formatdate()
            local timeTable = os.date("*t")
            
            local days = {"Sunday", "Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday"}
            local months = {"January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December"}
            
            local formattedDate = string.format("%d %s %d", timeTable.day, months[timeTable.month], timeTable.year)
            
            return formattedDate
        end
    
        if med == 1 then
            Date = os.date(E, os.time())..P..GetSubPrefix(P)..os.date(Q,os.time())
        elseif med == 2 then
            Date = os.date('%Y-%m-%d').." #[ "..formatdate().." ]"
        end
        return Date
    end
    
    reloadinterface = function(value)
        do 
            local ui = game.CoreGui:FindFirstChild(value) 
            if ui then 
                ui:Destroy() 
            end 
        end
    end
    
    reloadinterface("MiniINTERFACE")
    reloadinterface("MainINTERFACE")
    
    local ScreenGui = Instance.new("ScreenGui")
    local ImageButton = Instance.new("ImageButton")
    local UICorner_3 = Instance.new("UICorner")
    ScreenGui.Name = "MiniINTERFACE"
    ScreenGui.Parent = game.CoreGui
    ImageButton.Parent = ScreenGui
    ImageButton.Position = UDim2.new(0.120833337, 0, 0.0952890813, 0)
    ImageButton.Size = UDim2.new(0, 50, 0, 50)
    ImageButton.Image = "rbxassetid://"..getgenv().InterfaceSett.InterfaceLogo
    ImageButton.Draggable = true
    ImageButton.Name = "MARUTG"
    ImageButton.BackgroundColor3 = Color3.new(0, 0, 0)
    ImageButton.MouseButton1Down:connect(function()
        game:GetService("VirtualInputManager"):SendKeyEvent(true,"RightControl",false,game)
        game:GetService("VirtualInputManager"):SendKeyEvent(false,"RightControl",false,game)
    end)
    
    
    UICorner_3.CornerRadius = UDim.new(0, 5)
    UICorner_3.Parent = ImageButton
    
    local lib = {}
    function lib:Win(name)
        local isselected = false
        local uiclosed = false
    
        local NINONOOB = Instance.new("ScreenGui")
        NINONOOB.Name = "MainINTERFACE"
        NINONOOB.Parent = game.CoreGui
        NINONOOB.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
    
        local Main = Instance.new("Frame")
        Main.Name = "Main"
        Main.Parent = NINONOOB
        Main.AnchorPoint = Vector2.new(0.5, 0.5)
        Main.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
        Main.ClipsDescendants = true
        Main.Position = UDim2.new(0.5, 0, 0.5, 0)
        Main.Size = UDim2.new(0,573,0,363)
    
        local UICorner = Instance.new("UICorner")
        UICorner.CornerRadius = UDim.new(0, 5)
        UICorner.Parent = Main
    
        local Top = Instance.new("Frame")
        Top.Name = "Top"
        Top.Parent = Main
        Top.BackgroundColor3 = Color3.fromRGB(15, 15, 15)
        Top.Size = UDim2.new(0, 573, 0, 40)
    
        local UICorner_2 = Instance.new("UICorner")
        UICorner_2.CornerRadius = UDim.new(0, 5)
        UICorner_2.Parent = Top
    
        local DateTitle = Instance.new("TextLabel")
        DateTitle.Name = "DateTitle"
        DateTitle.Parent = Top
        DateTitle.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        DateTitle.BackgroundTransparency = 1.000
        DateTitle.Position = UDim2.new(0, 340, 0, 0)
        DateTitle.Size = UDim2.new(0, 200, 0, 40)
        DateTitle.Font = Enum.Font.GothamBold
        DateTitle.Text = GetDate(getgenv().InterfaceSett.WinBarDate)
        DateTitle.TextTransparency = 0.65
        DateTitle.TextColor3 = Color3.fromRGB(255, 255, 255)
        DateTitle.TextSize = 12.000
        DateTitle.TextXAlignment = Enum.TextXAlignment.Left
    
        local NameHub = Instance.new("TextLabel")
        NameHub.Name = "NameHub"
        NameHub.Parent = Top
        NameHub.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        NameHub.BackgroundTransparency = 1.000
        NameHub.Position = UDim2.new(0, 20, 0, 0)
        NameHub.Size = UDim2.new(0, 200, 0, 40)
        NameHub.Font = Enum.Font.GothamBold
        NameHub.Text = name
        NameHub.TextColor3 = Color3.fromRGB(255, 255, 255)
        NameHub.TextSize = 12.000
        NameHub.TextXAlignment = Enum.TextXAlignment.Left
    
    
        local Line = Instance.new("Frame")
        Line.Name = "Line"
        Line.Parent = Top
        Line.BackgroundColor3 = getgenv().InterfaceSett.ColorSec2
        Line.BorderSizePixel = 0
        Line.Position = UDim2.new(0, 0, 0, 40)
        Line.Size = UDim2.new(1, 0, 0, 1)
    
        local Logo = Instance.new("ImageLabel")
        Logo.Name = "Logo"
        Logo.Parent = Top
        Logo.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        Logo.BackgroundTransparency = 1.000
        Logo.Position = UDim2.new(0, 525, 0, 2)
        Logo.Size = UDim2.new(0, 36, 0, 36)
        Logo.Image = "rbxassetid://"..getgenv().InterfaceSett.InterfaceLogo
    
        local Page = Instance.new("Frame")
        Page.Name = "Page"
        Page.Parent = Main
        Page.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
        Page.Position = UDim2.new(0, 10, 0, 75)
        Page.Size = UDim2.new(1, -20, 0, 278)
    
        local UICorner_3 = Instance.new("UICorner")
        UICorner_3.CornerRadius = UDim.new(0, 5)
        UICorner_3.Parent = Page
    
        local TabScroll = Instance.new("ScrollingFrame")
        TabScroll.Name = "TabScroll"
        TabScroll.Parent = Page
        TabScroll.Active = true
        TabScroll.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        TabScroll.BackgroundTransparency = 1.000
        TabScroll.BorderSizePixel = 0
        TabScroll.Position = UDim2.new(0, 20, 0, -33)
        TabScroll.Size = UDim2.new(1, -40, 0, 30)
        TabScroll.CanvasSize = UDim2.new(0, 0, 0, 0)
        TabScroll.ScrollBarThickness = 0
    
        local TabPadding = Instance.new("UIPadding")
        TabPadding.Name = "TabPadding"
        TabPadding.Parent = TabScroll
        TabPadding.PaddingTop = UDim.new(0, 5)
    
        local PageLine = Instance.new("Frame")
        PageLine.Name = "PageLine"
        PageLine.Parent = Page
        PageLine.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
        PageLine.BorderSizePixel = 0
        PageLine.Size = UDim2.new(1, 0, 0, 2)
    
        local PageFolder = Instance.new("Folder")
        PageFolder.Name = "PageFolder"
        PageFolder.Parent = Page
    
        local TabList = Instance.new("UIListLayout")
        TabList.Name = "TabList"
        TabList.Parent = TabScroll
        TabList.FillDirection = Enum.FillDirection.Horizontal
        TabList.SortOrder = Enum.SortOrder.LayoutOrder
    
        MakeDraggable(Top,Main)
    
        UserInputService.InputBegan:Connect(function(input)
            if input.KeyCode == Enum.KeyCode.RightControl then
                if uiclosed == false then
                    uiclosed = true
                    TweenService:Create(
                        Main,
                        TweenInfo.new(0.4,Enum.EasingStyle.Back,Enum.EasingDirection.In),
                        {Size = UDim2.new(0, 0, 0, 0)}
                    ):Play()
                else
                    uiclosed = false
                    TweenService:Create(
                        Main,
                        TweenInfo.new(0.4,Enum.EasingStyle.Back,Enum.EasingDirection.Out),
                        {Size = UDim2.new(0,573,0,363)}
                    ):Play()
                    repeat wait() until Main.Size == UDim2.new(0,573,0,363)
                end
            end
        end)
    
        local tab = {}
        function tab:CreateTap(txt)
            local TabButton = Instance.new("TextButton")
            TabButton.Name = "TabButton"
            TabButton.Parent = TabScroll
            TabButton.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
            TabButton.AutoButtonColor = false
            TabButton.Size = UDim2.new(0, 100, 0, 25)
            TabButton.Font = Enum.Font.GothamMedium
            TabButton.Text = txt
            TabButton.TextColor3 = Color3.fromRGB(255, 255, 255)
            TabButton.TextSize = 12.000
            TabButton.TextTransparency = 0.5
    
            local UICorner_4 = Instance.new("UICorner")
            UICorner_4.Parent = TabButton
            UICorner_4.CornerRadius = UDim.new(0, 5)
    
            local MainPage = Instance.new("Frame")
            MainPage.Name = "MainPage"
            MainPage.Parent = PageFolder
            MainPage.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            MainPage.BackgroundTransparency = 1.000
            MainPage.Size = UDim2.new(1, 0, 1, 0)
            MainPage.Visible = false
    
            local LeftRight = Instance.new("UIListLayout")
            LeftRight.Name = "LeftRight"
            LeftRight.Parent = MainPage
            LeftRight.FillDirection = Enum.FillDirection.Horizontal
            LeftRight.SortOrder = Enum.SortOrder.LayoutOrder
    
            local Left = Instance.new("ScrollingFrame")
            Left.Name = "Left"
            Left.Parent = MainPage
            Left.Active = true
            Left.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            Left.BackgroundTransparency = 1.000
            Left.BorderSizePixel = 0
            Left.Size = UDim2.new(0.5, 0, 1, 0)
            Left.CanvasSize = UDim2.new(0, 0, 0, 0)
            Left.ScrollBarThickness = 0
    
            local UIPadding = Instance.new("UIPadding")
            UIPadding.Parent = Left
            UIPadding.PaddingLeft = UDim.new(0, 5)
            UIPadding.PaddingTop = UDim.new(0, 5)
    
            local UIListLayout = Instance.new("UIListLayout")
            UIListLayout.Parent = Left
            UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
            UIListLayout.Padding = UDim.new(0, 5)
    
            local Right = Instance.new("ScrollingFrame")
            Right.Name = "Right"
            Right.Parent = MainPage
            Right.Active = true
            Right.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            Right.BackgroundTransparency = 1.000
            Right.BorderSizePixel = 0
            Right.Size = UDim2.new(0.5, 0, 1, 0)
            Right.CanvasSize = UDim2.new(0, 0, 0, 0)
            Right.ScrollBarThickness = 0
    
            local UIListLayout_2 = Instance.new("UIListLayout")
            UIListLayout_2.Parent = Right
            UIListLayout_2.SortOrder = Enum.SortOrder.LayoutOrder
            UIListLayout_2.Padding = UDim.new(0, 5)
    
            local UIPadding_2 = Instance.new("UIPadding")
            UIPadding_2.Parent = Right
            UIPadding_2.PaddingTop = UDim.new(0, 5)
            UIPadding_2.PaddingLeft = UDim.new(0, 5)
    
            TabButton.MouseEnter:Connect(function()
                TweenService:Create(TabButton, TweenInfo.new(0.3), {TextTransparency = 0.00}):Play()
            end)
            TabButton.MouseLeave:Connect(function()
                TweenService:Create(TabButton, TweenInfo.new(0.3), {TextTransparency = 0.5}):Play()
            end)
    
            if isselected == false then
                for i, v in next, PageFolder:GetChildren() do
                    if v.Name == "MainPage" then
                        v.Visible = false
                    end
                    MainPage.Visible = true
                end
                for i,v in next,TabScroll:GetChildren() do
                    if v.Name == "TabButton" then
                        TweenService:Create(
                            v,
                            TweenInfo.new(0.4,Enum.EasingStyle.Quad,Enum.EasingDirection.Out),
                            {TextTransparency = 0.5}
                        ):Play()
                        TweenService:Create(
                            v,
                            TweenInfo.new(0.4,Enum.EasingStyle.Quad,Enum.EasingDirection.Out),
                            {BackgroundColor3 = Color3.fromRGB(20, 20, 20)}
                        ):Play()
                    end
                    TweenService:Create(
                        TabButton,
                        TweenInfo.new(0.4,Enum.EasingStyle.Quad,Enum.EasingDirection.Out),
                        {TextTransparency = 0}
                    ):Play()
                    TweenService:Create(
                        TabButton,
                        TweenInfo.new(0.4,Enum.EasingStyle.Quad,Enum.EasingDirection.Out),
                        {BackgroundColor3 = Color3.fromRGB(25, 25, 25)}
                    ):Play()
                end
                isselected = true
            end
    
            TabButton.MouseButton1Click:Connect(function()
                for i, v in next, PageFolder:GetChildren() do
                    if v.Name == "MainPage" then
                        v.Visible = false
                    end
                    MainPage.Visible = true
                end
                for i,v in next,TabScroll:GetChildren() do
                    if v.Name == "TabButton" then
                        TweenService:Create(
                            v,
                            TweenInfo.new(0.4,Enum.EasingStyle.Quad,Enum.EasingDirection.Out),
                            {TextTransparency = 0.5}
                        ):Play()
                        TweenService:Create(
                            v,
                            TweenInfo.new(0.4,Enum.EasingStyle.Quad,Enum.EasingDirection.Out),
                            {BackgroundColor3 = Color3.fromRGB(20, 20, 20)}
                        ):Play()
                    end
                    TweenService:Create(
                        TabButton,
                        TweenInfo.new(0.4,Enum.EasingStyle.Quad,Enum.EasingDirection.Out),
                        {TextTransparency = 0}
                    ):Play()
                    TweenService:Create(
                        TabButton,
                        TweenInfo.new(0.4,Enum.EasingStyle.Quad,Enum.EasingDirection.Out),
                        {BackgroundColor3 = Color3.fromRGB(25, 25, 25)}
                    ):Play()
                end
            end)
    
            spawn(function()
                game:GetService("RunService").Stepped:Connect(function()
                    pcall(function()
                        Left.CanvasSize = UDim2.new(0, 0, 0, UIListLayout.AbsoluteContentSize.Y + 5)
                        Right.CanvasSize = UDim2.new(0, 0, 0, UIListLayout_2.AbsoluteContentSize.Y + 5)
                        TabScroll.CanvasSize = UDim2.new(0, TabList.AbsoluteContentSize.X, 0, 0)
                    end)
                end)
            end)
    
            local sec = {}
            function sec:Section(Side)
                Side = Side or "Left"
                local Section = Instance.new("Frame")
                Section.Name = "Section"
                if Side == "Left" then
                    Section.Parent = Left
                else
                    Section.Parent = Right
                end
                Section.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
                Section.Size = UDim2.new(1, -5, 0, 45)
                Section.BorderSizePixel = 0
    
                local UIListLayout_3 = Instance.new("UIListLayout")
                UIListLayout_3.Parent = Section
                UIListLayout_3.SortOrder = Enum.SortOrder.LayoutOrder
                UIListLayout_3.Padding = UDim.new(0, 5)
    
                local UIPadding_3 = Instance.new("UIPadding")
                UIPadding_3.Parent = Section
                UIPadding_3.PaddingTop = UDim.new(0, 5)
                UIPadding_3.PaddingLeft = UDim.new(0, 5)
    
                spawn(function()
                    while wait() do
                        pcall(function()
                            Section.Size = UDim2.new(1, -5, 0, UIListLayout_3.AbsoluteContentSize.Y + 10)
                        end)
                    end
                end)
    
                local main = {}
                function main:AddButton(text,callback)
                    local ActualTypes = {
                        Circle = "ImageLabel"
                    }
    
                    local Properties = {
                        Circle = {
                            BackgroundTransparency = 1,
                            Image = "http://www.roblox.com/asset/?id=5554831670"
                        }
                    }
    
                    local Types = {
                        "Circle"
                    }
    
                    function FindType(String)
                        for _, Type in next, Types do
                            if Type:sub(1, #String):lower() == String:lower() then
                                return Type
                            end
                        end
                        return false
                    end
    
                    local Objects = {}
    
                    function Objects.new(Type)
                        local TargetType = FindType(Type)
                        if TargetType then
                            local NewImage = Instance.new(ActualTypes[TargetType])
                            if Properties[TargetType] then
                                for Property, Value in next, Properties[TargetType] do
                                    NewImage[Property] = Value
                                end
                            end
                            return NewImage
                        else
                            return Instance.new(Type)
                        end
                    end
    
                    local function GetXY(GuiObject)
                        local Mouse = game.Players.LocalPlayer:GetMouse()
                        local Max, May = GuiObject.AbsoluteSize.X, GuiObject.AbsoluteSize.Y
                        local Px, Py = math.clamp(Mouse.X - GuiObject.AbsolutePosition.X, 0, Max), math.clamp(Mouse.Y - GuiObject.AbsolutePosition.Y, 0, May)
                        return Px/Max, Py/May
                    end
    
                    local function CircleAnim(GuiObject, EndColour, StartColour)
                        local PX, PY = GetXY(GuiObject)
                        local Circle = Objects.new("Circle")
                        Circle.Size = UDim2.fromScale(0,0)
                        Circle.Position = UDim2.fromScale(PX,PY)
                        Circle.ImageColor3 = StartColour or GuiObject.ImageColor3
                        Circle.ZIndex = 200
                        Circle.Parent = GuiObject
                        local Size = GuiObject.AbsoluteSize.X
                        TweenService:Create(Circle, TweenInfo.new(0.4), {Position = UDim2.fromScale(PX,PY) - UDim2.fromOffset(Size/2,Size/2), ImageTransparency = 1, ImageColor3 = EndColour, Size = UDim2.fromOffset(Size,Size)}):Play()
                        spawn(function()
                            wait(0.4)
                            Circle:Destroy()
                        end)
                    end
    
                    local Button = Instance.new("Frame")
                    Button.Name = "Button"
                    Button.Parent = Section
                    Button.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                    Button.BackgroundTransparency = 1.000
                    Button.Size = UDim2.new(1, -5, 0, 23)
    
                    local TextButton = Instance.new("TextButton")
                    TextButton.Parent = Button
                    TextButton.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
                    TextButton.BorderColor3 = Color3.fromRGB(35, 35, 35)
                    TextButton.Size = UDim2.new(1, 0, 0, 23)
                    TextButton.AutoButtonColor = false
                    TextButton.Font = Enum.Font.Gotham
                    TextButton.Text = text
                    TextButton.TextColor3 = Color3.fromRGB(255, 255, 255)
                    TextButton.TextSize = 12.000
                    TextButton.ClipsDescendants = true
    
                    Button.MouseEnter:Connect(function()
                        TweenService:Create(TextButton, TweenInfo.new(0.3), {BorderColor3 = getgenv().InterfaceSett.ColorSec1}):Play()
                    end)
                    Button.MouseLeave:Connect(function()
                        TweenService:Create(TextButton, TweenInfo.new(0.3), {BorderColor3 = Color3.fromRGB(35,35,35)}):Play()
                    end)
    
                    TextButton.MouseButton1Click:Connect(function()
                        CircleAnim(TextButton, Color3.fromRGB(255, 255, 255), Color3.fromRGB(255, 255, 255))
                        callback()
                    end)
                end
                function main:AddToggle(name,options)
                    local visualTitle = name or "Toggle"
                    local istoggled = options.Stats or false
                    local visualcallback = options.callback or function() end
    
                    local Toggle = Instance.new("Frame")
                    Toggle.Name = "Toggle"
                    Toggle.Parent = Section
                    Toggle.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                    Toggle.BackgroundTransparency = 1.000
                    Toggle.Size = UDim2.new(1, -5, 0, 23)
    
                    local Button = Instance.new("TextButton")
                    Button.Name = "Button"
                    Button.Parent = Toggle
                    Button.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                    Button.BackgroundTransparency = 1.000
                    Button.Size = UDim2.new(1, 0, 1, 0)
                    Button.Font = Enum.Font.SourceSans
                    Button.Text = ""
                    Button.TextColor3 = Color3.fromRGB(0, 0, 0)
                    Button.TextSize = 12.000
    
                    local Image = Instance.new("Frame")
                    Image.Name = "Image"
                    Image.Parent = Toggle
                    Image.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
                    Image.BorderColor3 = Color3.fromRGB(50, 50, 50)
                    Image.Position = UDim2.new(0, 10, 0, 3)
                    Image.Size = UDim2.new(0, 16, 0, 16)
    
                    local Check = Instance.new("Frame")
                    Check.Name = "Check"
                    Check.Parent = Image
                    Check.AnchorPoint = Vector2.new(0.5, 0.5)
                    Check.BackgroundColor3 = getgenv().InterfaceSett.ColorSec2
                    Check.BackgroundTransparency = 0.000
                    Check.Size = UDim2.new(0, 0, 0, 0)
                    Check.Position = UDim2.new(0.5, 0, 0.5, 0)
    
                    local ToggleTitle = Instance.new("TextLabel")
                    ToggleTitle.Name = "ToggleTitle"
                    ToggleTitle.Parent = Toggle
                    ToggleTitle.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                    ToggleTitle.BackgroundTransparency = 1.000
                    ToggleTitle.Position = UDim2.new(0, 40, 0, 0)
                    ToggleTitle.Size = UDim2.new(0, 256, 0, 23)
                    ToggleTitle.Font = Enum.Font.Gotham
                    ToggleTitle.Text = visualTitle
                    ToggleTitle.TextColor3 = Color3.fromRGB(255, 255, 255)
                    ToggleTitle.TextSize = 12.000
                    ToggleTitle.TextXAlignment = Enum.TextXAlignment.Left
                    ToggleTitle.TextTransparency = 0.35
    
                    local ToggleCorner = Instance.new("UICorner")
    
                    ToggleCorner.CornerRadius = UDim.new(1, 0)
                    ToggleCorner.Parent = Image
    
                    local ToggleImageCorner = Instance.new("UICorner")
    
                    ToggleImageCorner.CornerRadius = UDim.new(1, 0)
                    ToggleImageCorner.Parent = Check
    
                    if options.Stats == true then
                        TweenService:Create(
                            Check,
                            TweenInfo.new(0.3),
                            {Size = UDim2.new(0, 16, 0, 16)}
                        ):Play()   
                        pcall(options.callback,istoggled) 
                    end
    
                    Toggle.MouseEnter:Connect(function()
                        TweenService:Create(Image, TweenInfo.new(0.3), {BorderColor3 = getgenv().InterfaceSett.ColorSec1}):Play()
                    end)
                    Toggle.MouseLeave:Connect(function()
                        TweenService:Create(Image, TweenInfo.new(0.3), {BorderColor3 = Color3.fromRGB(50,50,50)}):Play()
                    end)
    
                    Button.MouseEnter:Connect(function()
                        TweenService:Create(ToggleTitle, TweenInfo.new(0.3), {TextTransparency = 0.00}):Play()
                    end)
                    Button.MouseLeave:Connect(function()
                        TweenService:Create(ToggleTitle, TweenInfo.new(0.3), {TextTransparency = 0.35}):Play()
                    end)
    
                    Button.MouseButton1Click:Connect(function()
                        if istoggled == false then
                            TweenService:Create(
                                Check,
                                TweenInfo.new(0.3,Enum.EasingStyle.Quad,Enum.EasingDirection.Out),
                                {Size = UDim2.new(0, 16, 0, 16)}
                            ):Play()
                            TweenService:Create(
                                ToggleTitle,
                                TweenInfo.new(0.2,Enum.EasingStyle.Quad,Enum.EasingDirection.Out),
                                {TextTransparency = 0.00}
                            ):Play()
    
                        else
                            TweenService:Create(
                                Check,
                                TweenInfo.new(0.3,Enum.EasingStyle.Quad,Enum.EasingDirection.Out),
                                {Size = UDim2.new(0, 0, 0, 0)}
                            ):Play()
                            TweenService:Create(
                                ToggleTitle,
                                TweenInfo.new(0.2,Enum.EasingStyle.Quad,Enum.EasingDirection.Out),
                                {TextTransparency = 0.35}
                            ):Play()
                        end
                        istoggled = not istoggled
                        pcall(options.callback,istoggled) 
                    end)
                end
    
                function main:Title(text)
                    local Title = Instance.new("Frame")
                    Title.Name = "Title"
                    Title.Parent = Section
                    Title.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                    Title.BackgroundTransparency = 1.000
                    Title.Size = UDim2.new(1, 0, 0, 23)
    
                    local TitleLabel = Instance.new("TextLabel")
                    TitleLabel.Name = "TitleLabel"
                    TitleLabel.Parent = Title
                    TitleLabel.AnchorPoint = Vector2.new(0.5, 0)
                    TitleLabel.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
                    TitleLabel.BorderSizePixel = 0
                    TitleLabel.Position = UDim2.new(0.5, 0, 0, 0)
                    TitleLabel.Size = UDim2.new(0, 150, 0, 23)
                    TitleLabel.Font = Enum.Font.Gotham
                    TitleLabel.Text = text
                    TitleLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
                    TitleLabel.TextSize = 12.000
    
                    local Line = Instance.new("Frame")
                    Line.Name = "Line"
                    Line.Parent = Title
                    Line.AnchorPoint = Vector2.new(0, 0.5)
                    Line.BackgroundColor3 = Color3.fromRGB(100, 100, 100)
                    Line.BorderSizePixel = 0
                    Line.Position = UDim2.new(0, 0, 0.5, 0)
                    Line.Size = UDim2.new(1, -5, 0, 1)
                    Line.ZIndex = 0
                end
    
                function main:AddLabel(text)
                    local Label = Instance.new("Frame")
                    Label.Name = "Title"
                    Label.Parent = Section
                    Label.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                    Label.BackgroundTransparency = 1.000
                    Label.Size = UDim2.new(1, 0, 0, 23)
    
                    local LabelTitle = Instance.new("TextLabel")
                    LabelTitle.Name = "TitleLabel"
                    LabelTitle.Parent = Label
                    LabelTitle.AnchorPoint = Vector2.new(0.5, 0)
                    LabelTitle.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
                    LabelTitle.BorderSizePixel = 0
                    LabelTitle.Position = UDim2.new(0.5, 0, 0, 0)
                    LabelTitle.Size = UDim2.new(0, 150, 0, 23)
                    LabelTitle.Font = Enum.Font.Gotham
                    LabelTitle.Text = text
                    LabelTitle.TextColor3 = Color3.fromRGB(255, 255, 255)
                    LabelTitle.TextSize = 12.000
    
                    local LabelFunction = {}
    
                    function LabelFunction.UpdateColor(value)
                        TweenService:Create(
                            LabelTitle,
                            TweenInfo.new(0.1, Enum.EasingStyle.Linear, Enum.EasingDirection.Out),
                            {TextColor3 = value}
                        ):Play()
                    end
    
                    function LabelFunction:Options()
                        return LabelTitle
                    end
                    return LabelFunction
    
                end
                function main:Line()
                    local Line = Instance.new("Frame")
                    Line.Name = "Line"
                    Line.Parent = Section
                    Line.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                    Line.BackgroundTransparency = 1.000
                    Line.Size = UDim2.new(1, -5, 0, 23)
    
                    local LineFrame = Instance.new("Frame")
                    LineFrame.Name = "LineFrame"
                    LineFrame.Parent = Line
                    LineFrame.AnchorPoint = Vector2.new(0, 0.5)
                    LineFrame.BackgroundColor3 = Color3.fromRGB(100, 100, 100)
                    LineFrame.BorderSizePixel = 0
                    LineFrame.Position = UDim2.new(0, 0, 0.5, 0)
                    LineFrame.Size = UDim2.new(1, 0, 0, 1)
                    LineFrame.ZIndex = 0
                end
                function main:AddTextBox(name,options)
    
                    local visualTitle = name or "TextBox"
                    local visualplaceholder = options.Placeholder or "Placeholder"
                    local visualcallback = options.callback or function() end
    
                    local Textbox = Instance.new("Frame")
                    Textbox.Name = "Textbox"
                    Textbox.Parent = Section
                    Textbox.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                    Textbox.BackgroundTransparency = 1.000
                    Textbox.Size = UDim2.new(1, -5, 0, 36)
    
                    local TextLabel = Instance.new("TextLabel")
                    TextLabel.Parent = Textbox
                    TextLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                    TextLabel.BackgroundTransparency = 1.000
                    TextLabel.Position = UDim2.new(0, 10, 0, 0)
                    TextLabel.Size = UDim2.new(1, -10, 0, 18)
                    TextLabel.Font = Enum.Font.Gotham
                    TextLabel.Text = visualTitle
                    TextLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
                    TextLabel.TextSize = 12.000
                    TextLabel.TextXAlignment = Enum.TextXAlignment.Left
                    TextLabel.TextTransparency = 0.5
    
                    local TextBox = Instance.new("TextBox")
                    TextBox.Parent = Textbox
                    TextBox.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
                    TextBox.BorderColor3 = Color3.fromRGB(50, 50, 50)
                    TextBox.Position = UDim2.new(0, 0, 0, 18)
                    TextBox.Size = UDim2.new(1, 0, 0, 18)
                    TextBox.Font = Enum.Font.Gotham
                    TextBox.Text = visualplaceholder or ""
                    TextBox.TextColor3 = Color3.fromRGB(255, 255, 255)
                    TextBox.TextSize = 12.000
    
                    TextBox.Focused:Connect(function()
                        TweenService:Create(TextBox, TweenInfo.new(0.3), {BorderColor3 = getgenv().InterfaceSett.ColorSec1}):Play()
                        TweenService:Create(TextLabel, TweenInfo.new(0.3), {TextTransparency = 0}):Play()
                    end)
                    TextBox.FocusLost:Connect(function()
                        if TextBox.Text == "" then TextBox.Text = "N/A" end
                        TweenService:Create(TextBox, TweenInfo.new(0.3), {BorderColor3 = Color3.fromRGB(50,50,50)}):Play()
                        TweenService:Create(TextLabel, TweenInfo.new(0.3), {TextTransparency = 0.5}):Play()
                        pcall(options.callback,TextBox.Text)
                    end)
                end
                function main:AddSlider(name,options)
    
                    local visualTitle = name or "Slider : nil"
                    local visualMin = options.min or 0
                    local visualMax = options.max or 100
                    local visualDefault = options.value or 50
                    local visualcallback = options.callback or function() end
    
                    if tonumber(visualDefault) > tonumber(visualMax) then
                        visualDefault = (visualMax)
                    end                
                    if tonumber(visualDefault) < tonumber(visualMin) then
                        visualDefault = (visualMax)
                    end
                    options.callback(visualDefault)
    
                    local Slider = Instance.new("Frame")
                    Slider.Name = "Slider"
                    Slider.Parent = Section
                    Slider.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                    Slider.BackgroundTransparency = 1.000
                    Slider.Size = UDim2.new(1, -5, 0, 42)
    
                    local SliderTitle = Instance.new("TextLabel")
                    SliderTitle.Name = "SliderTitle"
                    SliderTitle.Parent = Slider
                    SliderTitle.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                    SliderTitle.BackgroundTransparency = 1.000
                    SliderTitle.Position = UDim2.new(0, 10, 0, 0)
                    SliderTitle.Size = UDim2.new(0, 150, 0, 23)
                    SliderTitle.Font = Enum.Font.Gotham
                    SliderTitle.Text = visualTitle
                    SliderTitle.TextColor3 = Color3.fromRGB(255, 255, 255)
                    SliderTitle.TextSize = 12.000
                    SliderTitle.TextTransparency = 0.500
                    SliderTitle.TextXAlignment = Enum.TextXAlignment.Left
    
                    local Amount = Instance.new("TextBox")
                    Amount.Name = "Amount"
                    Amount.Parent = Slider
                    Amount.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
                    Amount.BorderColor3 = Color3.fromRGB(50, 50, 50)
                    Amount.Position = UDim2.new(1, -47, 0, 0)
                    Amount.Size = UDim2.new(0, 47, 0, 20)
                    Amount.Font = Enum.Font.Gotham
                    Amount.Text = visualDefault
                    Amount.TextColor3 = Color3.fromRGB(255, 255, 255)
                    Amount.TextSize = 12.000
    
                    local Bar = Instance.new("Frame")
                    Bar.Name = "Bar"
                    Bar.Parent = Slider
                    Bar.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
                    Bar.Position = UDim2.new(0, 5, 0, 25)
                    Bar.Size = UDim2.new(1, -5, 0, 5)
    
                    local Fill = Instance.new("Frame")
                    Fill.Name = "Fill"
                    Fill.Parent = Bar
                    Fill.BackgroundColor3 = getgenv().InterfaceSett.ColorSec2
                    Fill.Size = UDim2.new(0, 0, 1, 0)
    
                    Amount.Focused:Connect(function()
                        TweenService:Create(Amount, TweenInfo.new(0.3), {BorderColor3 = getgenv().InterfaceSett.ColorSec1}):Play()
                    end)
                    Amount.FocusLost:Connect(function()
                        TweenService:Create(Amount, TweenInfo.new(0.3), {BorderColor3 = Color3.fromRGB(50,50,50)}):Play()
                    end)
    
                    Slider.MouseEnter:Connect(function()
                        TweenService:Create(SliderTitle, TweenInfo.new(0.3), {TextTransparency = 0}):Play()
                    end)
                    Slider.MouseLeave:Connect(function()
                        TweenService:Create(SliderTitle, TweenInfo.new(0.3), {TextTransparency = 0.5}):Play()
                    end)
    
                    Fill:TweenSize(UDim2.new((Amount.Text or 0) / visualMax, 0, 0, 5), "Out", "Sine", 0.2, true)
                    Slider.MouseEnter:Connect(function()
                        local function move(input)
                            local pos = UDim2.new(
                                math.clamp((input.Position.X - Bar.AbsolutePosition.X) / Bar.AbsoluteSize.X, 0, 1),
                                0,
                                0,
                                5
                            )
    
                            Fill:TweenSize(pos, "Out", "Sine", 0.2, true)
                            local value = math.floor(((pos.X.Scale * visualMax) / visualMax) * (visualMax - visualMin) + visualMin)
                            Amount.Text = tostring(value)
                            options.callback(value)
                        end
                        local dragging = false
                        Bar.InputBegan:Connect(
                            function(input)
                                if input.UserInputType == Enum.UserInputType.MouseButton1 then
                                    dragging = true
    
                                end
                            end
                        )
                        Bar.InputEnded:Connect(
                            function(input)
                                if input.UserInputType == Enum.UserInputType.MouseButton1 then
                                    dragging = false
    
                                end
                            end
                        )
                        game:GetService("UserInputService").InputChanged:Connect(function(input)
                            if dragging and input.UserInputType == Enum.UserInputType.MouseMovement then
                                move(input)
                            end
                        end)
    
                        Amount.FocusLost:Connect(function()
                            if Amount.Text == "" then
                                Amount.Text = visualDefault
                            end
                            if tonumber(Amount.Text) > visualMax then
                                Amount.Text = visualMax
                            end
                            if tonumber(Amount.Text) < visualMin then
                                Amount.Text = visualMin
                            end
                            Fill:TweenSize(UDim2.new((Amount.Text or 0) / visualMax, 0, 0, 5), "Out", "Sine", 0.2, true)
                            Amount.Text = tostring(Amount.Text) -- and math.floor( (Amount.Text / visualMax) * (visualMax - visualMin) + visualMin) )
                            pcall(options.callback, Amount.Text)
                        end)
                    end)
                end
                function main:Dropdown(text,default,multi,option,callback)
                    local ActualTypes = {
                        Circle = "ImageLabel"
                    }
    
                    local Properties = {
                        Circle = {
                            BackgroundTransparency = 1,
                            Image = "http://www.roblox.com/asset/?id=5554831670"
                        }
                    }
    
                    local Types = {
                        "Circle"
                    }
    
                    function FindType(String)
                        for _, Type in next, Types do
                            if Type:sub(1, #String):lower() == String:lower() then
                                return Type
                            end
                        end
                        return false
                    end
    
                    local Objects = {}
    
                    function Objects.new(Type)
                        local TargetType = FindType(Type)
                        if TargetType then
                            local NewImage = Instance.new(ActualTypes[TargetType])
                            if Properties[TargetType] then
                                for Property, Value in next, Properties[TargetType] do
                                    NewImage[Property] = Value
                                end
                            end
                            return NewImage
                        else
                            return Instance.new(Type)
                        end
                    end
    
                    local function GetXY(GuiObject)
                        local Mouse = game.Players.LocalPlayer:GetMouse()
                        local Max, May = GuiObject.AbsoluteSize.X, GuiObject.AbsoluteSize.Y
                        local Px, Py = math.clamp(Mouse.X - GuiObject.AbsolutePosition.X, 0, Max), math.clamp(Mouse.Y - GuiObject.AbsolutePosition.Y, 0, May)
                        return Px/Max, Py/May
                    end
    
                    local function CircleAnim(GuiObject, EndColour, StartColour)
                        local PX, PY = GetXY(GuiObject)
                        local Circle = Objects.new("Circle")
                        Circle.Size = UDim2.fromScale(0,0)
                        Circle.Position = UDim2.fromScale(PX,PY)
                        Circle.ImageColor3 = StartColour or GuiObject.ImageColor3
                        Circle.ZIndex = 200
                        Circle.Parent = GuiObject
                        local Size = GuiObject.AbsoluteSize.X
                        TweenService:Create(Circle, TweenInfo.new(0.4), {Position = UDim2.fromScale(PX,PY) - UDim2.fromOffset(Size/2,Size/2), ImageTransparency = 1, ImageColor3 = EndColour, Size = UDim2.fromOffset(Size,Size)}):Play()
                        spawn(function()
                            wait(0.4)
                            Circle:Destroy()
                        end)
                    end
    
                    -- 55 85 140
                    local hovxrz = false
                    local count = 0
                    if multi then
                        Multi = {}
                    end
                    local drop = {}
                    drop.values = {}
                    local DropSize = 55
    
                    local Dropdown = Instance.new("Frame")
                    Dropdown.Name = "Dropdown"
                    Dropdown.Parent = Section
                    Dropdown.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
                    Dropdown.BorderSizePixel = 0
                    Dropdown.ClipsDescendants = true
                    Dropdown.Size = UDim2.new(1, -5, 0, 23)
    
                    local DropdownTitle = Instance.new("TextLabel")
                    DropdownTitle.Name = "DropdownTitle"
                    DropdownTitle.Parent = Dropdown
                    DropdownTitle.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                    DropdownTitle.BackgroundTransparency = 4.000
                    DropdownTitle.Position = UDim2.new(0, 10, 0, 0)
                    DropdownTitle.Size = UDim2.new(1, -32, 0, 23)
                    DropdownTitle.Font = Enum.Font.Gotham
                    DropdownTitle.Text = text.." : "..tostring(default or "None")
                    DropdownTitle.TextColor3 = Color3.fromRGB(255, 255, 255)
                    DropdownTitle.TextSize = 12.000
                    DropdownTitle.TextTransparency = 0.500
                    DropdownTitle.TextXAlignment = Enum.TextXAlignment.Left
    
                    local ImageLabel = Instance.new("ImageLabel")
                    ImageLabel.Parent = Dropdown
                    ImageLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                    ImageLabel.BackgroundTransparency = 1.000
                    ImageLabel.Position = UDim2.new(1, -23, 0, 3.5)
                    ImageLabel.Size = UDim2.new(0, 17, 0, 17)
                    ImageLabel.Image = "rbxassetid://6034848752"
    
                    local Drop = Instance.new("TextButton")
                    Drop.Name = "Button"
                    Drop.Parent = Dropdown
                    Drop.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                    Drop.BackgroundTransparency = 1.000
                    Drop.Size = UDim2.new(1, 0, 0, 23)
                    Drop.Font = Enum.Font.SourceSans
                    Drop.Text = ""
                    Drop.TextColor3 = Color3.fromRGB(0, 0, 0)
                    Drop.TextSize = 12.000
    
                    local DropScroll = Instance.new("ScrollingFrame")
                    DropScroll.Name = "DropScroll"
                    DropScroll.Parent = Dropdown
                    DropScroll.Active = true
                    DropScroll.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                    DropScroll.BackgroundTransparency = 1.000
                    DropScroll.Position = UDim2.new(0, 0, 0, 23)
                    DropScroll.Size = UDim2.new(1, 0, 0, 112)
                    DropScroll.CanvasSize = UDim2.new(0, 0, 0, 0)
                    DropScroll.ScrollBarThickness = 0
    
                    local UIPadding = Instance.new("UIPadding")
                    UIPadding.Parent = DropScroll
                    UIPadding.PaddingLeft = UDim.new(0, 10)
                    UIPadding.PaddingTop = UDim.new(0, 10)
    
                    local UIListLayout = Instance.new("UIListLayout")
                    UIListLayout.Parent = DropScroll
                    UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
                    UIListLayout.Padding = UDim.new(0, 5)
    
                    function drop:isSelected(item)
                        for i, v in pairs(drop.values) do
                            if v == item then
                                return true
                            end
                        end
                        return false
                    end
    
                    function drop:updateText(pp)
                        DropdownTitle.Text = text.." : "..pp
                    end
                    drop.Changed = Instance.new("BindableEvent")
                    function drop:Set(value)
                        if type(value) == "table" then
                            drop.values = value
                            drop:updateText(table.concat(value, ", "))
                            pcall(callback, value)
                        else
                            drop.values = {
                                value
                            }
                            drop:updateText(value)
                            pcall(callback, value)
                        end
                        drop.Changed:Fire(value)
                    end
    
                    if default then
                        drop:Set(default)
                    end
                    function drop:Clear()
                        DropSize = 55
                        DropdownTitle.Text = ""
                        TweenService:Create(
                            Dropdown,
                            TweenInfo.new(0.3,Enum.EasingStyle.Quad,Enum.EasingDirection.Out),
                            {Size = UDim2.new(1,-5,0,23)}
                        ):Play()
                        TweenService:Create(
                            ImageLabel,
                            TweenInfo.new(0.3,Enum.EasingStyle.Quad,Enum.EasingDirection.Out),
                            {Rotation = 0}
                        ):Play()
                        hovxrz = false
                        for i, v in next, DropScroll:GetChildren() do
                            if v:IsA("TextButton") then
                                v:Destroy()
                            end
                        end
                        drop.values = nil
                    end
    
                    function drop:Add(vv)
                        local count = 0
                        for i,v in next,DropScroll:GetChildren() do 
                            count = count + 1
                            if count == 1 then
                                DropSize = 55
                            elseif count == 2 then
                                DropSize = 85
                            elseif count == 3 then
                                DropSize = 122
                            elseif count > 3 then
                                DropSize = 142
                            end
                        end
                        local Button = Instance.new("TextButton")
                        Button.Name = "Button"
                        Button.Parent = DropScroll
                        Button.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
                        Button.BorderColor3 = Color3.fromRGB(35, 35, 35)
                        Button.ClipsDescendants = true
                        Button.Size = UDim2.new(1, -10, 0, 23)
                        Button.AutoButtonColor = false
                        Button.Font = Enum.Font.Gotham
                        Button.Text = tostring(vv)
                        Button.TextColor3 = Color3.fromRGB(255, 255, 255)
                        Button.TextSize = 12.000
    
                        DropScroll.CanvasSize = UDim2.new(0,0,0,UIListLayout.AbsoluteContentSize.Y + 10)
    
                        Button.MouseEnter:Connect(function()
                            TweenService:Create(Button, TweenInfo.new(0.3), {BorderColor3 = getgenv().InterfaceSett.ColorSec1}):Play()
                        end)
                        Button.MouseLeave:Connect(function()
                            TweenService:Create(Button, TweenInfo.new(0.3), {BorderColor3 = Color3.fromRGB(35,35,35)}):Play()
                        end)
    
                        Button.MouseButton1Click:Connect(function()
                            CircleAnim(Button, Color3.fromRGB(255, 255, 255), Color3.fromRGB(255, 255, 255))
                            if multi then
                                if drop:isSelected(vv) then
                                    for i2, v2 in pairs(drop.values) do
                                        if v2 == vv then
                                            table.remove(drop.values, i2)
                                        end
                                    end
                                    drop:Set(drop.values)
                                    Button.TextTransparency = 0
                                else
                                    table.insert(drop.values, vv)
                                    drop:Set(drop.values)
                                    Button.TextTransparency = 0
                                end
                                return
                            end
                            drop:Set(vv)
                            return
                        end)
                        spawn(function()
                            while wait() do
                                pcall(function()
                                    if multi and drop:isSelected(vv) or drop.values[1] == vv then
                                        Button.TextTransparency = 0
                                    else
                                        Button.TextTransparency = 0.5
                                    end
                                end)
                            end
                        end)
                    end
    
                    for i,v in next,option do 
                        count = count + 1
                        if count == 1 then
                            DropSize = 55
                        elseif count == 2 then
                            DropSize = 85
                        elseif count == 3 then
                            DropSize = 122
                        elseif count > 3 then
                            DropSize = 142
                        end
    
                        local Button = Instance.new("TextButton")
                        Button.Name = "Button"
                        Button.Parent = DropScroll
                        Button.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
                        Button.BorderColor3 = Color3.fromRGB(35, 35, 35)
                        Button.ClipsDescendants = true
                        Button.Size = UDim2.new(1, -10, 0, 23)
                        Button.AutoButtonColor = false
                        Button.Font = Enum.Font.Gotham
                        Button.Text = tostring(v)
                        Button.TextColor3 = Color3.fromRGB(255, 255, 255)
                        Button.TextSize = 12.000
    
                        DropScroll.CanvasSize = UDim2.new(0,0,0,UIListLayout.AbsoluteContentSize.Y + 10)
    
                        Button.MouseEnter:Connect(function()
                            TweenService:Create(Button, TweenInfo.new(0.3), {BorderColor3 = getgenv().InterfaceSett.ColorSec1}):Play()
                        end)
                        Button.MouseLeave:Connect(function()
                            TweenService:Create(Button, TweenInfo.new(0.3), {BorderColor3 = Color3.fromRGB(35,35,35)}):Play()
                        end)
    
    
                        Button.MouseButton1Click:Connect(function()
                            CircleAnim(Button, Color3.fromRGB(255, 255, 255), Color3.fromRGB(255, 255, 255))
                            if multi then
                                if drop:isSelected(v) then
                                    for i2, v2 in pairs(drop.values) do
                                        if v2 == v then
                                            table.remove(drop.values, i2)
                                        end
                                    end
                                    drop:Set(drop.values)
                                else
                                    table.insert(drop.values, v)
                                    drop:Set(drop.values)
                                end
                                return
                            end
                            drop:Set(v)
                            return
                        end)
                        spawn(function()
                            while wait() do
                                pcall(function()
                                    if multi and drop:isSelected(v) or drop.values[1] == v then
                                        Button.TextTransparency = 0
                                    else
                                        Button.TextTransparency = 0.5
                                    end
                                end)
                            end
                        end)
                    end 
    
                    Drop.MouseButton1Click:Connect(function()
                        if hovxrz == false then
                            Dropdown.Size = UDim2.new(1,-5,0,DropSize)
                            TweenService:Create(
                                ImageLabel,
                                TweenInfo.new(0.2,Enum.EasingStyle.Quad,Enum.EasingDirection.Out),
                                {Rotation = - 180}
                            ):Play()
    
                            -- ImageLabel.Rotation = - 180
                        else
                            Dropdown.Size = UDim2.new(1,-5,0,23)
                            ImageLabel.Rotation = 0
                            TweenService:Create(
                                ImageLabel,
                                TweenInfo.new(0.5,Enum.EasingStyle.Quad,Enum.EasingDirection.Out),
                                {Rotation = 0}
                            ):Play()
                            --  ImageLabel.Rotation = 0
                        end
                        DropScroll.CanvasSize = UDim2.new(0,0,0,UIListLayout.AbsoluteContentSize.Y + 10)
                        hovxrz = not hovxrz
                    end)
    
                    return drop
                end
                return main
            end
            return sec
        end
        return tab
    end
return lib


-- too lazy to clean it lmfao
local Hidrous = {}

Hidrous.SetCliboard = (function(str)
    local everyClipboard = setclipboard or toclipboard or set_clipboard or (Clipboard and Clipboard.set) -- from infinite yield cuz yes
    everyClipboard(str)
end)

function Hidrous:DraggingEnabled(frame, parent)
	parent = parent or frame

	local gui = parent
	local dragging
	local dragInput
	local dragStart
	local startPos

	local function update(input)
		local delta = input.Position - dragStart
		game:GetService("TweenService"):Create(gui,TweenInfo.new(0.15), {
			Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
		}):Play()
		--gui.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
	end

	gui.InputBegan:Connect(function(input)
		if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
			dragging = true
			dragStart = input.Position
			startPos = gui.Position

			input.Changed:Connect(function()
				if input.UserInputState == Enum.UserInputState.End then
					dragging = false
				end
			end)
		end
	end)

	gui.InputChanged:Connect(function(input)
		if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
			dragInput = input
		end
	end)

	game:GetService("UserInputService").InputChanged:Connect(function(input)
		if input == dragInput and dragging then
			update(input)
		end
	end)
end
function Hidrous.SetupUI(con)
    con = con or {}
    con.Name = con.Name or "Hidrous UI Library"
    con.SecondName = con.SecondName or "1.0.0"
    con.BottomBarEnabled = con.BottomBarEnabled or false
    con.BottomBarTable = con.BottomBarTable or {"Welcome, ".. game:GetService("Players").LocalPlayer.Character.Humanoid.DisplayName}
    con.Discord = con.Discord or {}
    con.Discord.Enabled = con.Discord.Enabled or false
    con.Discord.ServerImage = con.Discord.ServerImage or " "
    con.Discord.ServerName = con.Discord.ServerName or ""
    con.Discord.AcceptCallback = con.Discord.AcceptCallback or function() end

    local ScreenGui = Instance.new("ScreenGui")
    local shadowHolder = Instance.new("Frame")
    local ambientShadow = Instance.new("ImageLabel")
    local Levy = Instance.new("Frame")
    local TopBarBackground = Instance.new("Frame")
    local TopBarMain = Instance.new("Frame")
    local TitleMain = Instance.new("TextLabel")
    local TopBarListLayout = Instance.new("UIListLayout")
    local TitleSecond = Instance.new("TextLabel")
    local TitleSecondCorner = Instance.new("UICorner")
    local TitleGradient = Instance.new("UIGradient")
    local TopBarBackButton = Instance.new("ImageButton")
    local Dashboard = Instance.new("ScrollingFrame")
    local UIListLayout = Instance.new("UIListLayout")
    local BottomBarBackground = Instance.new("Frame")
    local BottomBarLeft = Instance.new("Frame")
    local BottomBarLeftListLayout = Instance.new("UIListLayout")
    local BottomBarLeftText = Instance.new("TextLabel")
    local umbraShadow = Instance.new("ImageLabel")
    local penumbraShadow = Instance.new("ImageLabel")
    local TabsContainer = Instance.new("Frame")

    ScreenGui.Parent = game:GetService("RunService"):IsStudio() and game:GetService("Players").LocalPlayer:WaitForChild("PlayerGui") or game:GetService("CoreGui")
    ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

    BottomBarBackground.Visible = false

    shadowHolder.Name = "shadowHolder"
    shadowHolder.Parent = ScreenGui
    shadowHolder.BackgroundTransparency = 1.000
    shadowHolder.Position = UDim2.new(0.19782871, 0, 0.201195225, 0)
    shadowHolder.Size = UDim2.new(0, 470, 0, 270)
    shadowHolder.ZIndex = 0

    ambientShadow.Name = "ambientShadow"
    ambientShadow.Parent = shadowHolder
    ambientShadow.AnchorPoint = Vector2.new(0.5, 0.5)
    ambientShadow.BackgroundTransparency = 1.000
    ambientShadow.BorderColor3 = Color3.fromRGB(255, 255, 255)
    ambientShadow.Position = UDim2.new(0.5, 0, 0.5, 0)
    ambientShadow.Size = UDim2.new(1, 2, 1, 2)
    ambientShadow.ZIndex = 0
    ambientShadow.Image = "rbxassetid://1316045217"
    ambientShadow.ImageColor3 = Color3.fromRGB(100, 100, 100)
    ambientShadow.ImageTransparency = 0.500
    ambientShadow.ScaleType = Enum.ScaleType.Slice
    ambientShadow.SliceCenter = Rect.new(10, 10, 118, 118)

    Levy.Name = "Levy"
    Levy.Parent = shadowHolder
    Levy.BackgroundColor3 = Color3.fromRGB(27, 27, 27)
    Levy.BorderColor3 = Color3.fromRGB(0, 0, 0)
    Levy.BorderSizePixel = 0
    Levy.ClipsDescendants = true
    Levy.Position = UDim2.new(0.0106382975, 0, 0.0212765951, 0)
    Levy.Size = UDim2.new(0, 460, 0, 260)

    TopBarBackground.Name = "TopBarBackground"
    TopBarBackground.Parent = Levy
    TopBarBackground.BackgroundColor3 = Color3.fromRGB(34, 34, 34)
    TopBarBackground.BorderColor3 = Color3.fromRGB(0, 0, 0)
    TopBarBackground.BorderSizePixel = 0
    TopBarBackground.Size = UDim2.new(0, 460, 0, 25)

    TopBarMain.Name = "TopBarMain"
    TopBarMain.Parent = TopBarBackground
    TopBarMain.BackgroundColor3 = Color3.fromRGB(34, 34, 34)
    TopBarMain.BorderColor3 = Color3.fromRGB(0, 0, 0)
    TopBarMain.BorderSizePixel = 0
    TopBarMain.Position = UDim2.new(0.0219999999, 0, 0, 0)
    TopBarMain.Size = UDim2.new(0, 450, 0, 25)
    Hidrous:DraggingEnabled(TopBarBackground, shadowHolder)

    TitleMain.Name = "TitleMain"
    TitleMain.Parent = TopBarMain
    TitleMain.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    TitleMain.BackgroundTransparency = 1.000
    TitleMain.BorderColor3 = Color3.fromRGB(0, 0, 0)
    TitleMain.BorderSizePixel = 0
    TitleMain.Size = UDim2.new(0, 43, 0, 25)
    TitleMain.FontFace = Font.new("rbxasset://fonts/families/Montserrat.json", Enum.FontWeight.SemiBold)
    TitleMain.Text = con.Name
    TitleMain.TextColor3 = Color3.fromRGB(255, 255, 255)
    TitleMain.TextSize = 14.000

    TopBarListLayout.Name = "TopBarListLayout"
    TopBarListLayout.Parent = TopBarMain
    TopBarListLayout.FillDirection = Enum.FillDirection.Horizontal
    TopBarListLayout.SortOrder = Enum.SortOrder.LayoutOrder
    TopBarListLayout.VerticalAlignment = Enum.VerticalAlignment.Center
    TopBarListLayout.Padding = UDim.new(0, 3)

    TitleSecond.Name = "TitleSecond"
    TitleSecond.Parent = TopBarMain
    TitleSecond.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    TitleSecond.BorderColor3 = Color3.fromRGB(0, 0, 0)
    TitleSecond.BorderSizePixel = 0
    TitleSecond.Position = UDim2.new(0.186666667, 0, 0.200000003, 0)
    TitleSecond.Size = UDim2.new(0, 58, 0, 15)
    TitleSecond.FontFace = Font.new("rbxasset://fonts/families/BuilderSans.json", Enum.FontWeight.SemiBold)
    TitleSecond.Text = con.SecondName
    TitleSecond.TextColor3 = Color3.fromRGB(0, 0, 0)
    TitleSecond.TextSize = 13.000

    TitleSecondCorner.CornerRadius = UDim.new(0, 3)
    TitleSecondCorner.Name = "TitleSecondCorner"
    TitleSecondCorner.Parent = TitleSecond

    TitleGradient.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, Color3.fromRGB(226, 247, 255)), ColorSequenceKeypoint.new(0.50, Color3.fromRGB(255, 255, 255)), ColorSequenceKeypoint.new(1.00, Color3.fromRGB(226, 247, 255))}
    TitleGradient.Name = "TitleGradient"
    TitleGradient.Parent = TitleSecond

    TopBarBackButton.Name = "TopBarBackButton"
    TopBarBackButton.Parent = TopBarBackground
    TopBarBackButton.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    TopBarBackButton.BackgroundTransparency = 1.000
    TopBarBackButton.BorderColor3 = Color3.fromRGB(0, 0, 0)
    TopBarBackButton.BorderSizePixel = 0
    TopBarBackButton.Position = UDim2.new(0.0219999999, 0, 0, 0)
    TopBarBackButton.Size = UDim2.new(0, 25, 0, 25)
    TopBarBackButton.Image = "rbxassetid://7804268020"
    TopBarBackButton.ImageTransparency = 1.000

    Dashboard.Name = "Dashboard"
    Dashboard.Parent = Levy
    Dashboard.Active = true
    Dashboard.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    Dashboard.BackgroundTransparency = 1.000
    Dashboard.BorderColor3 = Color3.fromRGB(0, 0, 0)
    Dashboard.BorderSizePixel = 0
    Dashboard.Position = UDim2.new(0.0149999997, 0, 0.125, 0)
    Dashboard.Size = UDim2.new(0, 452, 0, 195)
    Dashboard.BottomImage = "rbxasset://textures/ui/Scroll/scroll-middle.png"
    Dashboard.BottomImage = "rbxasset://textures/ui/Scroll/scroll-middle.png"
    Dashboard.ScrollBarImageColor3 = Color3.fromRGB(0, 0, 0)
    Dashboard.TopImage = "rbxasset://textures/ui/Scroll/scroll-middle.png"
    Dashboard.ScrollBarThickness = 2
    Dashboard.TopImage = "rbxasset://textures/ui/Scroll/scroll-middle.png"

    TabsContainer.Name = "TabsContainer"
    TabsContainer.Parent = Levy
    TabsContainer.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    TabsContainer.BackgroundTransparency = 1.000
    TabsContainer.BorderColor3 = Color3.fromRGB(0, 0, 0)
    TabsContainer.BorderSizePixel = 0
    TabsContainer.Position = UDim2.new(1, 0, 0.125, 0)
    TabsContainer.Size = UDim2.new(0, 452, 0, 225)

    UIListLayout.Parent = Dashboard
    UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
    UIListLayout.Padding = UDim.new(0, 4)

    umbraShadow.Name = "umbraShadow"
    umbraShadow.Parent = shadowHolder
    umbraShadow.AnchorPoint = Vector2.new(0.5, 0.5)
    umbraShadow.BackgroundTransparency = 1.000
    umbraShadow.BorderColor3 = Color3.fromRGB(255, 255, 255)
    umbraShadow.Position = UDim2.new(0.5, 0, 0.5, 0)
    umbraShadow.Size = UDim2.new(1, 2, 1, 2)
    umbraShadow.ZIndex = 0
    umbraShadow.Image = "rbxassetid://1316045217"
    umbraShadow.ImageColor3 = Color3.fromRGB(100, 100, 100)
    umbraShadow.ImageTransparency = 0.500
    umbraShadow.ScaleType = Enum.ScaleType.Slice
    umbraShadow.SliceCenter = Rect.new(10, 10, 118, 118)

    penumbraShadow.Name = "penumbraShadow"
    penumbraShadow.Parent = shadowHolder
    penumbraShadow.AnchorPoint = Vector2.new(0.5, 0.5)
    penumbraShadow.BackgroundTransparency = 1.000
    penumbraShadow.BorderColor3 = Color3.fromRGB(255, 255, 255)
    penumbraShadow.Position = UDim2.new(0.5, 0, 0.5, 0)
    penumbraShadow.Size = UDim2.new(1, 2, 1, 2)
    penumbraShadow.ZIndex = 0
    penumbraShadow.Image = "rbxassetid://1316045217"
    penumbraShadow.ImageColor3 = Color3.fromRGB(100, 100, 100)
    penumbraShadow.ImageTransparency = 0.500
    penumbraShadow.ScaleType = Enum.ScaleType.Slice
    penumbraShadow.SliceCenter = Rect.new(10, 10, 118, 118)

    if con.BottomBarEnabled == true and table.maxn(con.BottomBarTable) >= 1 then
        BottomBarBackground.Name = "BottomBarBackground"
        BottomBarBackground.Parent = Levy
        BottomBarBackground.AnchorPoint = Vector2.new(0.5, 0)
        BottomBarBackground.BackgroundColor3 = Color3.fromRGB(34, 34, 34)
        BottomBarBackground.BorderColor3 = Color3.fromRGB(50, 50, 50)
        BottomBarBackground.Position = UDim2.new(0.497999996, 0, 1, 0)
        BottomBarBackground.Size = UDim2.new(0, 460, 0, 25)
        BottomBarBackground.Visible = true
    
        BottomBarLeft.Name = "BottomBarLeft"
        BottomBarLeft.Parent = BottomBarBackground
        BottomBarLeft.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        BottomBarLeft.BackgroundTransparency = 1.000
        BottomBarLeft.BorderColor3 = Color3.fromRGB(0, 0, 0)
        BottomBarLeft.BorderSizePixel = 0
        BottomBarLeft.ClipsDescendants = true
        BottomBarLeft.Position = UDim2.new(0.0152173908, 0, 0, 0)
        BottomBarLeft.Size = UDim2.new(0, 425, 0, 25)
    
        BottomBarLeftListLayout.Name = "BottomBarLeftListLayout"
        BottomBarLeftListLayout.Parent = BottomBarLeft
        BottomBarLeftListLayout.FillDirection = Enum.FillDirection.Horizontal
        BottomBarLeftListLayout.SortOrder = Enum.SortOrder.LayoutOrder
        BottomBarLeftListLayout.VerticalAlignment = Enum.VerticalAlignment.Center
    
        for i,v in next, con.BottomBarTable do
            BottomBarLeftText.Name = "BottomBarLeftText"
            BottomBarLeftText.Parent = BottomBarLeft
            BottomBarLeftText.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            BottomBarLeftText.BackgroundTransparency = 1.000
            BottomBarLeftText.BorderColor3 = Color3.fromRGB(0, 0, 0)
            BottomBarLeftText.BorderSizePixel = 0
            BottomBarLeftText.Position = UDim2.new(0, 0, 0.200000003, 0)
            BottomBarLeftText.Size = UDim2.new(0, 101, 0, 15)
            BottomBarLeftText.Font = Enum.Font.SourceSans
            BottomBarLeftText.Text = tostring(v)
            BottomBarLeftText.TextColor3 = Color3.fromRGB(255, 255, 255)
            BottomBarLeftText.TextSize = 14.000
            BottomBarLeftText.TextXAlignment = Enum.TextXAlignment.Left
        end
        task.spawn(function()
            task.wait(0.5)
            game:GetService("TweenService"):Create(BottomBarBackground,TweenInfo.new(0.5,Enum.EasingStyle.Quint),{Position = UDim2.fromScale(0.498,0.904)}):Play()
        end)
    end

    if con.Discord.Enabled == true and con.BottomBarEnabled == true then
        local BottomBarDiscordButton = Instance.new("ImageButton")
        local UICorner_3 = Instance.new("UICorner")
        local DiscordHolder = Instance.new("Frame")
        local DIscordHolderInvitation = Instance.new("TextLabel")
        local DiscordHolderPreview = Instance.new("ImageLabel")
        local DiscordHolderPreviewCircle = Instance.new("UICorner")
        local DiscordHolderName = Instance.new("TextLabel")
        local DiscordHolderAccept = Instance.new("TextButton")
        local DiscordHolderAcceptCorner = Instance.new("UICorner")
        local DiscordHolderDecline = Instance.new("TextButton")

        BottomBarDiscordButton.Name = "BottomBarDiscordButton"
        BottomBarDiscordButton.Parent = BottomBarBackground
        BottomBarDiscordButton.BackgroundColor3 = Color3.fromRGB(27, 27, 27)
        BottomBarDiscordButton.BackgroundTransparency = 1.000
        BottomBarDiscordButton.BorderColor3 = Color3.fromRGB(0, 0, 0)
        BottomBarDiscordButton.BorderSizePixel = 0
        BottomBarDiscordButton.Position = UDim2.new(0.949999988, 0, 0.100000001, 0)
        BottomBarDiscordButton.Size = UDim2.new(0, 20, 0, 20)
        BottomBarDiscordButton.Image = "http://www.roblox.com/asset/?id=16188837922"
        BottomBarDiscordButton.ScaleType = Enum.ScaleType.Tile

        UICorner_3.CornerRadius = UDim.new(0, 2)
        UICorner_3.Parent = BottomBarDiscordButton

        DiscordHolder.Name = "DiscordHolder"
        DiscordHolder.Parent = Levy
        DiscordHolder.AnchorPoint = Vector2.new(0.5, 0.5)
        DiscordHolder.BackgroundColor3 = Color3.fromRGB(27, 27, 27)
        DiscordHolder.BorderColor3 = Color3.fromRGB(0, 0, 0)
        DiscordHolder.BorderSizePixel = 0
        DiscordHolder.Position = UDim2.new(0.5, 0, 1.5, 0)
        DiscordHolder.Size = UDim2.new(0, 460, 0, 233)

        DIscordHolderInvitation.Name = "DIscordHolderInvitation"
        DIscordHolderInvitation.Parent = DiscordHolder
        DIscordHolderInvitation.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        DIscordHolderInvitation.BackgroundTransparency = 1.000
        DIscordHolderInvitation.BorderColor3 = Color3.fromRGB(0, 0, 0)
        DIscordHolderInvitation.BorderSizePixel = 0
        DIscordHolderInvitation.Position = UDim2.new(0.282608688, 0, 0.476394862, 0)
        DIscordHolderInvitation.Size = UDim2.new(0, 200, 0, 24)
        DIscordHolderInvitation.Font = Enum.Font.SourceSans
        DIscordHolderInvitation.Text = "You've been invited to join"
        DIscordHolderInvitation.TextColor3 = Color3.fromRGB(200, 200, 200)
        DIscordHolderInvitation.TextSize = 14.000

        DiscordHolderPreview.Name = "DiscordHolderPreview"
        DiscordHolderPreview.Parent = DiscordHolder
        DiscordHolderPreview.AnchorPoint = Vector2.new(0.5, 0.5)
        DiscordHolderPreview.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        DiscordHolderPreview.BorderColor3 = Color3.fromRGB(0, 0, 0)
        DiscordHolderPreview.BorderSizePixel = 0
        DiscordHolderPreview.Position = UDim2.new(0.5, 0, 0.254248947, 0)
        DiscordHolderPreview.Size = UDim2.new(0, 75, 0, 75)
        DiscordHolderPreview.Image = con.Discord.ServerImage
        DiscordHolderPreview.BackgroundTransparency = 1

        DiscordHolderPreviewCircle.CornerRadius = UDim.new(1, 0)
        DiscordHolderPreviewCircle.Name = "DiscordHolderPreviewCircle"
        DiscordHolderPreviewCircle.Parent = DiscordHolderPreview

        DiscordHolderName.Name = "DiscordHolderName"
        DiscordHolderName.Parent = DiscordHolder
        DiscordHolderName.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        DiscordHolderName.BackgroundTransparency = 1.000
        DiscordHolderName.BorderColor3 = Color3.fromRGB(0, 0, 0)
        DiscordHolderName.BorderSizePixel = 0
        DiscordHolderName.Position = UDim2.new(0.282608688, 0, 0.557939887, 0)
        DiscordHolderName.Size = UDim2.new(0, 200, 0, 20)
        DiscordHolderName.FontFace = Font.new("rbxasset://fonts/families/Montserrat.json", Enum.FontWeight.SemiBold)
        DiscordHolderName.Text = con.Discord.ServerName
        DiscordHolderName.TextColor3 = Color3.fromRGB(255, 255, 255)
        DiscordHolderName.TextSize = 16.000

        DiscordHolderAccept.Name = "DiscordHolderAccept"
        DiscordHolderAccept.Parent = DiscordHolder
        DiscordHolderAccept.BackgroundColor3 = Color3.fromRGB(88, 101, 242)
        DiscordHolderAccept.BorderColor3 = Color3.fromRGB(0, 0, 0)
        DiscordHolderAccept.BorderSizePixel = 0
        DiscordHolderAccept.Position = UDim2.new(0.173913047, 0, 0.703862667, 0)
        DiscordHolderAccept.Size = UDim2.new(0, 300, 0, 25)
        DiscordHolderAccept.Font = Enum.Font.SourceSansSemibold
        DiscordHolderAccept.Text = "Accept Invite"
        DiscordHolderAccept.TextColor3 = Color3.fromRGB(255, 255, 255)
        DiscordHolderAccept.TextSize = 14.000

        DiscordHolderAcceptCorner.CornerRadius = UDim.new(0, 3)
        DiscordHolderAcceptCorner.Name = "DiscordHolderAcceptCorner"
        DiscordHolderAcceptCorner.Parent = DiscordHolderAccept

        DiscordHolderDecline.Name = "DiscordHolderDecline"
        DiscordHolderDecline.Parent = DiscordHolder
        DiscordHolderDecline.BackgroundColor3 = Color3.fromRGB(88, 101, 242)
        DiscordHolderDecline.BackgroundTransparency = 1.000
        DiscordHolderDecline.BorderColor3 = Color3.fromRGB(0, 0, 0)
        DiscordHolderDecline.BorderSizePixel = 0
        DiscordHolderDecline.Position = UDim2.new(0.173913047, 0, 0.811158776, 0)
        DiscordHolderDecline.Size = UDim2.new(0, 300, 0, 25)
        DiscordHolderDecline.Font = Enum.Font.SourceSansSemibold
        DiscordHolderDecline.Text = "No Thanks"
        DiscordHolderDecline.TextColor3 = Color3.fromRGB(200, 200, 200)
        DiscordHolderDecline.TextSize = 14.000

        BottomBarDiscordButton.MouseButton1Click:Connect(function()
            game:GetService("TweenService"):Create(DiscordHolder,TweenInfo.new(0.25,Enum.EasingStyle.Quint),{Position = UDim2.fromScale(0.5,0.552)}):Play()
        end)
        
        DiscordHolderAccept.MouseButton1Click:Connect(function()
            game:GetService("TweenService"):Create(DiscordHolder,TweenInfo.new(0.25,Enum.EasingStyle.Quint),{Position = UDim2.fromScale(0.5,1.5)}):Play()
            con.Discord.AcceptCallback()
        end)
        
        DiscordHolderDecline.MouseButton1Click:Connect(function()
            game:GetService("TweenService"):Create(DiscordHolder,TweenInfo.new(0.25,Enum.EasingStyle.Quint),{Position = UDim2.fromScale(0.5,1.5)}):Play()
        end)
    end
	game:GetService("RunService").Heartbeat:Connect(function()
		TitleMain.Size = UDim2.fromOffset(TitleMain.TextBounds.X + 4, 25)
		TitleSecond.Size = UDim2.fromOffset(TitleSecond.TextBounds.X + 11, 15)
	end)

    local HidrousPages = {}

    function HidrousPages.AddPage(con)
        con = con or {}
        con.Name = con.Name or "Page nil"
        con.Description = con.Description or "Page description nil"
        con.Image = con.Image or " "

        local Utilities = Instance.new("Frame")
        local TabsCorner = Instance.new("UICorner")
        local TabsChevron = Instance.new("ImageLabel")
        local TabsImage = Instance.new("ImageLabel")
        local TabsTitle = Instance.new("TextLabel")
        local TabsDescription = Instance.new("TextLabel")
        local TabsTrigger = Instance.new("TextButton")
        local Utilities_2 = Instance.new("ScrollingFrame")
        local TabsContainerScrollList = Instance.new("UIListLayout")

        Utilities.Name = con.Name
        Utilities.Parent = Dashboard
        Utilities.BackgroundColor3 = Color3.fromRGB(34, 34, 34)
        Utilities.BorderColor3 = Color3.fromRGB(0, 0, 0)
        Utilities.BorderSizePixel = 0
        Utilities.Size = UDim2.new(0, 445, 0, 60)

        TabsCorner.CornerRadius = UDim.new(0, 3)
        TabsCorner.Name = "TabsCorner"
        TabsCorner.Parent = Utilities

        TabsChevron.Name = "TabsChevron"
        TabsChevron.Parent = Utilities
        TabsChevron.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        TabsChevron.BackgroundTransparency = 1.000
        TabsChevron.BorderColor3 = Color3.fromRGB(0, 0, 0)
        TabsChevron.BorderSizePixel = 0
        TabsChevron.Position = UDim2.new(0.910112381, 0, 0.25, 0)
        TabsChevron.Size = UDim2.new(0, 30, 0, 30)
        TabsChevron.Image = "rbxassetid://10709791437"

        TabsImage.Name = "TabsImage"
        TabsImage.Parent = Utilities
        TabsImage.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        TabsImage.BackgroundTransparency = 1.000
        TabsImage.BorderColor3 = Color3.fromRGB(0, 0, 0)
        TabsImage.BorderSizePixel = 0
        TabsImage.Position = UDim2.new(0.0450000018, 0, 0.170000002, 0)
        TabsImage.Size = UDim2.new(0, 30, 0, 30)
        TabsImage.Image = con.Image

        TabsTitle.Name = "TabsTitle"
        TabsTitle.Parent = Utilities
        TabsTitle.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        TabsTitle.BackgroundTransparency = 1.000
        TabsTitle.BorderColor3 = Color3.fromRGB(0, 0, 0)
        TabsTitle.BorderSizePixel = 0
        TabsTitle.Position = UDim2.new(0.134831458, 0, 0.166666672, 0)
        TabsTitle.Size = UDim2.new(0, 60, 0, 30)
        TabsTitle.FontFace = Font.new("rbxasset://fonts/families/Montserrat.json", Enum.FontWeight.SemiBold)
        TabsTitle.Text = con.Name
        TabsTitle.TextColor3 = Color3.fromRGB(255, 255, 255)
        TabsTitle.TextSize = 20.000
        TabsTitle.TextXAlignment = Enum.TextXAlignment.Left
        TabsTitle.TextYAlignment = Enum.TextYAlignment.Top

        TabsDescription.Name = "TabsDescription"
        TabsDescription.Parent = Utilities
        TabsDescription.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        TabsDescription.BackgroundTransparency = 1.000
        TabsDescription.BorderColor3 = Color3.fromRGB(0, 0, 0)
        TabsDescription.BorderSizePixel = 0
        TabsDescription.Position = UDim2.new(0.134831458, 0, 0.5, 0)
        TabsDescription.Size = UDim2.new(0, 345, 0, 30)
        TabsDescription.FontFace = Font.new("rbxasset://fonts/families/Montserrat.json", Enum.FontWeight.SemiBold)
        TabsDescription.Text = con.Description
        TabsDescription.TextColor3 = Color3.fromRGB(255, 255, 255)
        TabsDescription.TextSize = 13.000
        TabsDescription.TextWrapped = true
        TabsDescription.TextXAlignment = Enum.TextXAlignment.Left
        TabsDescription.TextYAlignment = Enum.TextYAlignment.Top

        TabsTrigger.Name = "TabsTrigger"
        TabsTrigger.Parent = Utilities
        TabsTrigger.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        TabsTrigger.BackgroundTransparency = 1.000
        TabsTrigger.BorderColor3 = Color3.fromRGB(0, 0, 0)
        TabsTrigger.BorderSizePixel = 0
        TabsTrigger.Position = UDim2.new(6.85788279e-08, 0, 0, 0)
        TabsTrigger.Size = UDim2.new(0, 445, 0, 60)
        TabsTrigger.AutoButtonColor = false
        TabsTrigger.Font = Enum.Font.SourceSans
        TabsTrigger.Text = ""
        TabsTrigger.TextColor3 = Color3.fromRGB(0, 0, 0)
        TabsTrigger.TextSize = 14.000


        Utilities_2.Name = con.Name
        Utilities_2.Parent = TabsContainer
        Utilities_2.Active = true
        Utilities_2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        Utilities_2.BackgroundTransparency = 1.000
        Utilities_2.BorderColor3 = Color3.fromRGB(0, 0, 0)
        Utilities_2.BorderSizePixel = 0
        Utilities_2.Position = UDim2.new(6.75167655e-08, 0, 0, 0)
        Utilities_2.Size = UDim2.new(0, 452, 0, 225)
        Utilities_2.BottomImage = "rbxasset://textures/ui/Scroll/scroll-middle.png"
        Utilities_2.BottomImage = "rbxasset://textures/ui/Scroll/scroll-middle.png"
        Utilities_2.ScrollBarImageColor3 = Color3.fromRGB(0, 0, 0)
        Utilities_2.TopImage = "rbxasset://textures/ui/Scroll/scroll-middle.png"
        Utilities_2.ScrollBarThickness = 2
        Utilities_2.TopImage = "rbxasset://textures/ui/Scroll/scroll-middle.png"

        TabsContainerScrollList.Name = "TabsContainerScrollList"
        TabsContainerScrollList.Parent = Utilities_2
        TabsContainerScrollList.FillDirection = Enum.FillDirection.Horizontal
        TabsContainerScrollList.SortOrder = Enum.SortOrder.LayoutOrder
        TabsContainerScrollList.Padding = UDim.new(0, 3)

        local tabc = TabsContainer
        local tabl = Dashboard
        local topb = TopBarBackground
        local botb = BottomBarBackground
        for i, v in next, tabl:GetChildren() do
            if v.ClassName == "Frame" then
                v.TabsTrigger.MouseButton1Click:connect(function()
                    for i, v2 in next, tabc:GetChildren() do
                        if v2.Name == v.Name then
                            v2.Visible = true
                        else
                            v2.Visible = false
                        end
                    end
                    game:GetService("TweenService"):Create(topb.TopBarMain,TweenInfo.new(0.25,Enum.EasingStyle.Quint),{Position = UDim2.fromScale(0.1,0)}):Play()
                    game:GetService("TweenService"):Create(topb.TopBarBackButton,TweenInfo.new(0.25,Enum.EasingStyle.Quint),{ImageTransparency = 0}):Play()
                    game:GetService("TweenService"):Create(tabl,TweenInfo.new(0.25,Enum.EasingStyle.Quint),{Position = UDim2.fromScale(-1,0.125)}):Play()
                    game:GetService("TweenService"):Create(tabc,TweenInfo.new(0.25,Enum.EasingStyle.Quint),{Position = UDim2.fromScale(0.015,0.125)}):Play()
                    game:GetService("TweenService"):Create(botb,TweenInfo.new(0.25,Enum.EasingStyle.Quint),{Position = UDim2.fromScale(0.498,1)}):Play()
        
                end)
            end
        end
        
        topb.TopBarBackButton.MouseButton1Click:Connect(function()
            if topb.TopBarBackButton.ImageTransparency == 0 then
                game:GetService("TweenService"):Create(topb.TopBarMain,TweenInfo.new(0.25,Enum.EasingStyle.Quint),{Position = UDim2.fromScale(0.022,0)}):Play()
                game:GetService("TweenService"):Create(topb.TopBarBackButton,TweenInfo.new(0.25,Enum.EasingStyle.Quint),{ImageTransparency = 1}):Play()
                game:GetService("TweenService"):Create(tabl,TweenInfo.new(0.25,Enum.EasingStyle.Quint),{Position = UDim2.fromScale(0.015,0.125)}):Play()
                game:GetService("TweenService"):Create(tabc,TweenInfo.new(0.25,Enum.EasingStyle.Quint),{Position = UDim2.fromScale(1,0.125)}):Play()
                game:GetService("TweenService"):Create(botb,TweenInfo.new(0.25,Enum.EasingStyle.Quint),{Position = UDim2.fromScale(0.498,0.904)}):Play()
            end
        end)

        local PageSection = {}

        function PageSection.AddSection()
            local SectionElements = {}

            local Section = Instance.new("Frame")
            local SectionCorner = Instance.new("UICorner")
            local SectionListLayout = Instance.new("UIListLayout")

            Section.Name = "Section"
            Section.Parent = Utilities_2
            Section.BackgroundColor3 = Color3.fromRGB(36, 36, 36)
            Section.BorderColor3 = Color3.fromRGB(0, 0, 0)
            Section.BorderSizePixel = 0
            Section.Position = UDim2.new(0, 0, -0.333333343, 0)
            Section.Size = UDim2.new(0, 220, 0, 280)

            SectionCorner.CornerRadius = UDim.new(0, 3)
            SectionCorner.Name = "SectionCorner"
            SectionCorner.Parent = Section

            SectionListLayout.Name = "SectionListLayout"
            SectionListLayout.Parent = Section
            SectionListLayout.SortOrder = Enum.SortOrder.LayoutOrder
            
            game:GetService("RunService").Heartbeat:Connect(function()
                Section.Size = UDim2.fromOffset(220,SectionListLayout.AbsoluteContentSize.Y + 10)
            end)

            function SectionElements.AddToggle(con)
                con = con or {}
                con.Name = con.Name or "nil toggle"
                con.Default = con.Default or false
                con.Callback = con.Callback or function(a) print(a) end

                local Toggle = Instance.new("Frame")
                local ToggleText = Instance.new("TextLabel")
                local ToggleSwitch = Instance.new("TextButton")
                local ToggleSwitchCorner = Instance.new("UICorner")
                local ToggleSwitchStroke = Instance.new("UIStroke")
                local ToggleSwitchDot = Instance.new("Frame")
                local ToggleSwitchDotCorner = Instance.new("UICorner")
                local TitleGradient_2 = Instance.new("UIGradient")

                Toggle.Name = "Toggle"
                Toggle.Parent = Section
                Toggle.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                Toggle.BackgroundTransparency = 1.000
                Toggle.BorderColor3 = Color3.fromRGB(0, 0, 0)
                Toggle.BorderSizePixel = 0
                Toggle.Size = UDim2.new(0, 220, 0, 25)

                ToggleText.Name = "ToggleText"
                ToggleText.Parent = Toggle
                ToggleText.AnchorPoint = Vector2.new(1, 0)
                ToggleText.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                ToggleText.BackgroundTransparency = 1.000
                ToggleText.BorderColor3 = Color3.fromRGB(0, 0, 0)
                ToggleText.BorderSizePixel = 0
                ToggleText.Position = UDim2.new(0.954545438, 0, 0, 0)
                ToggleText.Size = UDim2.new(0, 200, 0, 25)
                ToggleText.FontFace = Font.new("rbxasset://fonts/families/Montserrat.json", Enum.FontWeight.SemiBold)
                ToggleText.Text = "Toggle1"
                ToggleText.TextColor3 = Color3.fromRGB(255, 255, 255)
                ToggleText.TextSize = 13.000
                ToggleText.TextXAlignment = Enum.TextXAlignment.Left

                ToggleSwitch.Name = "ToggleSwitch"
                ToggleSwitch.Parent = Toggle
                ToggleSwitch.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                ToggleSwitch.BackgroundTransparency = 1.000
                ToggleSwitch.BorderColor3 = Color3.fromRGB(0, 0, 0)
                ToggleSwitch.BorderSizePixel = 0
                ToggleSwitch.Position = UDim2.new(0.790909111, 0, 0.200000003, 0)
                ToggleSwitch.Size = UDim2.new(0, 36, 0, 15)
                ToggleSwitch.AutoButtonColor = false
                ToggleSwitch.Font = Enum.Font.SourceSans
                ToggleSwitch.Text = ""
                ToggleSwitch.TextColor3 = Color3.fromRGB(0, 0, 0)
                ToggleSwitch.TextSize = 14.000

                ToggleSwitchCorner.CornerRadius = UDim.new(0, 99)
                ToggleSwitchCorner.Name = "ToggleSwitchCorner"
                ToggleSwitchCorner.Parent = ToggleSwitch

                ToggleSwitchStroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
                ToggleSwitchStroke.Color = Color3.fromRGB(255, 255, 255)
                ToggleSwitchStroke.Name = "ToggleSwitchStroke"
                ToggleSwitchStroke.Parent = ToggleSwitch

                ToggleSwitchDot.Name = "ToggleSwitchDot"
                ToggleSwitchDot.Parent = ToggleSwitch
                ToggleSwitchDot.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                ToggleSwitchDot.BorderColor3 = Color3.fromRGB(0, 0, 0)
                ToggleSwitchDot.BorderSizePixel = 0
                ToggleSwitchDot.Position = UDim2.new(0.100000001, 0, 0.133000001, 0)
                ToggleSwitchDot.Size = UDim2.new(0, 10, 0, 10)

                ToggleSwitchDotCorner.CornerRadius = UDim.new(0, 99)
                ToggleSwitchDotCorner.Name = "ToggleSwitchDotCorner"
                ToggleSwitchDotCorner.Parent = ToggleSwitchDot

                TitleGradient_2.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, Color3.fromRGB(198, 226, 255)), ColorSequenceKeypoint.new(0.50, Color3.fromRGB(255, 255, 255)), ColorSequenceKeypoint.new(1.00, Color3.fromRGB(198, 226, 255))}
                TitleGradient_2.Name = "TitleGradient"
                TitleGradient_2.Parent = ToggleSwitch

                
                local enabled = false

                if con.Default == true then
                    enabled = true
                    game:GetService("TweenService"):Create(ToggleSwitch, TweenInfo.new(0.25,Enum.EasingStyle.Quint),{BackgroundTransparency = 0}):Play()
                    game:GetService("TweenService"):Create(ToggleSwitchStroke, TweenInfo.new(0.25,Enum.EasingStyle.Quint),{Transparency = 1}):Play()
                    game:GetService("TweenService"):Create(ToggleSwitchDot, TweenInfo.new(0.25,Enum.EasingStyle.Quint),{BackgroundColor3 = Color3.fromRGB(0,0,0)}):Play()
                    game:GetService("TweenService"):Create(ToggleSwitchDot, TweenInfo.new(0.25,Enum.EasingStyle.Quint),{Position = UDim2.fromScale(0.6,0.133)}):Play()
                    con.Callback(true)
                end

                ToggleSwitch.MouseButton1Click:Connect(function()
                    if enabled == false then
                        enabled = true
                        game:GetService("TweenService"):Create(ToggleSwitch, TweenInfo.new(0.25,Enum.EasingStyle.Quint),{BackgroundTransparency = 0}):Play()
                        game:GetService("TweenService"):Create(ToggleSwitchStroke, TweenInfo.new(0.25,Enum.EasingStyle.Quint),{Transparency = 1}):Play()
                        game:GetService("TweenService"):Create(ToggleSwitchDot, TweenInfo.new(0.25,Enum.EasingStyle.Quint),{BackgroundColor3 = Color3.fromRGB(0,0,0)}):Play()
                        game:GetService("TweenService"):Create(ToggleSwitchDot, TweenInfo.new(0.25,Enum.EasingStyle.Quint),{Position = UDim2.fromScale(0.6,0.133)}):Play()
                    else
                        enabled = false
                        game:GetService("TweenService"):Create(ToggleSwitch, TweenInfo.new(0.25,Enum.EasingStyle.Quint),{BackgroundTransparency = 1}):Play()
                        game:GetService("TweenService"):Create(ToggleSwitchStroke, TweenInfo.new(0.25,Enum.EasingStyle.Quint),{Transparency = 0}):Play()
                        game:GetService("TweenService"):Create(ToggleSwitchDot, TweenInfo.new(0.25,Enum.EasingStyle.Quint),{BackgroundColor3 = Color3.fromRGB(255,255,255)}):Play()
                        game:GetService("TweenService"):Create(ToggleSwitchDot, TweenInfo.new(0.25,Enum.EasingStyle.Quint),{Position = UDim2.fromScale(0.1,0.133)}):Play()
                    end
                    con.Callback(enabled)
                end)
            end
            
            function SectionElements.AddButton(con)
                con = con or {}
                con.Name = con.Name or "buttan"
                con.Callback = con.Callback or function() print(nil) end

                local Button = Instance.new("Frame")
                local ButtonMain = Instance.new("TextButton")
                local UICorner = Instance.new("UICorner")
                
                Button.Name = "Button"
                Button.Parent = Section
                Button.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                Button.BackgroundTransparency = 1.000
                Button.BorderColor3 = Color3.fromRGB(0, 0, 0)
                Button.BorderSizePixel = 0
                Button.Size = UDim2.new(0, 220, 0, 25)

                ButtonMain.Name = "ButtonMain"
                ButtonMain.Parent = Button
                ButtonMain.BackgroundColor3 = Color3.fromRGB(27, 27, 27)
                ButtonMain.BorderColor3 = Color3.fromRGB(0, 0, 0)
                ButtonMain.BorderSizePixel = 0
                ButtonMain.Position = UDim2.new(0.0227272734, 0, 0.0799999982, 0)
                ButtonMain.Size = UDim2.new(0, 210, 0, 20)
                ButtonMain.AutoButtonColor = false
                ButtonMain.FontFace = Font.new("rbxasset://fonts/families/Montserrat.json", Enum.FontWeight.SemiBold)
                ButtonMain.Text = con.Name
                ButtonMain.TextColor3 = Color3.fromRGB(255, 255, 255)
                ButtonMain.TextSize = 12.000

                UICorner.CornerRadius = UDim.new(0, 3)
                UICorner.Parent = ButtonMain

                ButtonMain.MouseButton1Click:Connect(function()
                    game:GetService("TweenService"):Create(ButtonMain,TweenInfo.new(0.25,Enum.EasingStyle.Quint),{BackgroundColor3 = Color3.fromRGB(200,200,200)}):Play()
                    task.wait(0.1)
                    game:GetService("TweenService"):Create(ButtonMain,TweenInfo.new(0.25,Enum.EasingStyle.Quint),{BackgroundColor3 = Color3.fromRGB(27,27,27)}):Play()
                    con.Callback()
                end)

            end

            function SectionElements.AddSlider(con)
                con = con or {}
                con.Name = con.Name or "haha slidor"
                con.Min = con.Min or 0
                con.Max = con.Max or 10
                con.Default = con.Default or 5
                con.Precise = con.Precise or true
                con.Callback = con.Callback or function(a) print(a) end

                local Slider = Instance.new("Frame")
                local SliderText = Instance.new("TextLabel")
                local SliderValue = Instance.new("TextBox")
                local UICorner_2 = Instance.new("UICorner")
                local SliderTrigger = Instance.new("TextButton")
                local SliderGroup = Instance.new("Frame")
                local SliderGroupFill = Instance.new("Frame")
                local SliderGroupFillCorner = Instance.new("UIGradient")
                local SliderGroupCorner = Instance.new("UICorner")
            
                Slider.Name = "Slider"
                Slider.Parent = Section
                Slider.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                Slider.BackgroundTransparency = 1.000
                Slider.BorderColor3 = Color3.fromRGB(0, 0, 0)
                Slider.BorderSizePixel = 0
                Slider.Position = UDim2.new(0, 0, 0.5, 0)
                Slider.Size = UDim2.new(0, 220, 0, 45)
                
                SliderText.Name = "SliderText"
                SliderText.Parent = Slider
                SliderText.AnchorPoint = Vector2.new(1, 0)
                SliderText.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                SliderText.BackgroundTransparency = 1.000
                SliderText.BorderColor3 = Color3.fromRGB(0, 0, 0)
                SliderText.BorderSizePixel = 0
                SliderText.Position = UDim2.new(0.75272733, 0, 0, 0)
                SliderText.Size = UDim2.new(0, 155, 0, 25)
                SliderText.FontFace = Font.new("rbxasset://fonts/families/Montserrat.json", Enum.FontWeight.SemiBold)
                SliderText.Text = con.Name
                SliderText.TextColor3 = Color3.fromRGB(255, 255, 255)
                SliderText.TextSize = 13.000
                SliderText.TextXAlignment = Enum.TextXAlignment.Left
                
                SliderValue.Name = "SliderValue"
                SliderValue.Parent = Slider
                SliderValue.BackgroundColor3 = Color3.fromRGB(27, 27, 27)
                SliderValue.BorderColor3 = Color3.fromRGB(0, 0, 0)
                SliderValue.BorderSizePixel = 0
                SliderValue.Position = UDim2.new(0.793636382, 0, 0.111111112, 0)
                SliderValue.Size = UDim2.new(0, 35, 0, 15)
                SliderValue.FontFace = Font.new("rbxasset://fonts/families/Montserrat.json", Enum.FontWeight.SemiBold)
                SliderValue.Text = "5"
                SliderValue.TextColor3 = Color3.fromRGB(255, 255, 255)
                SliderValue.TextSize = 12.000
                
                UICorner_2.CornerRadius = UDim.new(0, 3)
                UICorner_2.Parent = SliderValue
                
                SliderTrigger.Name = "SliderTrigger"
                SliderTrigger.Parent = Slider
                SliderTrigger.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                SliderTrigger.BackgroundTransparency = 1.000
                SliderTrigger.BorderColor3 = Color3.fromRGB(0, 0, 0)
                SliderTrigger.BorderSizePixel = 0
                SliderTrigger.Position = UDim2.new(0.064000003, 0, 0.68900001, 0)
                SliderTrigger.Size = UDim2.new(0, 190, 0, 7)
                SliderTrigger.Font = Enum.Font.SourceSans
                SliderTrigger.Text = ""
                SliderTrigger.TextColor3 = Color3.fromRGB(0, 0, 0)
                SliderTrigger.TextSize = 14.000
                
                SliderGroup.Name = "SliderGroup"
                SliderGroup.Parent = Slider
                SliderGroup.BackgroundColor3 = Color3.fromRGB(27, 27, 27)
                SliderGroup.BorderColor3 = Color3.fromRGB(0, 0, 0)
                SliderGroup.BorderSizePixel = 0
                SliderGroup.ClipsDescendants = true
                SliderGroup.Position = UDim2.new(0.064000003, 0, 0.68900001, 0)
                SliderGroup.Size = UDim2.new(0, 190, 0, 7)
                
                SliderGroupFill.Name = "SliderGroupFill"
                SliderGroupFill.Parent = SliderGroup
                SliderGroupFill.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                SliderGroupFill.BorderColor3 = Color3.fromRGB(0, 0, 0)
                SliderGroupFill.BorderSizePixel = 0
                SliderGroupFill.Size = UDim2.new(0, 100, 0, 7)
                
                SliderGroupFillCorner.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, Color3.fromRGB(198, 226, 255)), ColorSequenceKeypoint.new(0.50, Color3.fromRGB(255, 255, 255)), ColorSequenceKeypoint.new(1.00, Color3.fromRGB(198, 226, 255))}
                SliderGroupFillCorner.Name = "SliderGroupFillCorner"
                SliderGroupFillCorner.Parent = SliderGroupFill
                
                SliderGroupCorner.CornerRadius = UDim.new(0, 2)
                SliderGroupCorner.Name = "SliderGroupCorner"
                SliderGroupCorner.Parent = SliderGroup

                -- too lazy to clean it
                local mouse = game:GetService("Players").LocalPlayer:GetMouse()
                local uis = game:GetService("UserInputService")
                local Min_Value = con.Min
                local Max_Value = con.Max
                local Precise = con.Precise
                local Bar = SliderGroupFill
                local Sliderbox = SliderValue
                local Trigger = SliderTrigger
                local SizeChia = 190
                local DefaultValue = con.Default
                local isSliding = false
                
                if DefaultValue then 
                    if DefaultValue <= Min_Value then DefaultValue = Min_Value elseif DefaultValue >= Max_Value then DefaultValue = Max_Value end
                    Bar.Size = UDim2.new(1 - ((Max_Value - DefaultValue) / (Max_Value - Min_Value)),0, 0, 7)
                    Sliderbox.Text = DefaultValue
                    con.Callback(DefaultValue)
                end
                
                Trigger.MouseButton1Down:Connect(function()
                    isSliding = true
                    local value = Precise and  tonumber(string.format("%.2f",(((tonumber(Max_Value) - tonumber(Min_Value)) / SizeChia) * Bar.AbsoluteSize.X) + tonumber(Min_Value))) or math.floor((((tonumber(Max_Value) - tonumber(Min_Value)) / SizeChia) * Bar.AbsoluteSize.X) + tonumber(Min_Value))
                
                    pcall(function()
                        con.Callback(value)
                        Sliderbox.Text = value
                    end)
                    Bar.Size = UDim2.new(0, math.clamp(mouse.X - Bar.AbsolutePosition.X, 0, SizeChia), 0, 7)
                    moveconnection = mouse.Move:Connect(function()   
                        local value = Precise and  tonumber(string.format("%.2f",(((tonumber(Max_Value) - tonumber(Min_Value)) / SizeChia) * Bar.AbsoluteSize.X) + tonumber(Min_Value))) or math.floor((((tonumber(Max_Value) - tonumber(Min_Value)) / SizeChia) * Bar.AbsoluteSize.X) + tonumber(Min_Value))
                        pcall(function()
                            con.Callback(value)
                            Sliderbox.Text = value
                        end)
                        Bar.Size = UDim2.new(0, math.clamp(mouse.X - Bar.AbsolutePosition.X, 0, SizeChia), 0, 7)
                    end)
                    releaseconnection = uis.InputEnded:Connect(function(Mouse)
                        if Mouse.UserInputType == Enum.UserInputType.MouseButton1 or Mouse.UserInputType == Enum.UserInputType.Touch then
                            local value = Precise and  tonumber(string.format("%.2f",(((tonumber(Max_Value) - tonumber(Min_Value)) / SizeChia) * Bar.AbsoluteSize.X) + tonumber(Min_Value))) or math.floor((((tonumber(Max_Value) - tonumber(Min_Value)) / SizeChia) * Bar.AbsoluteSize.X) + tonumber(Min_Value))
                
                            pcall(function()
                                con.Callback(value)
                                Sliderbox.Text = value
                            end)
                            Bar.Size = UDim2.new(0, math.clamp(mouse.X - Bar.AbsolutePosition.X, 0, SizeChia), 0, 7)
                        end
                    end)
                    uis.InputEnded:Connect(function(Mouse)
                        if Mouse.UserInputType == Enum.UserInputType.MouseButton1 or Mouse.UserInputType == Enum.UserInputType.Touch then
                            moveconnection:Disconnect()
                            releaseconnection:Disconnect()
                            isSliding = false
                        end
                    end)
                end)
                
                Sliderbox:GetPropertyChangedSignal("Text"):Connect(function()
                    local value = tonumber(Sliderbox.Text)
                    if value and isSliding == false then
                        if value <= Min_Value then value = Min_Value elseif value >= Max_Value then value = Max_Value end
                        Bar.Size = UDim2.new(1 - ((Max_Value - value) / (Max_Value - Min_Value)),0, 0, 7)
                        --game:GetService("TweenService"):Create(Bar, TweenInfo.new(0.25, Enum.EasingStyle.Quint), {Size = Size}):Play()
                        Sliderbox.Text = value
                        con.Callback(value)
                    end
                end)
            end

            function SectionElements.AddCheckbox(con)
                con = con or {}
                con.Name = con.Name or "chackbox"
                con.Default = con.Default or false
                con.Callback = con.Callback or function(a) print(a) end

                local Checkbox = Instance.new("Frame")
                local CheckboxText = Instance.new("TextLabel")
                local CheckboxSwitch = Instance.new("TextButton")
                local CheckboxSwitchCorner = Instance.new("UICorner")
                local CheckboxSwitchStroke = Instance.new("UIStroke")
                local CheckboxSwitchGradient = Instance.new("UIGradient")
                local CheckboxSwitchImage = Instance.new("ImageLabel")

                Checkbox.Name = "Checkbox"
                Checkbox.Parent = Section
                Checkbox.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                Checkbox.BackgroundTransparency = 1.000
                Checkbox.BorderColor3 = Color3.fromRGB(0, 0, 0)
                Checkbox.BorderSizePixel = 0
                Checkbox.Size = UDim2.new(0, 220, 0, 25)

                CheckboxText.Name = "CheckboxText"
                CheckboxText.Parent = Checkbox
                CheckboxText.AnchorPoint = Vector2.new(1, 0)
                CheckboxText.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                CheckboxText.BackgroundTransparency = 1.000
                CheckboxText.BorderColor3 = Color3.fromRGB(0, 0, 0)
                CheckboxText.BorderSizePixel = 0
                CheckboxText.Position = UDim2.new(0.793636322, 0, 0, 0)
                CheckboxText.Size = UDim2.new(0, 163, 0, 25)
                CheckboxText.FontFace = Font.new("rbxasset://fonts/families/Montserrat.json", Enum.FontWeight.SemiBold)
                CheckboxText.Text = "Toggle1"
                CheckboxText.TextColor3 = Color3.fromRGB(255, 255, 255)
                CheckboxText.TextSize = 13.000
                CheckboxText.TextWrapped = true
                CheckboxText.TextXAlignment = Enum.TextXAlignment.Left

                CheckboxSwitch.Name = "CheckboxSwitch"
                CheckboxSwitch.Parent = Checkbox
                CheckboxSwitch.BackgroundColor3 = Color3.fromRGB(27, 27, 27)
                CheckboxSwitch.BorderColor3 = Color3.fromRGB(0, 0, 0)
                CheckboxSwitch.BorderSizePixel = 0
                CheckboxSwitch.Position = UDim2.new(0.863636374, 0, 0.0799999982, 0)
                CheckboxSwitch.Size = UDim2.new(0, 20, 0, 20)
                CheckboxSwitch.AutoButtonColor = false
                CheckboxSwitch.Font = Enum.Font.SourceSans
                CheckboxSwitch.Text = ""
                CheckboxSwitch.TextColor3 = Color3.fromRGB(0, 0, 0)
                CheckboxSwitch.TextSize = 14.000

                CheckboxSwitchCorner.CornerRadius = UDim.new(0, 3)
                CheckboxSwitchCorner.Name = "CheckboxSwitchCorner"
                CheckboxSwitchCorner.Parent = CheckboxSwitch

                CheckboxSwitchStroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
                CheckboxSwitchStroke.Color = Color3.fromRGB(100, 100, 100)
                CheckboxSwitchStroke.Thickness = 0.6000000238418579
                CheckboxSwitchStroke.Name = "CheckboxSwitchStroke"
                CheckboxSwitchStroke.Parent = CheckboxSwitch

                CheckboxSwitchGradient.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, Color3.fromRGB(198, 226, 255)), ColorSequenceKeypoint.new(0.50, Color3.fromRGB(255, 255, 255)), ColorSequenceKeypoint.new(1.00, Color3.fromRGB(198, 226, 255))}
                CheckboxSwitchGradient.Name = "CheckboxSwitchGradient"
                CheckboxSwitchGradient.Parent = CheckboxSwitch

                CheckboxSwitchImage.Name = "CheckboxSwitchImage"
                CheckboxSwitchImage.Parent = CheckboxSwitch
                CheckboxSwitchImage.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                CheckboxSwitchImage.BackgroundTransparency = 1.000
                CheckboxSwitchImage.BorderColor3 = Color3.fromRGB(0, 0, 0)
                CheckboxSwitchImage.BorderSizePixel = 0
                CheckboxSwitchImage.Size = UDim2.new(0, 20, 0, 20)
                CheckboxSwitchImage.Image = "rbxassetid://138861967300749"
                CheckboxSwitchImage.ImageColor3 = Color3.fromRGB(0, 0, 0)
                CheckboxSwitchImage.ImageTransparency = 1.000

                local toggleswitch = CheckboxSwitch
	
                local enabled = false

                if con.Default == true then
                    enabled = true
                    game:GetService("TweenService"):Create(toggleswitch, TweenInfo.new(0.25,Enum.EasingStyle.Quint),{BackgroundColor3 = Color3.fromRGB(255,255,255)}):Play()
                    game:GetService("TweenService"):Create(CheckboxSwitchStroke, TweenInfo.new(0.25,Enum.EasingStyle.Quint),{Transparency = 1}):Play()
                    game:GetService("TweenService"):Create(CheckboxSwitchImage, TweenInfo.new(0.25,Enum.EasingStyle.Quint),{ImageTransparency = 0}):Play()
                    con.Callback(true)
                end

                toggleswitch.MouseButton1Click:Connect(function()
                    if enabled == false then
                        enabled = true
                        game:GetService("TweenService"):Create(toggleswitch, TweenInfo.new(0.25,Enum.EasingStyle.Quint),{BackgroundColor3 = Color3.fromRGB(255,255,255)}):Play()
                        game:GetService("TweenService"):Create(CheckboxSwitchStroke, TweenInfo.new(0.25,Enum.EasingStyle.Quint),{Transparency = 1}):Play()
                        game:GetService("TweenService"):Create(CheckboxSwitchImage, TweenInfo.new(0.25,Enum.EasingStyle.Quint),{ImageTransparency = 0}):Play()
                    else
                        enabled = false
                        game:GetService("TweenService"):Create(toggleswitch, TweenInfo.new(0.25,Enum.EasingStyle.Quint),{BackgroundColor3 = Color3.fromRGB(27,27,27)}):Play()
                        game:GetService("TweenService"):Create(CheckboxSwitchStroke, TweenInfo.new(0.25,Enum.EasingStyle.Quint),{Transparency = 0}):Play()
                        game:GetService("TweenService"):Create(CheckboxSwitchImage, TweenInfo.new(0.25,Enum.EasingStyle.Quint),{ImageTransparency = 1}):Play()
                    end
                    con.Callback(enabled)
                end)
            end

            function SectionElements.AddSelector(con)
                con = con or {}
                con.Name = con.Name or "textbruh"
                con.Default = con.Default or "nil"
                con.ListTable = con.ListTable or {"nil1","nil2"}
                con.Callback = con.Callback or function(a) print(a) end

                local Selector = Instance.new("Frame")
                local SelectorText = Instance.new("TextLabel")
                local SelectorLeft = Instance.new("ImageButton")
                local SelectedRightCorner = Instance.new("UICorner")
                local SelecterRight = Instance.new("ImageButton")
                local SelecterRightCorner = Instance.new("UICorner")
                local SelectorSelectedText = Instance.new("TextLabel")
                
                Selector.Name = "Selector"
                Selector.Parent = Section
                Selector.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                Selector.BackgroundTransparency = 1.000
                Selector.BorderColor3 = Color3.fromRGB(0, 0, 0)
                Selector.BorderSizePixel = 0
                Selector.Position = UDim2.new(0, 0, 0.600000024, 0)
                Selector.Size = UDim2.new(0, 220, 0, 50)

                SelectorText.Name = "SelectorText"
                SelectorText.Parent = Selector
                SelectorText.AnchorPoint = Vector2.new(1, 0)
                SelectorText.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                SelectorText.BackgroundTransparency = 1.000
                SelectorText.BorderColor3 = Color3.fromRGB(0, 0, 0)
                SelectorText.BorderSizePixel = 0
                SelectorText.Position = UDim2.new(0.957272768, 0, 0, 0)
                SelectorText.Size = UDim2.new(0, 200, 0, 25)
                SelectorText.FontFace = Font.new("rbxasset://fonts/families/Montserrat.json", Enum.FontWeight.SemiBold)
                SelectorText.Text = "Select Method"
                SelectorText.TextColor3 = Color3.fromRGB(255, 255, 255)
                SelectorText.TextSize = 13.000
                SelectorText.TextWrapped = true
                SelectorText.TextXAlignment = Enum.TextXAlignment.Left

                SelectorLeft.Name = "SelectorLeft"
                SelectorLeft.Parent = Selector
                SelectorLeft.BackgroundColor3 = Color3.fromRGB(27, 27, 27)
                SelectorLeft.BorderColor3 = Color3.fromRGB(0, 0, 0)
                SelectorLeft.BorderSizePixel = 0
                SelectorLeft.Position = UDim2.new(0.0454545468, 0, 0.5, 0)
                SelectorLeft.Size = UDim2.new(0, 20, 0, 20)
                SelectorLeft.AutoButtonColor = false
                SelectorLeft.Image = "rbxassetid://10709791281"

                SelectedRightCorner.CornerRadius = UDim.new(0, 4)
                SelectedRightCorner.Name = "SelectedRightCorner"
                SelectedRightCorner.Parent = SelectorLeft

                SelecterRight.Name = "SelecterRight"
                SelecterRight.Parent = Selector
                SelecterRight.BackgroundColor3 = Color3.fromRGB(27, 27, 27)
                SelecterRight.BorderColor3 = Color3.fromRGB(0, 0, 0)
                SelecterRight.BorderSizePixel = 0
                SelecterRight.Position = UDim2.new(0.863636374, 0, 0.5, 0)
                SelecterRight.Size = UDim2.new(0, 20, 0, 20)
                SelecterRight.AutoButtonColor = false
                SelecterRight.Image = "rbxassetid://10709791437"

                SelecterRightCorner.CornerRadius = UDim.new(0, 4)
                SelecterRightCorner.Name = "SelecterRightCorner"
                SelecterRightCorner.Parent = SelecterRight

                SelectorSelectedText.Name = "SelectorSelectedText"
                SelectorSelectedText.Parent = Selector
                SelectorSelectedText.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                SelectorSelectedText.BackgroundTransparency = 1.000
                SelectorSelectedText.BorderColor3 = Color3.fromRGB(0, 0, 0)
                SelectorSelectedText.BorderSizePixel = 0
                SelectorSelectedText.Position = UDim2.new(0.13636364, 0, 0.5, 0)
                SelectorSelectedText.Size = UDim2.new(0, 160, 0, 20)
                SelectorSelectedText.FontFace = Font.new("rbxasset://fonts/families/Montserrat.json", Enum.FontWeight.SemiBold)
                SelectorSelectedText.TextColor3 = Color3.fromRGB(255, 255, 255)
                SelectorSelectedText.TextSize = 12.000

                Selector.Name = "Selector"
                Selector.Parent = Section
                Selector.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                Selector.BackgroundTransparency = 1.000
                Selector.BorderColor3 = Color3.fromRGB(0, 0, 0)
                Selector.BorderSizePixel = 0
                Selector.Position = UDim2.new(0, 0, 0.600000024, 0)
                Selector.Size = UDim2.new(0, 220, 0, 50)

                SelectorText.Name = "SelectorText"
                SelectorText.Parent = Selector
                SelectorText.AnchorPoint = Vector2.new(1, 0)
                SelectorText.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                SelectorText.BackgroundTransparency = 1.000
                SelectorText.BorderColor3 = Color3.fromRGB(0, 0, 0)
                SelectorText.BorderSizePixel = 0
                SelectorText.Position = UDim2.new(0.957272768, 0, 0, 0)
                SelectorText.Size = UDim2.new(0, 200, 0, 25)
                SelectorText.FontFace = Font.new("rbxasset://fonts/families/Montserrat.json", Enum.FontWeight.SemiBold)
                SelectorText.Text = con.Name
                SelectorText.TextColor3 = Color3.fromRGB(255, 255, 255)
                SelectorText.TextSize = 13.000
                SelectorText.TextWrapped = true
                SelectorText.TextXAlignment = Enum.TextXAlignment.Left

                SelectorLeft.Name = "SelectorLeft"
                SelectorLeft.Parent = Selector
                SelectorLeft.BackgroundColor3 = Color3.fromRGB(27, 27, 27)
                SelectorLeft.BorderColor3 = Color3.fromRGB(0, 0, 0)
                SelectorLeft.BorderSizePixel = 0
                SelectorLeft.Position = UDim2.new(0.0454545468, 0, 0.5, 0)
                SelectorLeft.Size = UDim2.new(0, 20, 0, 20)
                SelectorLeft.AutoButtonColor = false
                SelectorLeft.Image = "rbxassetid://10709791281"

                SelectedRightCorner.CornerRadius = UDim.new(0, 4)
                SelectedRightCorner.Name = "SelectedRightCorner"
                SelectedRightCorner.Parent = SelectorLeft

                SelecterRight.Name = "SelecterRight"
                SelecterRight.Parent = Selector
                SelecterRight.BackgroundColor3 = Color3.fromRGB(27, 27, 27)
                SelecterRight.BorderColor3 = Color3.fromRGB(0, 0, 0)
                SelecterRight.BorderSizePixel = 0
                SelecterRight.Position = UDim2.new(0.863636374, 0, 0.5, 0)
                SelecterRight.Size = UDim2.new(0, 20, 0, 20)
                SelecterRight.AutoButtonColor = false
                SelecterRight.Image = "rbxassetid://10709791437"

                SelecterRightCorner.CornerRadius = UDim.new(0, 4)
                SelecterRightCorner.Name = "SelecterRightCorner"
                SelecterRightCorner.Parent = SelecterRight

                SelectorSelectedText.Name = "SelectorSelectedText"
                SelectorSelectedText.Parent = Selector
                SelectorSelectedText.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                SelectorSelectedText.BackgroundTransparency = 1.000
                SelectorSelectedText.BorderColor3 = Color3.fromRGB(0, 0, 0)
                SelectorSelectedText.BorderSizePixel = 0
                SelectorSelectedText.Position = UDim2.new(0.13636364, 0, 0.5, 0)
                SelectorSelectedText.Size = UDim2.new(0, 160, 0, 20)
                SelectorSelectedText.FontFace = Font.new("rbxasset://fonts/families/Montserrat.json", Enum.FontWeight.SemiBold)
                SelectorSelectedText.TextColor3 = Color3.fromRGB(255, 255, 255)
                SelectorSelectedText.TextSize = 12.000
                SelectorSelectedText.Text = con.Default

                local sexyTable = con.ListTable
                local currentSelectedIndex = 1
                
                SelectorSelectedText.Text = sexyTable[currentSelectedIndex]
                SelectorLeft.MouseButton1Click:Connect(function()
                    if currentSelectedIndex ~= 1 then
                        currentSelectedIndex = currentSelectedIndex - 1
                        SelectorSelectedText.Text = sexyTable[currentSelectedIndex]
                        SelectorSelectedText.TextSize = 1
                        con.Callback(sexyTable[currentSelectedIndex])
                        game:GetService("TweenService"):Create(SelectorSelectedText,TweenInfo.new(0.25,Enum.EasingStyle.Quad),{TextSize = 12}):Play()
                    end
                end)
                SelecterRight.MouseButton1Click:Connect(function()
                    if currentSelectedIndex ~= table.maxn(sexyTable) then
                        currentSelectedIndex = currentSelectedIndex + 1
                        SelectorSelectedText.Text = sexyTable[currentSelectedIndex]
                        SelectorSelectedText.TextSize = 1
                        con.Callback(sexyTable[currentSelectedIndex])
                        game:GetService("TweenService"):Create(SelectorSelectedText,TweenInfo.new(0.25,Enum.EasingStyle.Quad),{TextSize = 12}):Play()
                    end
                end)
            end

            function SectionElements.AddTextbox(con)
                con = con or {}
                con.Name = con.Name or "taxtbox"
                con.DefaultTextbox = con.DefaultTextbox or "nil"
                con.ApplyEveryTyping = con.ApplyWhileTyping or true
                con.Callback = con.Callback or function(a) print(a) end

                local Textbox = Instance.new("Frame")
                local SelectorText_2 = Instance.new("TextLabel")
                local TextboxMain = Instance.new("Frame")
                local TextboxMainCorner = Instance.new("UICorner")
                local TextboxMainLine = Instance.new("Frame")
                local TextboxMainIndicator = Instance.new("Frame")
                local TextBoxMainHolder = Instance.new("TextBox")

                Textbox.Name = "Textbox"
                Textbox.Parent = Section
                Textbox.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                Textbox.BackgroundTransparency = 1.000
                Textbox.BorderColor3 = Color3.fromRGB(0, 0, 0)
                Textbox.BorderSizePixel = 0
                Textbox.Position = UDim2.new(0, 0, 0.600000024, 0)
                Textbox.Size = UDim2.new(0, 220, 0, 50)

                SelectorText_2.Name = "SelectorText"
                SelectorText_2.Parent = Textbox
                SelectorText_2.AnchorPoint = Vector2.new(1, 0)
                SelectorText_2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                SelectorText_2.BackgroundTransparency = 1.000
                SelectorText_2.BorderColor3 = Color3.fromRGB(0, 0, 0)
                SelectorText_2.BorderSizePixel = 0
                SelectorText_2.Position = UDim2.new(0.957000017, 0, 0, 0)
                SelectorText_2.Size = UDim2.new(0, 200, 0, 25)
                SelectorText_2.FontFace = Font.new("rbxasset://fonts/families/Montserrat.json", Enum.FontWeight.SemiBold)
                SelectorText_2.Text = con.Name
                SelectorText_2.TextColor3 = Color3.fromRGB(255, 255, 255)
                SelectorText_2.TextSize = 13.000
                SelectorText_2.TextWrapped = true
                SelectorText_2.TextXAlignment = Enum.TextXAlignment.Left

                TextboxMain.Name = "TextboxMain"
                TextboxMain.Parent = Textbox
                TextboxMain.BackgroundColor3 = Color3.fromRGB(27, 27, 27)
                TextboxMain.BorderColor3 = Color3.fromRGB(0, 0, 0)
                TextboxMain.BorderSizePixel = 0
                TextboxMain.Position = UDim2.new(0.0450000018, 0, 0.5, 0)
                TextboxMain.Size = UDim2.new(0, 205, 0, 20)

                TextboxMainCorner.CornerRadius = UDim.new(0, 3)
                TextboxMainCorner.Name = "TextboxMainCorner"
                TextboxMainCorner.Parent = TextboxMain

                TextboxMainLine.Name = "TextboxMainLine"
                TextboxMainLine.Parent = TextboxMain
                TextboxMainLine.BackgroundColor3 = Color3.fromRGB(2, 2, 2)
                TextboxMainLine.BorderColor3 = Color3.fromRGB(0, 0, 0)
                TextboxMainLine.BorderSizePixel = 0
                TextboxMainLine.Position = UDim2.new(0, 0, 1, 0)
                TextboxMainLine.Size = UDim2.new(0, 205, 0, 1)

                TextboxMainIndicator.Name = "TextboxMainIndicator"
                TextboxMainIndicator.Parent = TextboxMain
                TextboxMainIndicator.AnchorPoint = Vector2.new(0.5, 0)
                TextboxMainIndicator.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                TextboxMainIndicator.BorderColor3 = Color3.fromRGB(0, 0, 0)
                TextboxMainIndicator.BorderSizePixel = 0
                TextboxMainIndicator.Position = UDim2.new(0.5, 0, 1, 0)
                TextboxMainIndicator.Size = UDim2.new(0, 0, 0, 1)

                TextBoxMainHolder.Name = "TextBoxMainHolder"
                TextBoxMainHolder.Parent = TextboxMain
                TextBoxMainHolder.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                TextBoxMainHolder.BackgroundTransparency = 1.000
                TextBoxMainHolder.BorderColor3 = Color3.fromRGB(0, 0, 0)
                TextBoxMainHolder.BorderSizePixel = 0
                TextBoxMainHolder.Size = UDim2.new(0, 205, 0, 18)
                TextBoxMainHolder.Font = Enum.Font.SourceSans
                TextBoxMainHolder.Text = con.DefaultTextbox
                TextBoxMainHolder.TextColor3 = Color3.fromRGB(255, 255, 255)
                TextBoxMainHolder.TextScaled = true
                TextBoxMainHolder.TextSize = 14.000
                TextBoxMainHolder.TextWrapped = true

                TextBoxMainHolder:GetPropertyChangedSignal("Text"):Connect(function()
                    TextboxMainIndicator.Size = UDim2.fromOffset(0,1)
                    game:GetService("TweenService"):Create(TextboxMainIndicator, TweenInfo.new(0.25,Enum.EasingStyle.Quint),{Size = UDim2.fromOffset(205,1)}):Play()
                    if con.ApplyEveryTyping == true then
                        con.Callback(TextBoxMainHolder.Text)
                    end
                end)
                
                TextBoxMainHolder.Focused:Connect(function()
                    game:GetService("TweenService"):Create(TextboxMainIndicator, TweenInfo.new(0.25,Enum.EasingStyle.Quint),{Size = UDim2.fromOffset(205,1)}):Play()
                end)
                
                TextBoxMainHolder.FocusLost:Connect(function()
                    game:GetService("TweenService"):Create(TextboxMainIndicator, TweenInfo.new(0.25,Enum.EasingStyle.Quint),{Size = UDim2.fromOffset(0,1)}):Play()
                    con.Callback(TextBoxMainHolder.Text)
                end)
            end

            function SectionElements.AddSeperator(ysize)
                ysize = ysize or 25
                local Seperator = Instance.new("Frame")
                local SeperatorLine = Instance.new("TextButton")

                Seperator.Name = "Seperator"
                Seperator.Parent = Section
                Seperator.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                Seperator.BackgroundTransparency = 1.000
                Seperator.BorderColor3 = Color3.fromRGB(0, 0, 0)
                Seperator.BorderSizePixel = 0
                Seperator.Size = UDim2.new(0, 220, 0, ysize)

                SeperatorLine.Name = "SeperatorLine"
                SeperatorLine.Parent = Seperator
                SeperatorLine.AnchorPoint = Vector2.new(0.5, 0.5)
                SeperatorLine.BackgroundColor3 = Color3.fromRGB(100, 100, 100)
                SeperatorLine.BorderColor3 = Color3.fromRGB(0, 0, 0)
                SeperatorLine.BorderSizePixel = 0
                SeperatorLine.Position = UDim2.new(0.49545455, 0, 0.479999989, 0)
                SeperatorLine.Size = UDim2.new(0, 190, 0, 1)
                SeperatorLine.AutoButtonColor = false
                SeperatorLine.Text = ""
                SeperatorLine.TextColor3 = Color3.fromRGB(255, 255, 255)
                SeperatorLine.TextSize = 12.000

            end

            function SectionElements.AddLabel(str, txa, tsize)
                str = str or "nil label"
                txa = txa or Enum.TextXAlignment.Center
                tsize = tsize or 13

                local Label = Instance.new("Frame")
                local LabelText = Instance.new("TextLabel")

                Label.Name = "Label"
                Label.Parent = Section
                Label.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                Label.BackgroundTransparency = 1.000
                Label.BorderColor3 = Color3.fromRGB(0, 0, 0)
                Label.BorderSizePixel = 0
                Label.Size = UDim2.new(0, 220, 0, 25)

                LabelText.Name = "LabelText"
                LabelText.Parent = Label
                LabelText.AnchorPoint = Vector2.new(1, 0)
                LabelText.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                LabelText.BackgroundTransparency = 1.000
                LabelText.BorderColor3 = Color3.fromRGB(0, 0, 0)
                LabelText.BorderSizePixel = 0
                LabelText.Position = UDim2.new(0.957272708, 0, 0, 0)
                LabelText.Size = UDim2.new(0, 199, 0, 25)
                LabelText.FontFace = Font.new("rbxasset://fonts/families/Montserrat.json", Enum.FontWeight.SemiBold)
                LabelText.Text = str
                LabelText.TextColor3 = Color3.fromRGB(255, 255, 255)
                LabelText.TextSize = 13.000
                LabelText.TextWrapped = true
                LabelText.TextXAlignment = txa

                local labelfunc = {}

                function labelfunc.SetText(str)
                    LabelText.Text = str
                end
                
                return labelfunc

            end

            function SectionElements.AddDropdown(con)
                con = con or {}
                con.Name = con.Name or "dropdawn"
                con.List = con.List or {"nil1","nil2","nil3","nil4"}
                con.Default = con.Default or "nil1"
                con.Callback = con.Callback or function(a) print(a) end

                local Dropdown = Instance.new("Frame")
                local DropdownTrigger = Instance.new("TextButton")
                local DropdownTriggerStroke = Instance.new("UIStroke")
                local DropdownTriggerCorner = Instance.new("UICorner")
                local DropdownScroll = Instance.new("ScrollingFrame")
                local DropdownScrollLayout = Instance.new("UIListLayout")
                local dropdownTitleDefault = "   "..con.Name..": "..con.Default
                local dropdownTitle = "   "..con.Name..": "

                Dropdown.Name = "Dropdown"
                Dropdown.Parent = Section
                Dropdown.Active = true
                Dropdown.AnchorPoint = Vector2.new(0.5, 1)
                Dropdown.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                Dropdown.BackgroundTransparency = 1.000
                Dropdown.BorderColor3 = Color3.fromRGB(0, 0, 0)
                Dropdown.BorderSizePixel = 0
                Dropdown.Position = UDim2.new(0, 0, 0.666666687, 0)
                Dropdown.Size = UDim2.new(0, 220, 0, 25)

                DropdownTrigger.Name = "DropdownTrigger"
                DropdownTrigger.Parent = Dropdown
                DropdownTrigger.AnchorPoint = Vector2.new(0.5, 0.5)
                DropdownTrigger.BackgroundColor3 = Color3.fromRGB(27, 27, 27)
                DropdownTrigger.BorderColor3 = Color3.fromRGB(0, 0, 0)
                DropdownTrigger.BorderSizePixel = 0
                DropdownTrigger.Position = UDim2.new(0.504999876, 0, 0.468889356, 0)
                DropdownTrigger.Size = UDim2.new(0, 190, 0, 20)
                DropdownTrigger.AutoButtonColor = false
                DropdownTrigger.Font = Enum.Font.SourceSans
                --DropdownTrigger.Text = "   Teleport NPC: "
                DropdownTrigger.Text = dropdownTitleDefault
                DropdownTrigger.TextColor3 = Color3.fromRGB(255, 255, 255)
                DropdownTrigger.TextSize = 13.000
                DropdownTrigger.TextWrapped = true
                DropdownTrigger.TextXAlignment = Enum.TextXAlignment.Left

                DropdownTriggerStroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
                DropdownTriggerStroke.Color = Color3.fromRGB(100, 100, 100)
                DropdownTriggerStroke.Thickness = 0.6000000238418579
                DropdownTriggerStroke.Name = "DropdownTriggerStroke"
                DropdownTriggerStroke.Parent = DropdownTrigger

                DropdownTriggerCorner.CornerRadius = UDim.new(0, 3)
                DropdownTriggerCorner.Name = "DropdownTriggerCorner"
                DropdownTriggerCorner.Parent = DropdownTrigger

                DropdownScroll.Name = "DropdownScroll"
                DropdownScroll.Parent = Dropdown
                DropdownScroll.Active = true
                DropdownScroll.AnchorPoint = Vector2.new(0, 0.5)
                DropdownScroll.BackgroundColor3 = Color3.fromRGB(27, 27, 27)
                DropdownScroll.BorderColor3 = Color3.fromRGB(0, 0, 0)
                DropdownScroll.BorderSizePixel = 0
                DropdownScroll.Position = UDim2.new(0.0728181303, 0, 0.46900025, 0)
                DropdownScroll.Size = UDim2.new(0, 190, 0, 20)
                DropdownScroll.Visible = false
                DropdownScroll.BottomImage = "rbxasset://textures/ui/Scroll/scroll-middle.png"
                DropdownScroll.CanvasSize = UDim2.new(0, 0, 5, 70)
                DropdownScroll.BottomImage = "rbxasset://textures/ui/Scroll/scroll-middle.png"
                DropdownScroll.ScrollBarImageColor3 = Color3.fromRGB(0, 0, 0)
                DropdownScroll.TopImage = "rbxasset://textures/ui/Scroll/scroll-middle.png"
                DropdownScroll.ScrollBarThickness = 1
                DropdownScroll.TopImage = "rbxasset://textures/ui/Scroll/scroll-middle.png"

                DropdownScrollLayout.Name = "DropdownScrollLayout"
                DropdownScrollLayout.Parent = DropdownScroll
                DropdownScrollLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center
                DropdownScrollLayout.SortOrder = Enum.SortOrder.LayoutOrder

                local kt = DropdownTrigger
                local ktext = DropdownScroll
                local drp = Dropdown
                local uis = game:GetService("UserInputService")
                local opened = false

                for i,v in next, con.List do
                    local Option = Instance.new("TextButton")
                    Option.Name = "Option"
                    Option.Parent = DropdownScroll
                    Option.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                    Option.BackgroundTransparency = 1.000
                    Option.BorderColor3 = Color3.fromRGB(0, 0, 0)
                    Option.BorderSizePixel = 0
                    Option.Position = UDim2.new(-0.447368413, 0, 0, 0)
                    Option.Size = UDim2.new(0, 190, 0, 20)
                    Option.Font = Enum.Font.SourceSans
                    Option.Text = tostring(v)
                    Option.TextColor3 = Color3.fromRGB(255, 255, 255)
                    Option.TextSize = 11.000
                    Option.TextWrapped = true
                end
                
                kt.MouseButton1Click:Connect(function()
                    if opened == false then
                        opened = true
                        game:GetService("TweenService"):Create(kt, TweenInfo.new(0.25, Enum.EasingStyle.Quint),{Size = UDim2.fromOffset(190,60)}):Play()
                        game:GetService("TweenService"):Create(kt,TweenInfo.new(0.25,Enum.EasingStyle.Quad),{TextTransparency = 1}):Play()
                        game:GetService("TweenService"):Create(ktext,TweenInfo.new(0.25,Enum.EasingStyle.Quad),{Size = UDim2.fromOffset(190,60)}):Play()
                        game:GetService("TweenService"):Create(drp,TweenInfo.new(0.25,Enum.EasingStyle.Quad),{Size = UDim2.fromOffset(220,50)}):Play()
                        ktext.Visible = true
                    else
                        opened = false
                        game:GetService("TweenService"):Create(kt, TweenInfo.new(0.25, Enum.EasingStyle.Quint),{Size = UDim2.fromOffset(190,20)}):Play()
                        game:GetService("TweenService"):Create(kt,TweenInfo.new(0.25,Enum.EasingStyle.Quad),{TextTransparency = 0}):Play()
                        game:GetService("TweenService"):Create(ktext,TweenInfo.new(0.25,Enum.EasingStyle.Quad),{Size = UDim2.fromOffset(190,20)}):Play()
                        game:GetService("TweenService"):Create(drp,TweenInfo.new(0.25,Enum.EasingStyle.Quad),{Size = UDim2.fromOffset(220,25)}):Play()
                
                        ktext.Visible = false
                    end
                end)
                uis.InputBegan:Connect(function(kys,ok)
                    if ok == false and (kys.UserInputType == Enum.UserInputType.MouseButton1 or kys.UserInputType == Enum.UserInputType.Touch) then
                        opened = false
                        game:GetService("TweenService"):Create(kt, TweenInfo.new(0.25, Enum.EasingStyle.Quint),{Size = UDim2.fromOffset(190,20)}):Play()
                        game:GetService("TweenService"):Create(kt,TweenInfo.new(0.25,Enum.EasingStyle.Quad),{TextTransparency = 0}):Play()
                        game:GetService("TweenService"):Create(ktext,TweenInfo.new(0.25,Enum.EasingStyle.Quad),{Size = UDim2.fromOffset(190,20)}):Play()
                        game:GetService("TweenService"):Create(drp,TweenInfo.new(0.25,Enum.EasingStyle.Quad),{Size = UDim2.fromOffset(220,25)}):Play()
                        ktext.Visible = false
                    end
                end)
                
                for i, v in next, ktext:GetChildren() do
                    if v.Name == 'Option' then
                        v.MouseButton1Click:connect(function()
                            --print(v.Text)
                            con.Callback(v.Text)
                            kt.Text = dropdownTitle..v.Text
                            opened = false
                            game:GetService("TweenService"):Create(kt, TweenInfo.new(0.25, Enum.EasingStyle.Quint),{Size = UDim2.fromOffset(190,20)}):Play()
                            game:GetService("TweenService"):Create(kt,TweenInfo.new(0.25,Enum.EasingStyle.Quad),{TextTransparency = 0}):Play()
                            game:GetService("TweenService"):Create(ktext,TweenInfo.new(0.25,Enum.EasingStyle.Quad),{Size = UDim2.fromOffset(190,20)}):Play()
                            game:GetService("TweenService"):Create(drp,TweenInfo.new(0.25,Enum.EasingStyle.Quad),{Size = UDim2.fromOffset(220,25)}):Play()
                            ktext.Visible = false
                        end)
                    end
                end
                game:GetService("RunService").RenderStepped:Connect(function()
                    ktext.CanvasSize = UDim2.new(0,0,0,ktext.DropdownScrollLayout.AbsoluteContentSize.Y)
                end)

            end
            return SectionElements
        end
        return PageSection
    end
    return HidrousPages
end
return Hidrous

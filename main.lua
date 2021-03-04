local library = {}

function library:Window(title)
    local Players = game:GetService('Players')
    local CoreGui = game:GetService('CoreGui')
    local TweenService = game:GetService('TweenService')
    
    local function protected_gui()
    	local gui = CoreGui:FindFirstChildOfClass('ScreenGui')
    
    	if not gui then
    		gui = Instance.new("ScreenGui")
    		gui.Name = ''
    		gui.Parent = game.CoreGui
    		gui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
    	end
    
    	if syn then syn.protect_gui(gui) end
    	return gui
    end
    
    local ScreenGui = protected_gui()
    
    local Frame = Instance.new("Frame")
    local _title = Instance.new("TextLabel")
    local drop = Instance.new("ImageButton")
    local cont = Instance.new("Frame")
    local list = Instance.new("UIListLayout") 
    
    Frame.Name = ''
    Frame.Parent = ScreenGui
    Frame.BackgroundColor3 = Color3.fromRGB(41, 40, 48)
    Frame.ClipsDescendants = true
    Frame.Position = UDim2.new(0.383306324, 0, 0.138795987, 0)
    Frame.Size = UDim2.new(0, 157, 0, 42)
    
    local UserInputService = game:GetService("UserInputService")

    local gui = Frame
    
    local dragging
    local dragInput
    local dragStart
    local startPos
    
    local function update(input)
    	local delta = input.Position - dragStart
    	gui.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
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
    
    UserInputService.InputChanged:Connect(function(input)
    	if input == dragInput and dragging then
    		update(input)
    	end
    end)
    
    _title.Name = "title"
    _title.Parent = Frame
    _title.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    _title.BackgroundTransparency = 1.000
    _title.Position = UDim2.new(0, 12, 0, 6)
    _title.Size = UDim2.new(0, 106, 0, 31)
    _title.Font = Enum.Font.GothamSemibold
    _title.TextColor3 = Color3.fromRGB(214, 214, 214)
    _title.TextSize = 13.000
    _title.TextXAlignment = Enum.TextXAlignment.Left
    _title.Text = title
    
    drop.Name = "drop"
    drop.Parent = Frame
    drop.BackgroundTransparency = 1.000
    drop.Position = UDim2.new(0, 129, 0, 9)
    drop.Size = UDim2.new(0, 25, 0, 25)
    drop.ZIndex = 2
    drop.Image = "rbxassetid://3926307971"
    drop.ImageRectOffset = Vector2.new(324, 524)
    drop.ImageRectSize = Vector2.new(36, 36)
    
    cont.Name = "cont"
    cont.Parent = Frame
    cont.BackgroundColor3 = Color3.fromRGB(52, 53, 62)
    cont.BackgroundTransparency = 1.000
    cont.BorderSizePixel = 0
    cont.Position = UDim2.new(0, 7, 0, 42)
    cont.Size = UDim2.new(0, 143, 0, 42)
    
    list.Parent = cont
    list.SortOrder = Enum.SortOrder.LayoutOrder
    
    local window = {}

    function window:Toggle(text, callback)
        local Frame_2 = Instance.new("Frame")
        local _text = Instance.new("TextLabel")
        local checked = Instance.new("ImageButton")
        local Sample = Instance.new("ImageLabel")
        local unchecked = Instance.new("ImageButton")
        local Sample_2 = Instance.new("ImageLabel")
    
        Frame_2.Name = text
        Frame_2.Parent = cont
        Frame_2.BackgroundColor3 = Color3.fromRGB(157, 144, 111)
        Frame_2.BackgroundTransparency = 1.000
        Frame_2.Size = UDim2.new(1, 0, 0, 30)
        
        _text.Name = "text"
        _text.Parent = Frame_2
        _text.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        _text.BackgroundTransparency = 1.000
        _text.Position = UDim2.new(0.0368298069, 0, 0.178787738, 0)
        _text.Size = UDim2.new(0, 111, 0, 18)
        _text.Font = Enum.Font.Gotham
        _text.Text = text
        _text.TextColor3 = Color3.fromRGB(176, 176, 176)
        _text.TextSize = 12.000
        _text.TextXAlignment = Enum.TextXAlignment.Left
        
        checked.Name = "checked"
        checked.Parent = Frame_2
        checked.BackgroundTransparency = 1.000
        checked.Position = UDim2.new(0.853380978, 0, 0.13333334, 0)
        checked.Size = UDim2.new(0, 20, 0, 20)
        checked.ZIndex = 2
        checked.Image = "rbxassetid://3926309567"
        checked.ImageColor3 = Color3.fromRGB(189, 189, 189)
        checked.ImageRectOffset = Vector2.new(784, 420)
        checked.ImageRectSize = Vector2.new(48, 48)
        checked.ImageTransparency = 1.000
        
        unchecked.Name = "unchecked"
        unchecked.Parent = Frame_2
        unchecked.BackgroundTransparency = 1.000
        unchecked.Position = UDim2.new(0.853380919, 0, 0.13333334, 0)
        unchecked.Size = UDim2.new(0, 20, 0, 20)
        unchecked.ZIndex = 2
        unchecked.Image = "rbxassetid://3926309567"
        unchecked.ImageColor3 = Color3.fromRGB(189, 189, 189)
        unchecked.ImageRectOffset = Vector2.new(628, 420)
        unchecked.ImageRectSize = Vector2.new(48, 48)
        
        Sample.Name = "Sample"
        Sample.Parent = unchecked
        Sample.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        Sample.BackgroundTransparency = 1.000
        Sample.Image = "http://www.roblox.com/asset/?id=4560909609"
        Sample.ImageTransparency = 0.600
        
        local vis = true
        local info = TweenInfo.new(0.2, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out)
        local crr
        
        drop.MouseButton1Click:connect(function()
        	vis = not vis
        	if crr then crr:Pause() end	
        
        	if vis then
        		crr = TweenService:Create(Frame, info, {Size = UDim2.new(0,157,0,42)}):Play()
        	else
        		crr = TweenService:Create(Frame, info, {Size = UDim2.new(0,157,0,list.AbsoluteContentSize.Y+42)}):Play()
        	end
        end)
        
        local ms = Players.LocalPlayer:GetMouse()
        local sample = Sample
        local btn = unchecked
        
        local function effect()
        	local c = sample:Clone()
        	c.Parent = btn
        	local x, y = (ms.X - c.AbsolutePosition.X), (ms.Y - c.AbsolutePosition.Y)
        	c.Position = UDim2.new(0, x, 0, y)
        	local len, size = 0.35, nil
        	if btn.AbsoluteSize.X >= btn.AbsoluteSize.Y then
        		size = (btn.AbsoluteSize.X * 1.5)
        	else
        		size = (btn.AbsoluteSize.Y * 1.5)
        	end
        	c:TweenSizeAndPosition(UDim2.new(0, size, 0, size), UDim2.new(0.5, (-size / 2), 0.5, (-size / 2)), 'Out', 'Quad', len, true, nil)
        	for i = 1, 10 do
        		c.ImageTransparency = c.ImageTransparency + 0.05
        		wait(len / 12)
        	end
        	c:Destroy()
        end
        
        checked.MouseButton1Click:Connect(effect)
        
        local ms = game.Players.LocalPlayer:GetMouse()
        
        unchecked.MouseButton1Click:Connect(effect)
        
        local enabled = false
        
        function turn()
        	enabled = not enabled
        	if enabled then
        		while enabled and checked.ImageTransparency > 0 and wait() do
        			checked.ImageTransparency = checked.ImageTransparency - 0.2
        		end
        	else
        		while not enabled and checked.ImageTransparency < 1 and wait() do
        			checked.ImageTransparency = checked.ImageTransparency + 0.2
        		end
        	end
        end
        
        checked.MouseButton1Click:Connect(turn)
        unchecked.MouseButton1Click:Connect(turn)
        unchecked.MouseButton1Click:Connect(function()
            callback(enabled)
        end)
        
        return {Enabled = function() return enabled end}
    end
    return window
end
return library

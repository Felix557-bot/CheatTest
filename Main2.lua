local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local Character = LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()
local Humanoid = Character:FindFirstChildOfClass("Humanoid")
local Animator = Humanoid and Humanoid:FindFirstChildOfClass("Animator")
local RunService = game:GetService("RunService")
local TweenService = game:GetService("TweenService")
local Camera = workspace.CurrentCamera

local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Parent = LocalPlayer:WaitForChild("PlayerGui")

local Frame = Instance.new("Frame", ScreenGui)
Frame.Size = UDim2.new(0, 450, 0, 550)
Frame.Position = UDim2.new(0.5, -225, 0.5, -275)
Frame.BackgroundColor3 = Color3.fromRGB(173, 216, 230)
Frame.Active = true
Frame.Draggable = true
Frame.ClipsDescendants = true

local TopBar = Instance.new("Frame", Frame)
TopBar.Size = UDim2.new(1, 0, 0, 30)
TopBar.BackgroundColor3 = Color3.fromRGB(50, 50, 50)

local LogTab = Instance.new("TextButton", TopBar)
LogTab.Size = UDim2.new(0, 80, 1, 0)
LogTab.Position = UDim2.new(0, 5, 0, 0)
LogTab.Text = "My Logs"
LogTab.BackgroundColor3 = Color3.fromRGB(0, 255, 0)

local EntitiesTab = Instance.new("TextButton", TopBar)
EntitiesTab.Size = UDim2.new(0, 80, 1, 0)
EntitiesTab.Position = UDim2.new(0, 90, 0, 0)
EntitiesTab.Text = "Entities"
EntitiesTab.BackgroundColor3 = Color3.fromRGB(0, 255, 0)

local SavesTab = Instance.new("TextButton", TopBar)
SavesTab.Size = UDim2.new(0, 100, 1, 0)
SavesTab.Position = UDim2.new(0, 175, 0, 0)
SavesTab.Text = "LoggerSaves"
SavesTab.BackgroundColor3 = Color3.fromRGB(0, 255, 0)

local PlayTab = Instance.new("TextButton", TopBar)
PlayTab.Size = UDim2.new(0, 80, 1, 0)
PlayTab.Position = UDim2.new(0, 280, 0, 0)
PlayTab.Text = "Play"
PlayTab.BackgroundColor3 = Color3.fromRGB(0, 255, 0)

local MinimizeButton = Instance.new("TextButton", ScreenGui)
MinimizeButton.Size = UDim2.new(0, 30, 0, 30)
MinimizeButton.Position = UDim2.new(0, 5, 0.5, -15)
MinimizeButton.Text = "-"
MinimizeButton.BackgroundColor3 = Color3.fromRGB(150, 50, 50)

local CloseButton = Instance.new("TextButton", TopBar)
CloseButton.Size = UDim2.new(0, 30, 1, 0)
CloseButton.Position = UDim2.new(1, -30, 0, 0)
CloseButton.Text = "X"
CloseButton.BackgroundColor3 = Color3.fromRGB(200, 0, 0)

local ContentFrame = Instance.new("Frame", Frame)
ContentFrame.Size = UDim2.new(1, 0, 1, -30)
ContentFrame.Position = UDim2.new(0, 0, 0, 30)
ContentFrame.ClipsDescendants = true

-- My Logs Frame
local MyLogsFrame = Instance.new("ScrollingFrame", ContentFrame)
MyLogsFrame.Size = UDim2.new(1, 0, 1, 0)
MyLogsFrame.CanvasSize = UDim2.new(0, 0, 0, 0)
MyLogsFrame.ScrollBarThickness = 5
MyLogsFrame.Visible = true
MyLogsFrame.AutomaticCanvasSize = Enum.AutomaticSize.Y
MyLogsFrame.ClipsDescendants = true
MyLogsFrame.BackgroundTransparency = 1

local MyLogsList = Instance.new("UIListLayout", MyLogsFrame)
MyLogsList.SortOrder = Enum.SortOrder.LayoutOrder
MyLogsList.Padding = UDim.new(0, 5)

-- Entities Frame
local EntitiesFrame = Instance.new("ScrollingFrame", ContentFrame)
EntitiesFrame.Size = UDim2.new(1, 0, 1, 0)
EntitiesFrame.CanvasSize = UDim2.new(0, 0, 0, 0)
EntitiesFrame.ScrollBarThickness = 5
EntitiesFrame.Visible = false
EntitiesFrame.AutomaticCanvasSize = Enum.AutomaticSize.Y
EntitiesFrame.BackgroundTransparency = 1

local EntitiesList = Instance.new("UIListLayout", EntitiesFrame)
EntitiesList.SortOrder = Enum.SortOrder.LayoutOrder
EntitiesList.Padding = UDim.new(0, 5)

-- Entity Logs Frame
local EntityLogsFrame = Instance.new("ScrollingFrame", ContentFrame)
EntityLogsFrame.Size = UDim2.new(1, 0, 1, 0)
EntityLogsFrame.CanvasSize = UDim2.new(0, 0, 0, 0)
EntityLogsFrame.ScrollBarThickness = 5
EntityLogsFrame.Visible = false
EntityLogsFrame.AutomaticCanvasSize = Enum.AutomaticSize.Y
EntityLogsFrame.ClipsDescendants = true
EntityLogsFrame.BackgroundTransparency = 1

local EntityLogsList = Instance.new("UIListLayout", EntityLogsFrame)
EntityLogsList.SortOrder = Enum.SortOrder.LayoutOrder
EntityLogsList.Padding = UDim.new(0, 5)

local BackButton = Instance.new("TextButton", ContentFrame)
BackButton.Size = UDim2.new(0, 80, 0, 30)
BackButton.Position = UDim2.new(0, 10, 1, -40)
BackButton.Text = "< Back"
BackButton.BackgroundColor3 = Color3.fromRGB(100, 100, 100)
BackButton.Visible = false

-- LoggerSaves Frame
local SavesFrame = Instance.new("ScrollingFrame", ContentFrame)
SavesFrame.Size = UDim2.new(1, 0, 1, 0)
SavesFrame.CanvasSize = UDim2.new(0, 0, 0, 0)
SavesFrame.ScrollBarThickness = 5
SavesFrame.Visible = false
SavesFrame.AutomaticCanvasSize = Enum.AutomaticSize.Y
SavesFrame.ClipsDescendants = true
SavesFrame.BackgroundTransparency = 1

local SavesList = Instance.new("UIListLayout", SavesFrame)
SavesList.SortOrder = Enum.SortOrder.LayoutOrder
SavesList.Padding = UDim.new(0, 5)

-- Play Frame
local PlayFrame = Instance.new("Frame", ContentFrame)
PlayFrame.Size = UDim2.new(1, 0, 1, 0)
PlayFrame.Visible = false

local TextBox = Instance.new("TextBox", PlayFrame)
TextBox.Size = UDim2.new(1, -20, 0, 30)
TextBox.Position = UDim2.new(0, 10, 0, 10)
TextBox.PlaceholderText = "Enter Animation ID"

local PlayButton = Instance.new("TextButton", PlayFrame)
PlayButton.Size = UDim2.new(1, -20, 0, 30)
PlayButton.Position = UDim2.new(0, 10, 0, 50)
PlayButton.Text = "Play"
PlayButton.BackgroundColor3 = Color3.fromRGB(70, 70, 70)

local LoopToggle = Instance.new("TextButton", PlayFrame)
LoopToggle.Size = UDim2.new(1, -20, 0, 30)
LoopToggle.Position = UDim2.new(0, 10, 0, 90)
LoopToggle.Text = "Loop: OFF"
LoopToggle.BackgroundColor3 = Color3.fromRGB(100, 100, 100)

local FreezeToggle = Instance.new("TextButton", PlayFrame)
FreezeToggle.Size = UDim2.new(1, -20, 0, 30)
FreezeToggle.Position = UDim2.new(0, 10, 0, 130)
FreezeToggle.Text = "Freeze: OFF"
FreezeToggle.BackgroundColor3 = Color3.fromRGB(100, 100, 100)

local StopButton = Instance.new("TextButton", PlayFrame)
StopButton.Size = UDim2.new(1, -20, 0, 30)
StopButton.Position = UDim2.new(0, 10, 0, 170)
StopButton.Text = "Stop Animation"
StopButton.BackgroundColor3 = Color3.fromRGB(150, 50, 50)

-- Timer Label
local TimerLabel = Instance.new("TextLabel", PlayFrame)
TimerLabel.Size = UDim2.new(1, -20, 0, 30)
TimerLabel.Position = UDim2.new(0, 10, 0, 210)
TimerLabel.Text = "0:00 / 0:00"
TimerLabel.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
TimerLabel.TextColor3 = Color3.new(1, 1, 1)
TimerLabel.TextScaled = true

-- Exit Spectate Button
local ExitSpectateButton = Instance.new("TextButton", ScreenGui)
ExitSpectateButton.Size = UDim2.new(0, 100, 0, 40)
ExitSpectateButton.Position = UDim2.new(1, -110, 1, -50)
ExitSpectateButton.Text = "Exit Spectate"
ExitSpectateButton.BackgroundColor3 = Color3.fromRGB(200, 50, 50)
ExitSpectateButton.TextColor3 = Color3.new(1, 1, 1)
ExitSpectateButton.Visible = false
ExitSpectateButton.ZIndex = 10

-- Хранилище данных
local animationCounts = {} -- {[animationId] = count}
local entityAnimationListeners = {} -- {[entityName] = connection}
local currentEntityLogs = {} -- {animationId = {count, label}}
local globalAnimationLogs = {} -- {[animationId] = {count, sourceName}}
local isAnimationPlaying = false
local currentTrack = nil
local currentAnimation = nil
local isLooping = false
local isFrozen = false
local frozenTime = 0
local currentSpectateTarget = nil
local currentHighlight = nil
local cameraConnection = nil

-- Функция для форматирования времени
local function formatTime(time)
    local minutes = math.floor(time / 60)
    local seconds = time % 60
    return string.format("%d:%02d", minutes, seconds)
end

-- Функция для обновления таймера
local function updateTimer()
    if currentTrack and currentTrack.IsPlaying then
        local currentTime = currentTrack.TimePosition
        local duration = currentTrack.Length
        TimerLabel.Text = formatTime(currentTime) .. " / " .. formatTime(duration)
    else
        TimerLabel.Text = "0:00 / 0:00"
    end
end

-- Функция для добавления анимации в глобальные логи (LoggerSaves)
local function addToSaves(animationId, sourceName)
    if not animationCounts[animationId] then
        animationCounts[animationId] = 0
    end
    animationCounts[animationId] = animationCounts[animationId] + 1
    
    -- Обновляем или создаем элемент в SavesFrame
    local existingRow = nil
    for _, child in pairs(SavesFrame:GetChildren()) do
        if child:IsA("Frame") and child:FindFirstChild("AnimationId") and child.AnimationId.Text == animationId then
            existingRow = child
            break
        end
    end
    
    if existingRow then
        local countLabel = existingRow:FindFirstChild("Count")
        if countLabel then
            countLabel.Text = "[" .. animationCounts[animationId] .. "]"
        end
    else
        local AnimRow = Instance.new("Frame", SavesFrame)
        AnimRow.Size = UDim2.new(1, 0, 0, 30)
        AnimRow.BackgroundTransparency = 1
        
        local Label = Instance.new("TextLabel", AnimRow)
        Label.Name = "AnimationId"
        Label.Size = UDim2.new(0.6, 0, 1, 0)
        Label.Text = animationId
        Label.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
        Label.TextColor3 = Color3.new(1, 1, 1)
        
        local CountLabel = Instance.new("TextLabel", AnimRow)
        CountLabel.Name = "Count"
        CountLabel.Size = UDim2.new(0.15, 0, 1, 0)
        CountLabel.Position = UDim2.new(0.6, 0, 0, 0)
        CountLabel.Text = "[" .. animationCounts[animationId] .. "]"
        CountLabel.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
        CountLabel.TextColor3 = Color3.new(1, 1, 0)
        
        local CopyButton = Instance.new("TextButton", AnimRow)
        CopyButton.Size = UDim2.new(0.25, 0, 1, 0)
        CopyButton.Position = UDim2.new(0.75, 0, 0, 0)
        CopyButton.Text = "Copy"
        CopyButton.BackgroundColor3 = Color3.fromRGB(100, 100, 100)
        
        CopyButton.MouseButton1Click:Connect(function()
            setclipboard(animationId)
        end)
    end
    
    SavesFrame.CanvasSize = UDim2.new(0, 0, 0, SavesList.AbsoluteContentSize.Y)
end

-- Функция для добавления анимации в логи (локальные или выбранного существа)
local function addToLogs(frame, listLayout, animationId, sourceName)
    local AnimRow = Instance.new("Frame", frame)
    AnimRow.Size = UDim2.new(1, 0, 0, 30)
    AnimRow.BackgroundTransparency = 1
    
    local Label = Instance.new("TextLabel", AnimRow)
    Label.Size = UDim2.new(0.7, 0, 1, 0)
    Label.Text = animationId .. (sourceName and " (" .. sourceName .. ")" or "")
    Label.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
    Label.TextColor3 = Color3.new(1, 1, 1)
    
    local CopyButton = Instance.new("TextButton", AnimRow)
    CopyButton.Size = UDim2.new(0.3, 0, 1, 0)
    CopyButton.Position = UDim2.new(0.7, 0, 0, 0)
    CopyButton.Text = "Copy"
    CopyButton.BackgroundColor3 = Color3.fromRGB(100, 100, 100)
    
    CopyButton.MouseButton1Click:Connect(function()
        setclipboard(animationId)
    end)
    
    frame.CanvasSize = UDim2.new(0, 0, 0, listLayout.AbsoluteContentSize.Y)
end

-- Функция для добавления анимации в глобальный лог всех анимаций
local function addToGlobalLog(animationId, sourceName)
    addToSaves(animationId, sourceName)
end

-- Функция для очистки логов выбранного существа
local function clearEntityLogs()
    for _, child in pairs(EntityLogsFrame:GetChildren()) do
        if child:IsA("Frame") then
            child:Destroy()
        end
    end
    currentEntityLogs = {}
    EntityLogsFrame.CanvasSize = UDim2.new(0, 0, 0, 0)
end

-- Функция для добавления анимации в логи выбранного существа
local function addToEntityLogs(animationId)
    if not currentEntityLogs[animationId] then
        currentEntityLogs[animationId] = 0
    end
    currentEntityLogs[animationId] = currentEntityLogs[animationId] + 1
    
    local existingRow = nil
    for _, child in pairs(EntityLogsFrame:GetChildren()) do
        if child:IsA("Frame") and child:FindFirstChild("AnimationId") and child.AnimationId.Text == animationId then
            existingRow = child
            break
        end
    end
    
    if existingRow then
        local countLabel = existingRow:FindFirstChild("Count")
        if countLabel then
            countLabel.Text = "[" .. currentEntityLogs[animationId] .. "]"
        end
    else
        local AnimRow = Instance.new("Frame", EntityLogsFrame)
        AnimRow.Size = UDim2.new(1, 0, 0, 30)
        AnimRow.BackgroundTransparency = 1
        
        local Label = Instance.new("TextLabel", AnimRow)
        Label.Name = "AnimationId"
        Label.Size = UDim2.new(0.6, 0, 1, 0)
        Label.Text = animationId
        Label.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
        Label.TextColor3 = Color3.new(1, 1, 1)
        
        local CountLabel = Instance.new("TextLabel", AnimRow)
        CountLabel.Name = "Count"
        CountLabel.Size = UDim2.new(0.15, 0, 1, 0)
        CountLabel.Position = UDim2.new(0.6, 0, 0, 0)
        CountLabel.Text = "[" .. currentEntityLogs[animationId] .. "]"
        CountLabel.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
        CountLabel.TextColor3 = Color3.new(1, 1, 0)
        
        local CopyButton = Instance.new("TextButton", AnimRow)
        CopyButton.Size = UDim2.new(0.25, 0, 1, 0)
        CopyButton.Position = UDim2.new(0.75, 0, 0, 0)
        CopyButton.Text = "Copy"
        CopyButton.BackgroundColor3 = Color3.fromRGB(100, 100, 100)
        
        CopyButton.MouseButton1Click:Connect(function()
            setclipboard(animationId)
        end)
    end
    
    EntityLogsFrame.CanvasSize = UDim2.new(0, 0, 0, EntityLogsList.AbsoluteContentSize.Y)
end

-- Функция для спекта
local function spectateEntity(target)
    if currentSpectateTarget == target then return end
    
    -- Убираем текущий спекта
    if currentSpectateTarget then
        if currentHighlight then
            currentHighlight:Destroy()
            currentHighlight = nil
        end
        if cameraConnection then
            cameraConnection:Disconnect()
            cameraConnection = nil
        end
    end
    
    currentSpectateTarget = target
    
    -- Создаем обводку
    currentHighlight = Instance.new("Highlight")
    currentHighlight.Adornee = target.Character or target
    currentHighlight.FillColor = Color3.fromRGB(255, 255, 255)
    currentHighlight.FillTransparency = 0.5
    currentHighlight.OutlineColor = Color3.fromRGB(255, 255, 255)
    currentHighlight.OutlineTransparency = 0
    currentHighlight.Parent = ScreenGui
    
    -- Следим за камерой
    cameraConnection = RunService.RenderStepped:Connect(function()
        if target and target.Character and target.Character:FindFirstChild("HumanoidRootPart") then
            local hrp = target.Character.HumanoidRootPart
            local cameraOffset = CFrame.new(hrp.Position + Vector3.new(0, 2, 5))
            Camera.CFrame = cameraOffset
        elseif target and target:FindFirstChild("HumanoidRootPart") then
            local hrp = target.HumanoidRootPart
            local cameraOffset = CFrame.new(hrp.Position + Vector3.new(0, 2, 5))
            Camera.CFrame = cameraOffset
        end
    end)
    
    ExitSpectateButton.Visible = true
end

-- Функция для выхода из спекта
local function exitSpectate()
    if currentHighlight then
        currentHighlight:Destroy()
        currentHighlight = nil
    end
    if cameraConnection then
        cameraConnection:Disconnect()
        cameraConnection = nil
    end
    currentSpectateTarget = nil
    ExitSpectateButton.Visible = false
    
    -- Возвращаем камеру на игрока
    if Character and Character:FindFirstChild("HumanoidRootPart") then
        Camera.CameraType = Enum.CameraType.Custom
        local hrp = Character.HumanoidRootPart
        local cameraOffset = CFrame.new(hrp.Position + Vector3.new(0, 2, 5))
        Camera.CFrame = cameraOffset
    end
end

-- Функция для получения всех существ
local function GetAllEntities()
    local entities = {}
    
    for _, player in pairs(Players:GetPlayers()) do
        if player ~= LocalPlayer then
            local character = player.Character
            if character then
                local humanoid = character:FindFirstChildOfClass("Humanoid")
                local animator = humanoid and humanoid:FindFirstChildOfClass("Animator")
                if animator then
                    table.insert(entities, {
                        Name = player.Name,
                        Type = "Player",
                        Animator = animator,
                        Character = character,
                        Player = player
                    })
                end
            end
        end
    end
    
    for _, obj in pairs(workspace:GetDescendants()) do
        if obj:IsA("Humanoid") then
            local character = obj.Parent
            local animator = obj:FindFirstChildOfClass("Animator")
            
            local isPlayerCharacter = false
            for _, player in pairs(Players:GetPlayers()) do
                if player.Character == character then
                    isPlayerCharacter = true
                    break
                end
            end
            
            if animator and not isPlayerCharacter then
                table.insert(entities, {
                    Name = character.Name or "Unknown",
                    Type = "NPC",
                    Animator = animator,
                    Character = character,
                    Player = nil
                })
            end
        end
    end
    
    return entities
end

-- Функция для обновления списка существ
local function RefreshEntitiesList()
    for _, child in pairs(EntitiesFrame:GetChildren()) do
        if child:IsA("Frame") then
            child:Destroy()
        end
    end
    
    local entities = GetAllEntities()
    
    for _, entity in pairs(entities) do
        local EntityRow = Instance.new("Frame", EntitiesFrame)
        EntityRow.Size = UDim2.new(1, 0, 0, 60)
        EntityRow.BackgroundColor3 = Color3.fromRGB(70, 70, 70)
        EntityRow.BorderSizePixel = 1
        
        local NameLabel = Instance.new("TextLabel", EntityRow)
        NameLabel.Size = UDim2.new(1, -10, 0, 20)
        NameLabel.Position = UDim2.new(0, 5, 0, 5)
        NameLabel.Text = entity.Name .. " (" .. entity.Type .. ")"
        NameLabel.BackgroundTransparency = 1
        NameLabel.TextColor3 = Color3.new(1, 1, 1)
        NameLabel.TextXAlignment = Enum.TextXAlignment.Left
        
        local ViewButton = Instance.new("TextButton", EntityRow)
        ViewButton.Size = UDim2.new(0.45, 0, 0, 25)
        ViewButton.Position = UDim2.new(0.02, 0, 0, 30)
        ViewButton.Text = "View Logs"
        ViewButton.BackgroundColor3 = Color3.fromRGB(100, 100, 100)
        
        local SpectateButton = Instance.new("TextButton", EntityRow)
        SpectateButton.Size = UDim2.new(0.45, 0, 0, 25)
        SpectateButton.Position = UDim2.new(0.52, 0, 0, 30)
        SpectateButton.Text = "Spectate"
        SpectateButton.BackgroundColor3 = Color3.fromRGB(100, 150, 100)
        
        ViewButton.MouseButton1Click:Connect(function()
            clearEntityLogs()
            
            if entityAnimationListeners[entity.Name] then
                entityAnimationListeners[entity.Name]:Disconnect()
            end
            
            entityAnimationListeners[entity.Name] = entity.Animator.AnimationPlayed:Connect(function(track)
                if track and track.Animation then
                    local animId = track.Animation.AnimationId:match("rbxassetid://(%d+)")
                    if animId then
                        local fullId = "rbxassetid://" .. animId
                        addToEntityLogs(fullId)
                        addToGlobalLog(fullId, entity.Name)
                    end
                end
            end)
            
            EntitiesFrame.Visible = false
            EntityLogsFrame.Visible = true
            BackButton.Visible = true
        end)
        
        SpectateButton.MouseButton1Click:Connect(function()
            spectateEntity(entity)
        end)
    end
    
    EntitiesFrame.CanvasSize = UDim2.new(0, 0, 0, EntitiesList.AbsoluteContentSize.Y)
end

-- Глобальный слушатель анимаций для всех существ
local function setupGlobalAnimationListener()
    -- Слушаем всех игроков
    for _, player in pairs(Players:GetPlayers()) do
        if player ~= LocalPlayer then
            local character = player.Character
            if character then
                local humanoid = character:FindFirstChildOfClass("Humanoid")
                local animator = humanoid and humanoid:FindFirstChildOfClass("Animator")
                if animator and not entityAnimationListeners["Global_" .. player.Name] then
                    entityAnimationListeners["Global_" .. player.Name] = animator.AnimationPlayed:Connect(function(track)
                        if track and track.Animation then
                            local animId = track.Animation.AnimationId:match("rbxassetid://(%d+)")
                            if animId then
                                local fullId = "rbxassetid://" .. animId
                                addToGlobalLog(fullId, player.Name)
                            end
                        end
                    end)
                end
            end
        end
    end
    
    -- Слушаем NPC
    for _, obj in pairs(workspace:GetDescendants()) do
        if obj:IsA("Humanoid") then
            local character = obj.Parent
            local animator = obj:FindFirstChildOfClass("Animator")
            
            local isPlayerCharacter = false
            for _, player in pairs(Players:GetPlayers()) do
                if player.Character == character then
                    isPlayerCharacter = true
                    break
                end
            end
            
            if animator and not isPlayerCharacter and not entityAnimationListeners["Global_NPC_" .. character.Name] then
                entityAnimationListeners["Global_NPC_" .. character.Name] = animator.AnimationPlayed:Connect(function(track)
                    if track and track.Animation then
                        local animId = track.Animation.AnimationId:match("rbxassetid://(%d+)")
                        if animId then
                            local fullId = "rbxassetid://" .. animId
                            addToGlobalLog(fullId, character.Name)
                        end
                    end
                end)
            end
        end
    end
end

-- Функция для воспроизведения анимации
local function playAnimation(animId)
    if isAnimationPlaying then
        return false, "Animation is already playing!"
    end
    
    local animation = Instance.new("Animation")
    animation.AnimationId = animId
    
    if Animator then
        currentTrack = Animator:LoadAnimation(animation)
        currentTrack.Looped = isLooping
        currentTrack:Play()
        isAnimationPlaying = true
        
        -- Запускаем таймер
        RunService.RenderStepped:Connect(function()
            if currentTrack and currentTrack.IsPlaying then
                updateTimer()
            end
        end)
        
        -- Ждем окончания анимации
        currentTrack.Stopped:Connect(function()
            isAnimationPlaying = false
            currentTrack = nil
            updateTimer()
        end)
        
        if not isLooping then
            currentTrack.Ended:Connect(function()
                isAnimationPlaying = false
                currentTrack = nil
                updateTimer()
            end)
        end
        
        return true, "Animation started!"
    end
    
    return false, "Animator not found!"
end

-- Переключение вкладок
LogTab.MouseButton1Click:Connect(function()
    MyLogsFrame.Visible = true
    EntitiesFrame.Visible = false
    EntityLogsFrame.Visible = false
    SavesFrame.Visible = false
    PlayFrame.Visible = false
    BackButton.Visible = false
end)

EntitiesTab.MouseButton1Click:Connect(function()
    MyLogsFrame.Visible = false
    EntitiesFrame.Visible = true
    EntityLogsFrame.Visible = false
    SavesFrame.Visible = false
    PlayFrame.Visible = false
    BackButton.Visible = false
    RefreshEntitiesList()
end)

SavesTab.MouseButton1Click:Connect(function()
    MyLogsFrame.Visible = false
    EntitiesFrame.Visible = false
    EntityLogsFrame.Visible = false
    SavesFrame.Visible = true
    PlayFrame.Visible = false
    BackButton.Visible = false
end)

PlayTab.MouseButton1Click:Connect(function()
    MyLogsFrame.Visible = false
    EntitiesFrame.Visible = false
    EntityLogsFrame.Visible = false
    SavesFrame.Visible = false
    PlayFrame.Visible = true
    BackButton.Visible = false
end)

BackButton.MouseButton1Click:Connect(function()
    EntitiesFrame.Visible = true
    EntityLogsFrame.Visible = false
    BackButton.Visible = false
end)

ExitSpectateButton.MouseButton1Click:Connect(function()
    exitSpectate()
end)

local isMinimized = false
MinimizeButton.MouseButton1Click:Connect(function()
    isMinimized = not isMinimized
    if isMinimized then
        LogTab.Visible = false
        EntitiesTab.Visible = false
        SavesTab.Visible = false
        PlayTab.Visible = false
        Frame.Visible = false
    else
        LogTab.Visible = true
        EntitiesTab.Visible = true
        SavesTab.Visible = true
        PlayTab.Visible = true
        Frame.Visible = true
    end
    MinimizeButton.Text = isMinimized and "+" or "-"
end)

CloseButton.MouseButton1Click:Connect(function()
    if currentHighlight then
        currentHighlight:Destroy()
    end
    if cameraConnection then
        cameraConnection:Disconnect()
    end
    ScreenGui:Destroy()
end)

-- Логирование анимаций локального игрока
if Animator then
    Animator.AnimationPlayed:Connect(function(track)
        if track and track.Animation then
            local animId = track.Animation.AnimationId:match("rbxassetid://(%d+)")
            if animId then
                local fullId = "rbxassetid://" .. animId
                addToLogs(MyLogsFrame, MyLogsList, fullId, "You")
                addToGlobalLog(fullId, "You")
            end
        end
    end)
end

-- Обработчики кнопок
PlayButton.MouseButton1Click:Connect(function()
    local animId = TextBox.Text:match("%d+")
    if animId then
        local fullId = "rbxassetid://" .. animId
        local success, message = playAnimation(fullId)
        if not success then
            TimerLabel.Text = message
            task.wait(2)
            updateTimer()
        end
    end
end)

LoopToggle.MouseButton1Click:Connect(function()
    isLooping = not isLooping
    LoopToggle.Text = "Loop: " .. (isLooping and "ON" or "OFF")
    if currentTrack then
        currentTrack.Looped = isLooping
    end
end)

FreezeToggle.MouseButton1Click:Connect(function()
    isFrozen = not isFrozen
    FreezeToggle.Text = "Freeze: " .. (isFrozen and "ON" or "OFF")
    
    if currentTrack then
        if isFrozen then
            frozenTime = currentTrack.TimePosition
            currentTrack:Stop()
        else
            currentTrack:Play()
            currentTrack.TimePosition = frozenTime
        end
    end
end)

StopButton.MouseButton1Click:Connect(function()
    if currentTrack then
        currentTrack:Stop()
        isAnimationPlaying = false
        currentTrack = nil
        updateTimer()
    end
end)

-- Запускаем глобальный слушатель
setupGlobalAnimationListener()

-- Автообновление списка существ и глобального слушателя
local function AutoUpdate()
    while ScreenGui.Parent do
        task.wait(5)
        if EntitiesFrame.Visible then
            RefreshEntitiesList()
        end
        setupGlobalAnimationListener()
    end
end

coroutine.wrap(AutoUpdate)()

-- Слушаем новых игроков
Players.PlayerAdded:Connect(function(player)
    task.wait(2)
    setupGlobalAnimationListener()
end)

-- Слушаем появление новых персонажей
LocalPlayer.CharacterAdded:Connect(function(newChar)
    Character = newChar
    Humanoid = Character:FindFirstChildOfClass("Humanoid")
    Animator = Humanoid and Humanoid:FindFirstChildOfClass("Animator")
    
    if Animator then
        Animator.AnimationPlayed:Connect(function(track)
            if track and track.Animation then
                local animId = track.Animation.AnimationId:match("rbxassetid://(%d+)")
                if animId then
                    local fullId = "rbxassetid://" .. animId
                    addToLogs(MyLogsFrame, MyLogsList, fullId, "You")
                    addToGlobalLog(fullId, "You")
                end
            end
        end)
    end
end)

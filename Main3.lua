local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local Character = LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()
local Humanoid = Character:FindFirstChildOfClass("Humanoid")
local Animator = Humanoid and Humanoid:FindFirstChildOfClass("Animator")
local RunService = game:GetService("RunService")
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
SavesFrame.ScrollBarThickness = 5
SavesFrame.Visible = false
SavesFrame.BackgroundTransparency = 1

-- Контейнер для кнопок (внутри ScrollingFrame, но не скроллится)
local ButtonContainer = Instance.new("Frame", SavesFrame)
ButtonContainer.Size = UDim2.new(1, 0, 0, 40)
ButtonContainer.BackgroundColor3 = Color3.fromRGB(80, 80, 80)
ButtonContainer.BorderSizePixel = 0

local CopyAllButton = Instance.new("TextButton", ButtonContainer)
CopyAllButton.Size = UDim2.new(0.5, -5, 1, -10)
CopyAllButton.Position = UDim2.new(0, 5, 0, 5)
CopyAllButton.Text = "Copy All IDs"
CopyAllButton.BackgroundColor3 = Color3.fromRGB(70, 130, 200)
CopyAllButton.TextColor3 = Color3.new(1, 1, 1)

local ClearAllButton = Instance.new("TextButton", ButtonContainer)
ClearAllButton.Size = UDim2.new(0.5, -5, 1, -10)
ClearAllButton.Position = UDim2.new(0.5, 0, 0, 5)
ClearAllButton.Text = "Clear All"
ClearAllButton.BackgroundColor3 = Color3.fromRGB(200, 70, 70)
ClearAllButton.TextColor3 = Color3.new(1, 1, 1)

-- Контейнер для списка анимаций
local SavesContent = Instance.new("Frame", SavesFrame)
SavesContent.Size = UDim2.new(1, 0, 1, -40)
SavesContent.Position = UDim2.new(0, 0, 0, 40)
SavesContent.BackgroundTransparency = 1

local SavesList = Instance.new("UIListLayout", SavesContent)
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

local StopButton = Instance.new("TextButton", PlayFrame)
StopButton.Size = UDim2.new(1, -20, 0, 30)
StopButton.Position = UDim2.new(0, 10, 0, 130)
StopButton.Text = "Stop Animation"
StopButton.BackgroundColor3 = Color3.fromRGB(150, 50, 50)

-- Exit Spectate Button
local ExitSpectateButton = Instance.new("TextButton", ScreenGui)
ExitSpectateButton.Size = UDim2.new(0, 100, 0, 40)
ExitSpectateButton.Position = UDim2.new(1, -110, 1, -50)
ExitSpectateButton.Text = "Exit Spectate"
ExitSpectateButton.BackgroundColor3 = Color3.fromRGB(200, 50, 50)
ExitSpectateButton.TextColor3 = Color3.new(1, 1, 1)
ExitSpectateButton.Visible = false
ExitSpectateButton.ZIndex = 10

-- Spectate Info Panel
local SpectateInfoPanel = Instance.new("Frame", ScreenGui)
SpectateInfoPanel.Size = UDim2.new(0, 300, 0, 120)
SpectateInfoPanel.Position = UDim2.new(0, 10, 0, 10)
SpectateInfoPanel.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
SpectateInfoPanel.BackgroundTransparency = 0.3
SpectateInfoPanel.Visible = false
SpectateInfoPanel.ZIndex = 10

local SpectateNameLabel = Instance.new("TextLabel", SpectateInfoPanel)
SpectateNameLabel.Size = UDim2.new(1, 0, 0, 30)
SpectateNameLabel.Position = UDim2.new(0, 5, 0, 5)
SpectateNameLabel.Text = "Spectating: "
SpectateNameLabel.TextColor3 = Color3.new(1, 1, 1)
SpectateNameLabel.TextXAlignment = Enum.TextXAlignment.Left
SpectateNameLabel.BackgroundTransparency = 1
SpectateNameLabel.Font = Enum.Font.GothamBold
SpectateNameLabel.TextSize = 14

local SpectateHealthLabel = Instance.new("TextLabel", SpectateInfoPanel)
SpectateHealthLabel.Size = UDim2.new(1, 0, 0, 25)
SpectateHealthLabel.Position = UDim2.new(0, 5, 0, 40)
SpectateHealthLabel.Text = "Health: "
SpectateHealthLabel.TextColor3 = Color3.fromRGB(255, 100, 100)
SpectateHealthLabel.TextXAlignment = Enum.TextXAlignment.Left
SpectateHealthLabel.BackgroundTransparency = 1
SpectateHealthLabel.TextSize = 12

local SpectateSpeedLabel = Instance.new("TextLabel", SpectateInfoPanel)
SpectateSpeedLabel.Size = UDim2.new(1, 0, 0, 25)
SpectateSpeedLabel.Position = UDim2.new(0, 5, 0, 65)
SpectateSpeedLabel.Text = "Walk Speed: "
SpectateSpeedLabel.TextColor3 = Color3.fromRGB(100, 255, 100)
SpectateSpeedLabel.TextXAlignment = Enum.TextXAlignment.Left
SpectateSpeedLabel.BackgroundTransparency = 1
SpectateSpeedLabel.TextSize = 12

local SpectateAnimLabel = Instance.new("TextLabel", SpectateInfoPanel)
SpectateAnimLabel.Size = UDim2.new(1, 0, 0, 25)
SpectateAnimLabel.Position = UDim2.new(0, 5, 0, 90)
SpectateAnimLabel.Text = "Current Animation: None"
SpectateAnimLabel.TextColor3 = Color3.fromRGB(255, 255, 100)
SpectateAnimLabel.TextXAlignment = Enum.TextXAlignment.Left
SpectateAnimLabel.BackgroundTransparency = 1
SpectateAnimLabel.TextSize = 12
SpectateAnimLabel.TextWrapped = true

-- Хранилище данных
local animationCounts = {} -- {[animationId] = count}
local animationRows = {} -- {[animationId] = row}
local entityAnimationListeners = {} -- {[entityName] = connection}
local currentEntityLogs = {} -- {animationId = {count, label}}
local isAnimationPlaying = false
local currentTrack = nil
local isLooping = false
local currentSpectateTarget = nil
local currentHighlight = nil
local currentAnimConnection = nil

-- Функция для обновления CanvasSize
local function updateSavesCanvas()
    SavesFrame.CanvasSize = UDim2.new(0, 0, 0, SavesList.AbsoluteContentSize.Y + 40)
end

-- Функция для добавления анимации в глобальные логи (LoggerSaves)
local function addToSaves(animationId, sourceName)
    if not animationCounts[animationId] then
        animationCounts[animationId] = 0
    end
    animationCounts[animationId] = animationCounts[animationId] + 1
    
    -- Обновляем или создаем элемент
    if animationRows[animationId] then
        local countLabel = animationRows[animationId]:FindFirstChild("Count")
        if countLabel then
            countLabel.Text = "[" .. animationCounts[animationId] .. "]"
        end
    else
        local AnimRow = Instance.new("Frame", SavesContent)
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
        
        animationRows[animationId] = AnimRow
    end
    
    updateSavesCanvas()
end

-- Функция для очистки всех сохраненных анимаций
local function clearAllSaves()
    animationCounts = {}
    for _, row in pairs(animationRows) do
        row:Destroy()
    end
    animationRows = {}
    updateSavesCanvas()
end

-- Функция для копирования всех ID
local function copyAllIds()
    local ids = {}
    for animId, _ in pairs(animationCounts) do
        table.insert(ids, animId)
    end
    local allIds = table.concat(ids, ";")
    setclipboard(allIds)
end

-- Подключаем кнопки
CopyAllButton.MouseButton1Click:Connect(function()
    copyAllIds()
end)

ClearAllButton.MouseButton1Click:Connect(function()
    clearAllSaves()
end)

-- Функция для добавления анимации в логи (локальные)
local function addToMyLogs(animationId, sourceName)
    local AnimRow = Instance.new("Frame", MyLogsFrame)
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
    
    MyLogsFrame.CanvasSize = UDim2.new(0, 0, 0, MyLogsList.AbsoluteContentSize.Y)
end

-- Функция для добавления анимации в глобальный лог
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

-- Остальные функции (spectate, entities, etc.) остаются без изменений...
-- [Здесь вставьте остальные функции из предыдущего скрипта, но без изменений]

-- Для краткости, остальные функции (spectate, entities, play) остаются теми же
-- Вставьте сюда все функции из предыдущего скрипта начиная с updateSpectateInfo и до конца

-- Функция для обновления информации о спекте
local function updateSpectateInfo()
    if currentSpectateTarget then
        local target = currentSpectateTarget
        local targetChar = target.Character or (target:IsA("Model") and target)
        
        if targetChar then
            local humanoid = targetChar:FindFirstChildOfClass("Humanoid")
            if humanoid then
                local health = math.floor(humanoid.Health)
                local maxHealth = humanoid.MaxHealth
                local walkSpeed = math.floor(humanoid.WalkSpeed)
                
                SpectateHealthLabel.Text = "Health: " .. health .. " / " .. maxHealth
                SpectateSpeedLabel.Text = "Walk Speed: " .. walkSpeed
            end
        end
        
        SpectateNameLabel.Text = "Spectating: " .. (target.Name or "Unknown")
    end
end

-- Функция для обновления текущей анимации
local function updateCurrentAnimation(animId)
    if animId then
        local animIdNum = animId:match("rbxassetid://(%d+)")
        SpectateAnimLabel.Text = "Current Animation: " .. (animIdNum or "Unknown")
    else
        SpectateAnimLabel.Text = "Current Animation: None"
    end
end

-- Функция для спекта
local function spectateEntity(target)
    if currentSpectateTarget == target then return end
    
    if currentSpectateTarget then
        if currentHighlight then
            currentHighlight:Destroy()
            currentHighlight = nil
        end
        if currentAnimConnection then
            currentAnimConnection:Disconnect()
            currentAnimConnection = nil
        end
        SpectateInfoPanel.Visible = false
    end
    
    currentSpectateTarget = target
    
    local targetChar = target.Character or (target:IsA("Model") and target)
    if targetChar then
        currentHighlight = Instance.new("Highlight")
        currentHighlight.Adornee = targetChar
        currentHighlight.FillColor = Color3.fromRGB(255, 255, 255)
        currentHighlight.FillTransparency = 0.5
        currentHighlight.OutlineColor = Color3.fromRGB(255, 255, 255)
        currentHighlight.OutlineTransparency = 0
        currentHighlight.Parent = ScreenGui
        
        local humanoid = targetChar:FindFirstChildOfClass("Humanoid")
        if humanoid then
            local animator = humanoid:FindFirstChildOfClass("Animator")
            if animator then
                currentAnimConnection = animator.AnimationPlayed:Connect(function(track)
                    if track and track.Animation then
                        local animId = track.Animation.AnimationId
                        updateCurrentAnimation(animId)
                    end
                end)
            end
        end
    end
    
    SpectateInfoPanel.Visible = true
    updateSpectateInfo()
    
    local infoConnection
    infoConnection = RunService.RenderStepped:Connect(function()
        if currentSpectateTarget then
            updateSpectateInfo()
        else
            infoConnection:Disconnect()
        end
    end)
    
    if targetChar and targetChar:FindFirstChild("HumanoidRootPart") then
        Camera.CameraType = Enum.CameraType.Scriptable
        local hrp = targetChar.HumanoidRootPart
        Camera.CFrame = CFrame.new(hrp.Position + Vector3.new(0, 2, 5)) * CFrame.Angles(0, math.rad(180), 0)
        
        local mouse = LocalPlayer:GetMouse()
        local cameraConnection = RunService.RenderStepped:Connect(function()
            if currentSpectateTarget and targetChar and targetChar.Parent then
                local hrp = targetChar.HumanoidRootPart
                if hrp then
                    local cameraOffset = CFrame.new(hrp.Position) * CFrame.Angles(0, mouse.ViewSizeX / 100, 0)
                    Camera.CFrame = cameraOffset * CFrame.new(0, 2, 5)
                end
            end
        end)
        
        table.insert(entityAnimationListeners, cameraConnection)
    end
    
    ExitSpectateButton.Visible = true
end

-- Функция для выхода из спекта
local function exitSpectate()
    if currentHighlight then
        currentHighlight:Destroy()
        currentHighlight = nil
    end
    if currentAnimConnection then
        currentAnimConnection:Disconnect()
        currentAnimConnection = nil
    end
    currentSpectateTarget = nil
    ExitSpectateButton.Visible = false
    SpectateInfoPanel.Visible = false
    
    Camera.CameraType = Enum.CameraType.Custom
    if Character and Character:FindFirstChild("HumanoidRootPart") then
        local hrp = Character.HumanoidRootPart
        Camera.CFrame = CFrame.new(hrp.Position + Vector3.new(0, 2, 5))
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
        
        currentTrack.Stopped:Connect(function()
            isAnimationPlaying = false
            currentTrack = nil
        end)
        
        if not isLooping then
            currentTrack.Ended:Connect(function()
                isAnimationPlaying = false
                currentTrack = nil
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
    exitSpectate()
    ScreenGui:Destroy()
end)

-- Логирование анимаций локального игрока
if Animator then
    Animator.AnimationPlayed:Connect(function(track)
        if track and track.Animation then
            local animId = track.Animation.AnimationId:match("rbxassetid://(%d+)")
            if animId then
                local fullId = "rbxassetid://" .. animId
                addToMyLogs(fullId, "You")
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
            print(message)
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

StopButton.MouseButton1Click:Connect(function()
    if currentTrack then
        currentTrack:Stop()
        isAnimationPlaying = false
        currentTrack = nil
    end
end)

-- Запускаем глобальный слушатель
setupGlobalAnimationListener()

-- Автообновление
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

Players.PlayerAdded:Connect(function(player)
    task.wait(2)
    setupGlobalAnimationListener()
end)

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
                    addToMyLogs(fullId, "You")
                    addToGlobalLog(fullId, "You")
                end
            end
        end)
    end
end)

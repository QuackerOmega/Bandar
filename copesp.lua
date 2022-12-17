-- quacker's super amazing police detector 9000

local camera = workspace.CurrentCamera
local clr = Color3.new(1, 0, 0)
local clr2 = Color3.new(1,0,1)


function DrawDrop(drop)
    local DropText = Drawing.new("Text")
    DropText.Visible = false
    DropText.Center = true
    DropText.Outline = false
    DropText.Font = 1
    DropText.Size = 20
    DropText.Color = clr

    local box = Drawing.new("Square")
    box.Visible = true
    box.Thickness = 3
    box.Size = Vector2.new(15,15)
    box.Filled = true
    box.Color = clr
    box.Transparency = .7

    local function UPDATER()
        game:GetService("RunService").RenderStepped:Connect(function()
            if drop and workspace:FindFirstChild(drop.Name) and drop:FindFirstChild("DriveSeat") then
                if drop.DriveSeat then
                DropText.Text = drop.Name .. " | Dist : ".. tostring(math.floor(game.Players.LocalPlayer:DistanceFromCharacter(drop.DriveSeat.CFrame.Position)+0.5))
                local dropvector, onscreen = camera:WorldToViewportPoint(drop.DriveSeat.Position)

                if onscreen then
                    DropText.Position = Vector2.new(dropvector.X, dropvector.Y)
                    box.Position = Vector2.new(dropvector.X-10, dropvector.Y+ -10)
                    box.Visible = true
                    DropText.Visible = true
                else
                    DropText.Visible = false
                    box.Visible = false

                end
                end
            else
                DropText.Visible = false
                box.Visible = false

            end
        end)
    end
    coroutine.wrap(UPDATER)()
end

function ddc(drop)
    local DropText = Drawing.new("Text")
    DropText.Visible = false
    DropText.Center = true
    DropText.Outline = false
    DropText.Font = 1
    DropText.Size = 20
    DropText.Color = clr2

    local box = Drawing.new("Square")
    box.Visible = true
    box.Thickness = 3
    box.Size = Vector2.new(15,15)
    box.Filled = true
    box.Color = clr2
    box.Transparency = .7

    local function upd()
        game:GetService("RunService").RenderStepped:Connect(function()
            
            if drop and game.Players:FindFirstChild(drop.Name) and drop.Character:FindFirstChild("Head") then
                if drop.Character.Head then
                DropText.Text = drop.Name .. " | Dist : ".. tostring(math.floor(game.Players.LocalPlayer:DistanceFromCharacter(drop.Character.Head.CFrame.Position)+0.5))
                local dropvector, onscreen = camera:WorldToViewportPoint(drop.Character.Head.Position)

                if onscreen then
                    DropText.Position = Vector2.new(dropvector.X, dropvector.Y)
                    box.Position = Vector2.new(dropvector.X-10, dropvector.Y+ -10)
                    box.Visible = true
                    DropText.Visible = true
                else
                    DropText.Visible = false
                    box.Visible = false

                end
                end
            else
                DropText.Visible = false
                box.Visible = false

            end
        end)
    end
    coroutine.wrap(upd)()
end


-- cop players
local tagged = {}

    for i,v in next, game.Players:GetPlayers() do
        if v.Team.Name == "Polis DiRaja Malaysia" or v.Team.Name == "Polis Bantuan MyTransit" then
            ddc(v)
        end 
    end

    game:GetService("RunService").RenderStepped:Connect(function()
        for i,drop in next, game.Players:GetPlayers() do
            if drop ~= game.Players.LocalPlayer then
                if drop.Team.Name == "Polis DiRaja Malaysia" or drop.Team.Name == "Polis Bantuan MyTransit" then
                    for i,v in next, tagged do
                        if drop.Name ~= v then    
                        ddc(drop)
                        table.insert(tagged,drop.Name)
                        end
                    end
                end
            end
        end
    end)


    -- cop cars
    for i,v in next, workspace:GetChildren() do
        if v:FindFirstChild("A-Chassis Tune") and v:FindFirstChild("Superior") then
            DrawDrop(v)
        end
    end

    game:GetService("Workspace").ChildAdded:Connect(function(drop)
        if drop:FindFirstChild("A-Chassis Tune") and drop:FindFirstChild("Superior") then
        DrawDrop(drop)
        end
    end)

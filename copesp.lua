-- quacker's super amazing police detector 9000

local camera = workspace.CurrentCamera
local clr = Color3.new(1, 0, 0)
local clr2 = Color3.new(1,0,1)


function Drawcop(cop)
    local copText = Drawing.new("Text")
    copText.Visible = false
    copText.Center = true
    copText.Outline = false
    copText.Font = 1
    copText.Size = 20
    copText.Color = clr

    local box = Drawing.new("Square")
    box.Visible = true
    box.Thickness = 3
    box.Size = Vector2.new(15,15)
    box.Filled = true
    box.Color = clr
    box.Transparency = .7

    local function UPDATER()
        game:GetService("RunService").RenderStepped:Connect(function()
            if cop and workspace:FindFirstChild(cop.Name) and cop:FindFirstChild("DriveSeat") and cop:FindFirstChild("Superior") then
                if cop.DriveSeat then
                copText.Text = cop.Name .. " | Dist : ".. tostring(math.floor(game.Players.LocalPlayer:DistanceFromCharacter(cop.DriveSeat.CFrame.Position)+0.5))
                local copvector, onscreen = camera:WorldToViewportPoint(cop.DriveSeat.Position)

                if onscreen then
                    copText.Position = Vector2.new(copvector.X, copvector.Y)
                    box.Position = Vector2.new(copvector.X-10, copvector.Y+ -10)
                    box.Visible = true
                    copText.Visible = true
                else
                    copText.Visible = false
                    box.Visible = false

                end
                end
            else
                copText.Visible = false
                box.Visible = false

            end
        end)
    end
    coroutine.wrap(UPDATER)()
end

function ddc(cop)
    local copText = Drawing.new("Text")
    copText.Visible = false
    copText.Center = true
    copText.Outline = false
    copText.Font = 1
    copText.Size = 20
    copText.Color = clr2

    local box = Drawing.new("Square")
    box.Visible = true
    box.Thickness = 3
    box.Size = Vector2.new(15,15)
    box.Filled = true
    box.Color = clr2
    box.Transparency = .7

    local function upd()
        game:GetService("RunService").RenderStepped:Connect(function()
            
            if cop and game.Players:FindFirstChild(cop.Name) and cop.Character:FindFirstChild("Head") then
                if cop.Character.Head and cop.Team.Name == "Polis DiRaja Malaysia" or cop.Team.Name == "Polis Bantuan MyTransit" then
                copText.Text = cop.Name .. " | Dist : ".. tostring(math.floor(game.Players.LocalPlayer:DistanceFromCharacter(cop.Character.Head.CFrame.Position)+0.5))
                local copvector, onscreen = camera:WorldToViewportPoint(cop.Character.Head.Position)

                if onscreen then
                    copText.Position = Vector2.new(copvector.X, copvector.Y)
                    box.Position = Vector2.new(copvector.X-10, copvector.Y+ -10)
                    box.Visible = true
                    copText.Visible = true
                else
                    copText.Visible = false
                    box.Visible = false

                end
                end
            else
                copText.Visible = false
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
        table.insert(tagged,v.Name)
    end 
end

game.Players.PlayerAdded:Connect(function(v)
    v.CharacterAdded:Connect(function()
        if v.Team.Name == "Polis DiRaja Malaysia" or v.Team.Name == "Polis Bantuan MyTransit" then
            for g,b in next, tagged do
                if v.Name ~= b then
                    ddc(v)
                    table.insert(tagged,v.Name)
                end
            end
        end
    end)
end)


    -- cop cars
    for i,v in next, workspace:GetChildren() do
        if v:FindFirstChild("A-Chassis Tune") and v:FindFirstChild("Superior") then
            Drawcop(v)
        end
    end

    game:GetService("Workspace").ChildAdded:Connect(function(cop)
        wait(1)
        if cop and workspace:FindFirstChild(cop.Name) and cop:FindFirstChild("DriveSeat") and cop:FindFirstChild("Superior") then
            Drawcop(cop)
        end
    end)

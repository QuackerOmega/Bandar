game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(44129, 4.5, 1205, -1, 5.64704088e-08, -2.79479497e-08, 5.64704088e-08, 1, -2.43488341e-08, 2.79479497e-08, -2.43488358e-08, -1)
wait(1)
local args = {
    [1] = "Perodua Myvi",
    [2] = false,
    [3] = game.Players.LocalPlayer.Character.Head,
    [4] = "Spawn"
}

game:GetService("ReplicatedStorage").VehicleSpawner.SpawnFunction:InvokeServer(unpack(args))
wait(5)

for index, value in pairs(getconnections(game:GetService("Players").LocalPlayer.Idled)) do
    value:Disable()
end
    local num = 2
    local idlepos = num
    while getgenv().farm do
        if not getgenv().farm then break end
        local Character = game:GetService("Players").LocalPlayer.Character
        if Character then
            local VehicleSeat = Character:FindFirstChildWhichIsA("Humanoid").SeatPart
            if VehicleSeat and typeof(VehicleSeat) == "Instance" and VehicleSeat:IsA("VehicleSeat") then
                if idlepos >= num then
                    local Vehicle = VehicleSeat:FindFirstAncestorWhichIsA("Model")
                    Character.Parent = Vehicle
                    Vehicle:MoveTo(Vector3.new(44048, 3, 1072))
                    Character.Parent = workspace
                    idlepos = 0
                end
                task.wait()
                local Vehicle = VehicleSeat:FindFirstAncestorWhichIsA("Model")
                Character.Parent = Vehicle
                Vehicle:MoveTo(Vector3.new(-50726, 3, 1496))
                Character.Parent = workspace        
            end
        end
        task.synchronize()
        idlepos = idlepos + 1
        task.desynchronize()
        task.wait(0)
    end

local deathPosition = nil

local function showNotification(title, text, duration)
    game.StarterGui:SetCore("SendNotification", {
        Title = title;
        Text = text;
        Duration = duration or 3;
    })
end

showNotification("@likelywet", "but it refused 2.0 [execute again]", 3)

game.Players.LocalPlayer.CharacterAdded:Connect(function(character)
    local humanoid = character:WaitForChild("Humanoid")
    humanoid.Died:Connect(function()
        if deathPosition == nil then 
            local rootPart = character:FindFirstChild("HumanoidRootPart")
            if rootPart then
                deathPosition = rootPart.Position 
                showNotification("@likelywet", "But it refused.", 3) 
            end
        end
    end)
end)

game.Players.LocalPlayer.CharacterAdded:Connect(function(character)
    character:WaitForChild("HumanoidRootPart") 
    if deathPosition then
        wait(0.1) 
        character.HumanoidRootPart.CFrame = CFrame.new(deathPosition)
        deathPosition = nil 
    end
end)

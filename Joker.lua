-- JokerHub | Steal a Brainrot Edition
local Fluent = loadstring(game:HttpGet("https://github.com/dawid-scripts/Fluent/releases/latest/download/main.lua"))()

local Window = Fluent:CreateWindow({
    Title = "JokerHub | Steal a Brainrot",
    SubTitle = "v2.0 - Ultimate Edition",
    TabWidth = 160,
    Size = UDim2.fromOffset(580, 460),
    Theme = "Darker"
})

local Tabs = {
    Main = Window:AddTab({ Title = "Main / Protection", Icon = "shield" }),
    Combat = Window:AddTab({ Title = "Combat / Hitbox", Icon = "swords" }),
    Movement = Window:AddTab({ Title = "Movement", Icon = "zap" })
}

local Options = Fluent.Options

---------------------------------------------------------
-- ANTI-DIE & GODMODE
---------------------------------------------------------
Tabs.Main:AddSection("Safety & Protection")

local GodMode = Tabs.Main:AddToggle("GodMode", {Title = "Anti-Die Guard", Default = false})
GodMode:OnChanged(function()
    task.spawn(function()
        while Options.GodMode.Value do
            task.wait(0.1)
            pcall(function()
                local char = game.Players.LocalPlayer.Character
                if char and char:FindFirstChild("Humanoid") then
                    if char.Humanoid.Health < 25 then
                        char.Humanoid.Health = char.Humanoid.MaxHealth
                    end
                end
            end)
        end
    end)
end)

---------------------------------------------------------
-- COMBAT & HITBOX
---------------------------------------------------------
Tabs.Combat:AddSection("PVP Enhancements")

local HitboxToggle = Tabs.Combat:AddToggle("HitboxToggle", {Title = "Hitbox Extender", Default = false})
local HitboxSize = Tabs.Combat:AddSlider("HitboxSize", {
    Title = "Hitbox Size",
    Default = 5,
    Min = 1,
    Max = 20,
    Rounding = 1
})

HitboxToggle:OnChanged(function()
    task.spawn(function()
        while Options.HitboxToggle.Value do
            task.wait(0.5)
            pcall(function()
                for _, player in pairs(game.Players:GetPlayers()) do
                    if player ~= game.Players.LocalPlayer and player.Character and player.Character:FindFirstChild("HumanoidRootPart") then
                        local hrp = player.Character.HumanoidRootPart
                        hrp.Size = Vector3.new(Options.HitboxSize.Value, Options.HitboxSize.Value, Options.HitboxSize.Value)
                        hrp.Transparency = 0.7
                        hrp.BrickColor = BrickColor.new("Really red")
                        hrp.CanCollide = false
                    end
                end
            end)
        end
    end)
end)

---------------------------------------------------------
-- MOVEMENT
---------------------------------------------------------
Tabs.Movement:AddSection("Speed")

local Speed = Tabs.Movement:AddSlider("Speed", { Title = "WalkSpeed", Default = 16, Min = 16, Max = 120, Rounding = 0 })
Speed:OnChanged(function(Value)
    if game.Players.LocalPlayer.Character and game.Players.LocalPlayer.Character:FindFirstChild("Humanoid") then
        game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = Value
    end
end)

Fluent:Notify({ Title = "JokerHub", Content = "Incarcat cu succes!", Duration = 3 })

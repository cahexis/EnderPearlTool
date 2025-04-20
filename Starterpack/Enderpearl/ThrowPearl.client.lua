
local UserInputService = game:GetService("UserInputService")
local Player = game.Players.LocalPlayer
local tool = script.Parent
local mouse = Player:GetMouse()
local rep = game:GetService("ReplicatedStorage")
local remote = rep.PearlTeleport
local camera = workspace.CurrentCamera
local startpos = Vector3.new()

tool.Equipped:Connect(function() --when tool equipped
	tool.Activated:Connect(function(plr)
		local campos = camera.CFrame
		remote:FireServer(campos, tool)
	end)
end)

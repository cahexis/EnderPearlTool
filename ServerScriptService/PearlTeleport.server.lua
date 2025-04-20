local rep = game:GetService("ReplicatedStorage")
local remote = rep.PearlTeleport
local particles = rep.PearlParticles
remote.OnServerEvent:Connect(function(plr, campos, tool)
	local particlez = rep.PearlParticles:Clone()
	local char = plr.Character
	local root = char:WaitForChild("HumanoidRootPart")
	local head = char:WaitForChild("Head")
	local startpos = head.CFrame * Vector3.new(0,1,0)
	local pearlclone = rep.Pearl:Clone()
	pearlclone.Throworb:Play()
	pearlclone.Parent = game.Workspace
	
	pearlclone.AssemblyLinearVelocity = campos.lookVector*100
	pearlclone.CFrame = CFrame.new(startpos, campos.lookVector*100)
	
	local function TempParticles()
		particlez.Parent = workspace

		wait(3)
		particlez:Destroy()
	end

	
	pearlclone.Touched:Connect(function(hit)
		if hit:IsA("Part") and hit.Name ~= "DT" then
			char:MoveTo(Vector3.new(pearlclone.Position.X, pearlclone.Position.Y, pearlclone.Position.Z))			
			particlez.CFrame = pearlclone.CFrame
			pearlclone:Destroy()
			TempParticles()
		end
	end)
	tool:Destroy()
end)

if (Photon2.ReloadComponentFile()) then return end
local COMPONENT = Photon2.LibraryComponent()
local sequence = Photon2.SequenceBuilder.New

COMPONENT.Author = "Rin Hoshizora"

COMPONENT.Credits = {
	Model = "Mighters",
	Code = "Rin Hoshizora"
}

COMPONENT.Title = [[Whelen 400 Lake Rin EMS]]
COMPONENT.Category = "Perimeter"
COMPONENT.Model = "models/supermighty/photon/whelen_400_series_grille.mdl"

COMPONENT.States = {
	[1] = "R",
}

local s = 1.6

COMPONENT.Templates = {
	["2D"] = {
		main = {
			Shape = PhotonMaterial.GenerateLightQuad("photon/lights/whe_lib_shape.png").MaterialName,
			Detail = PhotonMaterial.GenerateLightQuad("photon/lights/whe_lib_detail.png").MaterialName,
			Width = 10.5,
			Height = 4.45,
			Ratio = .4,
			Scale = .4,
			ForwardVisibilityOffset = -0.1,
			ForwardBloomOffset = 0.1,
			-- LightMatrix = { Vector(s, 0, 0), Vector(-s, 0, 0),  },
			-- LightMatrixScaleMultiplier = 0.6
		},
	}
}

COMPONENT.StateMap = "[1] 1"

COMPONENT.Elements = {
	[1] = { "main", Vector(-1.5, 0, 0 ), Angle(0, 90, 0) },
	[2] = { "main", Vector(-1.5, 0, 2.3 ), Angle(0, 90, 0) },
}

COMPONENT.Segments = {
	["Light"] = {
		Frames = {
			[1] = "1 2",
			[2] = "1",
			[3] = "2",
		},
		Sequences = {
			["ON"] = {1},
			["STAGE1"] = { 1,1,1,1,0,0,0,0 },
			
			["STAGE3"] = { 2,2,2,2,3,3,3,3,2,2,2,2,3,3,3,3,
			               0,2,2,0,2,2,0,3,3,0,3,3,0,2,2,0,
						   2,2,0,3,3,0,3,3,0,2,2,2,2,3,3,3,
						   3,2,2,2,2,3,3,3,3,2,2,2,2,3,3,3,
						   3,2,2,2,2,3,3,3,3,0,2,0,2,0,3,0,
						   3,0,2,0,2,0,3,0,3,0,0,1,0,1,0,1,
						   0,0,0,0,1,0,1,0,1,0,0,0,0,1,0,1,
						   0,1,0,0,0,0,1,0,1,0,1,0,0,0,0, },

			["STAGE3B"] = { 3,3,3,3,2,2,2,2,3,3,3,3,2,2,2,2,
			               0,3,3,0,3,3,0,2,2,0,2,2,0,3,3,0,
						   3,3,0,2,2,0,2,2,0,3,3,3,3,2,2,2,
						   2,3,3,3,3,2,2,2,2,3,3,3,3,2,2,2,
						   2,3,3,3,3,2,2,2,2,0,3,0,3,0,2,0,
						   2,0,3,0,3,0,2,0,2,0,0,1,0,1,0,1,
						   0,0,0,0,1,0,1,0,1,0,0,0,0,1,0,1,
						   0,1,0,0,0,0,1,0,1,0,1,0,0,0,0, },			   
		}
	},
}

COMPONENT.Inputs = {
	["Emergency.Warning"] = {
		["MODE1"] = {
			Light = "STAGE1"
		},
		["MODE3"] = {
			Light = "STAGE3"
		}
	},
}
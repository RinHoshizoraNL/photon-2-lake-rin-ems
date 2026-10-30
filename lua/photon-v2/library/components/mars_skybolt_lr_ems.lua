if (Photon2.ReloadComponentFile()) then return end
local COMPONENT = Photon2.LibraryComponent()

COMPONENT.Author = "DatedGore"

COMPONENT.Credits = {
	Model = "SGM",
	Code = "DatedGore"
}

COMPONENT.Category = "Lightbar"
COMPONENT.PrintName = [[Mars Skybolt Lake Rin EMS]]

COMPONENT.Model = "models/sentry/props/skybolt.mdl"

local blue = { r = 0, g = 255, b = 255 }
local red = { r = 255, g = 64, b = 0 }
local amber = { r = 255, g = 100, b = 0 }

COMPONENT.ElementStates = {
	["Mesh"] = {
		["OFF"] = { Intensity = 0, IntensityTransitions = true },
		["~SW"] = { Inherit = "SW", IntensityTransitions = true },
		["~R"] = { 
			Intensity = 1,
			IntensityTransitions = true,
			BloomColor = PhotonColor( 255, 0, 0 ):Blend( red ):GetBlendColor(),
			DrawColor = PhotonColor( 255, 225, 100 ):Blend( red ):GetBlendColor(),
		},
		["~B"] = { 
			Intensity = 1,
			IntensityTransitions = true,
			BloomColor = PhotonColor( 0, 150, 255 ):Blend( blue ):GetBlendColor(),
			DrawColor = PhotonColor( 205, 255, 255 ):Blend( blue ):GetBlendColor(),
		},
		["~A"] = {
			Intensity = 1,
			IntensityTransitions = true, 
			BloomColor = PhotonColor( 255, 100, 0 ):Blend( amber ):GetBlendColor(),
			DrawColor = PhotonColor( 255, 200, 0 ):Blend( amber ):GetBlendColor(),
		},
	}
}

COMPONENT.Templates = {
	["Bone"] = {
		Rotator = {}
	},
	["2D"] = {
		Rotator_Main = {
			Shape = PhotonMaterial.GenerateLightQuad("photon/lights/anemolis_circular_src.png").MaterialName,
			Detail = PhotonMaterial.GenerateLightQuad("photon/lights/anemolis_circular_src.png").MaterialName,
			Width = 7.4,
			Height = 7.5,
			Ratio = 1,
			Scale = 1.4,
			ForwardVisibilityOffset = -.3,
			ForwardBloomOffset = .3,
			IntensityGainFactor = 4,
			IntensityLossFactor = 4,
			DeactivationState = "~OFF",
			-- LightMatrix = { Vector(s, 0, 0), Vector(-s, 0, 0),  },
			-- LightMatrixScaleMultiplier = 0.6
			States = {
				["~R"] = {
					Color = PhotonColor( 255, 48, 48 )
				},
			}
		}
	},
	["Projected"] = {
		Projected = {
			-- FOV = 120,
			HorizontalFOV = 45,
			VerticalFOV = 45,
			NearZ = 200,
			FarZ = 800,
			Brightness = 1,
			DeactivationState = "~OFF",
			-- TODO:
			-- This is required to prevent the lights from starting ON then fading off..?
			Intensity = 0,
			States = {
				["~R"] = {
					Color = PhotonColor( 255, 48, 48 )
				},
			}
		},
	}
}

COMPONENT.StateMap = "[ROT] 1 2 [R] 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20 21 22"

local fov = 180

COMPONENT.Elements = {
	[1] = { "Rotator", BoneId = 2, Axis = "z", Speed = 120, AngleOutputMap = { { 0, "~SW" }, { 45, "OFF" }, { 135, "R" }, { 225, "OFF" }, { 315, "R" } } },
	[2] = { "Rotator", BoneId = 1, Axis = "z", Speed = 120, AngleOutputMap = { { 0, "~R" }, { 45, "OFF" }, { 135, "R" }, { 225, "OFF" }, { 315, "R" } } },
	[3] = { "Rotator_Main", Vector(0, 0, 3.15), Angle(-90, -90, 0), BoneParent = 1, },
	[4] = { "Rotator_Main", Vector(0, 0, -3.15), Angle(90, 90, 0), BoneParent = 1, },
	[5] = { "Rotator_Main", Vector(0, 3.15, 0), Angle(0, 0, -90), BoneParent = 1, },
	[6] = { "Rotator_Main", Vector(0, -3.15, 0), Angle(180, 0, -90), BoneParent = 1, },
	[7] = { "Rotator_Main", Vector(0, 0, 3.15), Angle(-90, -90, 0), BoneParent = 2, },
	[8] = { "Rotator_Main", Vector(0, 0, -3.15), Angle(90, 90, 0), BoneParent = 2, },
	[9] = { "Rotator_Main", Vector(0, 3.15, 0), Angle(0, 0, -90), BoneParent = 2, },
	[10] = { "Rotator_Main", Vector(0, -3.15, 0), Angle(180, 0, -90), BoneParent = 2, },

	[11] = { "Projected", Vector(0, 0, 3.15), Angle(-90, -90, 0), BoneParent = 1, },
	[12] = { "Projected", Vector(0, 0, -3.15), Angle(90, 90, 0), BoneParent = 1, },
	[13] = { "Projected", Vector(0, 3.15, 0), Angle(0, 0, -90), BoneParent = 1, },
	[14] = { "Projected", Vector(0, -3.15, 0), Angle(180, 0, -90), BoneParent = 1, },
	[15] = { "Projected", Vector(0, 0, 3.15), Angle(-90, -90, 0), BoneParent = 2, },
	[16] = { "Projected", Vector(0, 0, -3.15), Angle(90, 90, 0), BoneParent = 2, },
	[17] = { "Projected", Vector(0, 3.15, 0), Angle(0, 0, -90), BoneParent = 2, },
	[18] = { "Projected", Vector(0, -3.15, 0), Angle(180, 0, -90), BoneParent = 2, },

	[19] = { "Rotator_Main", Vector(-9.3, 2.35, 9.5), Angle(0, 0, 0), },
	[20] = { "Rotator_Main", Vector(9.3, 2.35, 9.5), Angle(0, 0, 0), },
	[21] = { "Rotator_Main", Vector(-9.3, -2.55, 9.5), Angle(0, 180, 0), },
	[22] = { "Rotator_Main", Vector(9.3, -2.55, 9.5), Angle(0, 180, 0), },
}

local BoneLightMirror = {
	Light = 1,
	Peak = 112.65,
	FOV = 90
}

COMPONENT.ElementGroups = {
	-- Center
	["RC"] = { 1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18},
}

local sequence = Photon2.SequenceBuilder.New

COMPONENT.Segments = {
	Rotators = {
		Frames = {
			[1] = "RC"
		},
		Sequences = {
			ON = { 1 }
		}
	},
	Flashers = {
		Frames = {
			[0] = "[~OFF] 19 20 21 22",
			[1] = "[R] 19 21",
			[2] = "[R] 20 22",
			[3] = "[R] 19 20 21 22",
		},
		Sequences = {
			FLASH = sequence():Alternate( 1, 2, 10 ),
			ON = { 3 }
		}
	},
}

COMPONENT.Inputs = {
	["Emergency.Warning"] = {
		["MODE1"] = {
			Rotators = "ON",
			Flashers = "FLASH"
		},
		["MODE3"] = {
			Rotators = "ON",
			Flashers = "FLASH"
		}
	},
}
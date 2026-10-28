if (Photon2.ReloadComponentFile()) then return end
local COMPONENT = Photon2.LibraryComponent()
local sequence = Photon2.SequenceBuilder.New

COMPONENT.Author = "anemolis72"

COMPONENT.Credits = {
	Model = "GTA5",
	Code = "anemolis72"
}

COMPONENT.Title = [[Whelen 900 Halogen Lake Rin EMS]]
COMPONENT.Category = "Exterior"
COMPONENT.Model = "models/sentry/props/whelen900.mdl"

COMPONENT.States = {
	[1] = "~R",
}

local s = 1.6
local softWhite = { r = 255, g = 225, b = 225 }
local blue = { r = 0, g = 255, b = 255 }
local red = { r = 255, g = 64, b = 0 }
local amber = { r = 255, g = 100, b = 0 }

local swScale = 1
local bScale = 0.88
local rScale = 0.88
local aScale = 0.88

COMPONENT.Templates = {
	["2D"] = {
		main = {
			Shape = PhotonMaterial.GenerateLightQuad("retronyc/lights/whe_900_halo_shape.png").MaterialName,
			Detail = PhotonMaterial.GenerateLightQuad("retronyc/lights/whe_900_halo_detail.png").MaterialName,
			Width = 8.1,
			Height = 6.76,
			Scale = 0.85,
			IntensityGainFactor = 8,
			IntensityLossFactor = 4
		}
	}
}

COMPONENT.ElementStates = {
	["2D"] = {
		["~SW"] = {
			Intensity = 1,
			IntensityTransitions = true,
			Blend = Color( 255, 200, 200 ),
			SourceDetailColor = PhotonColor(255,255,255):Blend(softWhite):GetBlendColor(), 
			SubtractiveMid = PhotonColor( 0, 0, 255 ):Negative(true):Blend(softWhite):GetBlendColor(),
			SourceFillColor = PhotonColor( 255, 255, 255 ):Negative(false):Blend(softWhite):GetBlendColor(),
			GlowColor = PhotonColor(255*swScale, 255*swScale, 200*swScale):Negative(true):Blend(softWhite):GetBlendColor(),
			InnerGlowColor = PhotonColor(255*swScale, 175*swScale, 150*swScale):Blend(softWhite):GetBlendColor(),
			ShapeGlowColor = PhotonColor(255, 255, 255):Blend(softWhite):GetBlendColor()
		},
		["~R"] = {
			Intensity = 1,
			IntensityTransitions = true,
			Blend = PhotonColor( 255, 0, 0 ),
			SourceFillColor = PhotonColor( 255, 0, 0 ):Negative(true):Blend( red ):GetBlendColor(),
			GlowColor = PhotonColor( 255, 30, 0 ):Negative(true):Blend(red):Scale(0.6):GetBlendColor(),
			SubtractiveMid = PhotonColor( 255, 0, 0 ):Negative(true):Blend(red):Scale(0.6):GetBlendColor(),
			SourceDetailColor = PhotonColor( 255,250,190 ):Blend(red):GetBlendColor(), 
			InnerGlowColor = PhotonColor(255, 30, 0):Blend(red):Scale( rScale ):GetBlendColor(),
			ShapeGlowColor = PhotonColor(255, 30, 0):Blend(red):GetBlendColor()
		},
		["~B"] = {
			Intensity = 1,
			IntensityTransitions = true,
			Blend = PhotonColor( 0, 0, 255 ),
			-- inverted
			SourceFillColor = PhotonColor(0,0,255):Negative(true):Blend( blue ):GetBlendColor(),
			GlowColor = PhotonColor(0, 135, 255):Negative(true):Blend(blue):Scale(0.6):GetBlendColor(), 
			SubtractiveMid = PhotonColor( 0, 0, 255 ):Negative(true):Blend(blue):Scale(0.6):GetBlendColor(), 
			SourceDetailColor = PhotonColor(190,250,255):Blend(blue):GetBlendColor(), 
			InnerGlowColor = PhotonColor(0, 180, 255):Blend(blue):Scale( bScale ):GetBlendColor(),
			ShapeGlowColor = PhotonColor(0, 100, 255):Blend(blue):GetBlendColor()
		},
		["~A"] = {
			Intensity = 1,
			IntensityTransitions = true,
			Blend = PhotonColor( 255, 160, 0 ),
			SourceFillColor = PhotonColor( 255, 160, 0 ):Negative(true):Blend( amber ):GetBlendColor(),
			GlowColor = PhotonColor( 200, 110, 0 ):Negative(true):Blend(amber):Scale(0.6):GetBlendColor(),
			SubtractiveMid = PhotonColor( 255, 150, 0 ):Negative(true):Blend(amber):Scale(0.6):GetBlendColor(),
			SourceDetailColor = PhotonColor( 130,255,230):Blend(amber):GetBlendColor(), 
			InnerGlowColor = PhotonColor(200, 110, 0):Blend(amber):Scale( aScale ):GetBlendColor(),
			ShapeGlowColor = PhotonColor(255, 110, 0):Blend(amber):GetBlendColor()
		}
	}
}

COMPONENT.StateMap = "[1] 1"

COMPONENT.Elements = {
	[1] = { "main", Vector(0, 0, 0 ), Angle(0, 0, 0) },
}

COMPONENT.Segments = {
	Whelen_900 = {
		Off = "~OFF",
		Frames = {
			[1] = "1"
		},
		Sequences = {
			["ON"] = sequence()
			:Steady(1,10)
			:Steady(0,10)
			:Steady(1,10)
			:Steady(0,10),
			["ON:A"] = sequence()
			:Steady(1,8)
			:Steady(0,8)
			:Steady(1,8)
			:Steady(0,8),
			["ON:B"] = sequence()
			:Steady(0,8)
			:Steady(1,8)
			:Steady(0,8)
			:Steady(1,8),
			["ON:TD"] = sequence()
		}
	}
}

COMPONENT.Inputs = {
	["Emergency.Warning"] = {
		["MODE1"] = {
			Whelen_900 = "ON"
		},
		["MODE3"] = {
			Whelen_900 = "ON"
		}
	}
}
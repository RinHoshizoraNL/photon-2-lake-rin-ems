if (Photon2.ReloadComponentFile()) then return end
local COMPONENT = Photon2.LibraryComponent()
local sequence = Photon2.SequenceBuilder.New

COMPONENT.Author = "anemolis72 & LilRanbay"

-- This is a modified version of Anemolis72's Vertex, obviously right. Anyways it modifies the templates & some other stuff

COMPONENT.Credits = {
	Model = "anemolis72",
	Code = "anemolis72 & LilRanbay"
}

COMPONENT.WorkshopRequirements = {
	[3129048158] = "Whelen Vertex Model"
}

COMPONENT.Title = [[Whelen Vertex Lake Rin EMS]]
COMPONENT.Category = "Exterior"
COMPONENT.Model = "models/anemolis/whelen_vertex/whelen_vertex.mdl"

COMPONENT.States = {
	[1] = "R",
	[2] = "R"
}

local w = 1.19
local h = 1.18
local s = 1

COMPONENT.Templates = {
	["2D"] = {
		vertex = {
			Shape = PhotonMaterial.GenerateLightQuad("lilranbay/sprites/anemolis_whelen_vertex/whelen_vertex_shape.png").MaterialName,
			Detail = PhotonMaterial.GenerateLightQuad("lilranbay/sprites/anemolis_whelen_vertex/whelen_vertex_detail.png").MaterialName,
			Width = w,
			Height = h,
			Scale = s
		},
		vertex1 = {
			Shape = PhotonMaterial.GenerateLightQuad("lilranbay/sprites/anemolis_whelen_vertex/whelen_vertex_shape.png").MaterialName,
			Detail = PhotonMaterial.GenerateLightQuad("lilranbay/sprites/anemolis_whelen_vertex/whelen_vertex_detail_1.png").MaterialName,
			Width = w,
			Height = h,
			Scale = s
		},
		vertex2 = {
			Shape = PhotonMaterial.GenerateLightQuad("lilranbay/sprites/anemolis_whelen_vertex/whelen_vertex_shape.png").MaterialName,
			Detail = PhotonMaterial.GenerateLightQuad("lilranbay/sprites/anemolis_whelen_vertex/whelen_vertex_detail_2.png").MaterialName,
			Width = w,
			Height = h,
			Scale = s
		}
	}
}

COMPONENT.StateMap = "[1] 1 2 [2] 3"

local pos_x = -0.025
local pos_y = 0
local pos_z = 0.08
local ang_x = -90
local ang_y = 0
local ang_z = -61.7

COMPONENT.Elements = {
	[1] = { "vertex", Vector( pos_x, pos_y, pos_z ), Angle( ang_x, ang_y, ang_z ) },	-- FULL (SINGLE COLOR)
	[2] = { "vertex1", Vector( pos_x, pos_y, pos_z ) , Angle( ang_x, ang_y, ang_z ) },	-- DUO COLOR #1
	[3] = { "vertex2", Vector( pos_x, pos_y, pos_z ), Angle( ang_x, ang_y, ang_z ) }	-- DUO COLOR #2
}

COMPONENT.Segments = {
	whelen_vertex = {
		Frames = {
			[1] = "2",
			[2] = "3",
			[3] = "1"
		},
		Sequences = {
			["MSP"] = { 1,0,1,0,1,0,1,0,0,0,0,0,0,0,0,0,0},
			["MODE1"] = { 1,1,1,1,0,0,0,0 },
			["MODE3"] = sequence():TripleFlash( 1, 0 ):SetTiming( 1/20 ),
		}
	},
	["DVI"] = {
		Frames = {
			[0] = "[~R*0.5] 1",
			[1] = "1:~R",
		},
		Sequences = {
			["ON"] = sequence():Sequential(0, 1):Stretch(8)
		}
	},
}

COMPONENT.Inputs = {
	["Emergency.Warning"] = {
		["MODE1"] = {
			DVI = "ON"
		},
		["MODE3"] = {
			whelen_vertex = "MODE3"
		}
	}
}
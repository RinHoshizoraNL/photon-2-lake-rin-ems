if (Photon2.ReloadVehicleFile()) then return end --rin
local VEHICLE = Photon2.LibraryVehicle()

VEHICLE.Title 		= "2019 Chevrolet Tahoe LRFD EMS"
VEHICLE.Vehicle		= "19tahoe_sgm"
VEHICLE.Category 	= "Photon 2: Lake Rin EMS"
VEHICLE.Author		= "Rin Hoshizora"

local sequence = Photon2.SequenceBuilder.New

VEHICLE.Equipment = {
	{
		Category = "Livery",
		Options = {
			{
				Option = "Doctor Car",
				SubMaterials = {
					{ Id = 21, Material = "rin/lrems2/tahoe19/doctor_car" }
				},
			},
		}
	},
	{
		Category = "Siren",
		Options = {
			{
				Option = "Whelen 295HFSA6",
				Components = {
					{
						Name = "@siren",
						Component = "siren_prototype",
						Position = Vector(0, 120, 27.1),
						Angles = Angle(0, -90, 0),
						Scale = 0,
						Siren = "whelen_295hfsa6"
					},
				}
			},
		}
	},
	{
		Category = "Trim Package",
		Options = {
			{
				Option = "SSV",
				BodyGroups = {
					{ BodyGroup = "mirrors", Value = 1 },
					{ BodyGroup = "grille", Value = 0 },
					{ BodyGroup = "wheels", Value = 1 },
				},
			},
		}
	},
	{
		Category = "Lightbar",
		Options = {
			{
				Option = "Whelen Justice",
				Components = {
					{
						Component = "whelen_justice_jpn",
						Position = Vector( 0, -9.2, 90 ),
						Angles = Angle( 1.5, 90, 0 ),
						Scale = 1.035
					},
				}
			}
		}
	},
	{
		Category = "Front Flashers",
		Options = {
			{
				Option = "Osaka Siren LAF-150",
				Components = {
					{
						Component = "oss_laf150",
						Position = Vector( -20, 123, 37.3 ),
						BodyGroups = {
							["bracket"] = 0,
							["mount"] = 1,
						},
						Angles = Angle( 0, 9, 0 ),
						Scale = 1.0
					},
					{
						Component = "oss_laf150",
						Position = Vector( 20, 123, 37.3 ),
						BodyGroups = {
							["bracket"] = 0,
							["mount"] = 1,
						},
						Angles = Angle( 0, -9, 0 ),
						Scale = 1.0
					},
				}
			},
		}
	},
	{
		Category = "Rear Flashers",
		Options = {
			{
				Option = "Osaka Siren LAF-150",
				Components = {
					{
						Component = "oss_laf150",
						Position = Vector( -28.5, -126, 49.5 ),
						BodyGroups = {
							["bracket"] = 1,
							["mount"] = 0,
						},
						Angles = Angle( 0, 172, 1 ),
						Scale = 1.0
					},
					{
						Component = "oss_laf150",
						Position = Vector( 28.5, -126, 49.5 ),
						BodyGroups = {
							["bracket"] = 1,
							["mount"] = 0,
						},
						Angles = Angle( 0, 188, 1 ),
						Scale = 1.0
					},
				}
			},
		}
	},
	{
		Category = "Equipment",
		Options = {
			{
				Option = "Equipment",
				BodyGroups = {
					{ BodyGroup = "pushbar", Value = 0 },
					{ BodyGroup = "windowbars", Value = 0 },
					{ BodyGroup = "partition", Value = 0 },
					{ BodyGroup = "lightbar", Value = 1 },
					{ BodyGroup = "console", Value = 1 },
					{ BodyGroup = "ions", Value = 1 },
					{ BodyGroup = "dominator", Value = 1 },
					{ BodyGroup = "keychain", Value = 0 },
				},
				Props = {
					{
						Model = "models/sentry/props/jp/dashcam.mdl",
						Position = Vector( 7, 28, 80.5 ),
						Angles = Angle( 8, 264.8, 0 ),
						Scale = 1,
						RenderGroup = RENDERGROUP_OPAQUE,
					},
					{
						Model = "models/sentry/props/jp/antenna.mdl",
						Position = Vector( -22, 2, 87.2),
						Angles = Angle( -5, 0, -3 ),
						Scale = 1
					},
					{
						Model = "models/sentry/props/procopper_cvpi.mdl",
						Position = Vector( 0, 8, 14),
						Angles = Angle( 0, 0, 0 ),
						Scale = 1,
						RenderGroup = RENDERGROUP_OPAQUE,
					},
					{
						Model = "models/sentry/props/jp/oss_mkd1.mdl",
						Position = Vector( -0.2, 18.05, 40.7 ),
						Angles = Angle( -69, 270, 0 ),
						Scale = 1,
						RenderGroup = RENDERGROUP_OPAQUE,
					},
					{
						Model = "models/sentry/props/jp/necradio.mdl",
						Position = Vector( -0.2, 20.8, 42 ),
						Angles = Angle( -69, 270, 0 ),
						Scale = 1.1,
						RenderGroup = RENDERGROUP_OPAQUE,
					},
					{
						Model = "models/sentry/props/sap500.mdl",
						Position = Vector( 0, 15.35, 40.1 ),
						Angles = Angle( 0, 0, -69 ),
						Scale = 1,
						RenderGroup = RENDERGROUP_OPAQUE,
					},
					{
						Model = "models/sentry/props/jp/necmdt.mdl",
						Position = Vector( 0, 27.7, 49 ),
						Angles = Angle( -5, 270, 0 ),
						Scale = 0.8,
						RenderGroup = RENDERGROUP_OPAQUE,
					},
					{
						Model = "models/xenosprops/na_plate/na_plate_gov.mdl",
						Position = Vector( 0, -123.1, 47 ),
						Angles = Angle( 0, 270, 00 ),
						Scale = 1.02,
						SubMaterials = {
							[1] = "rin/lrems2/props/plate_ems_rear",
						},
					},
					{
						Model = "models/xenosprops/na_plate/na_plate_gov.mdl",
						Position = Vector( 0, 123.5, 22.1 ),
						Angles = Angle( 4, 90, 0 ),
						Scale = 1.02,
						SubMaterials = {
							[1] = "rin/lrems2/props/plate_ems_front",
						},
					},
				}
			}
		}
	},
}
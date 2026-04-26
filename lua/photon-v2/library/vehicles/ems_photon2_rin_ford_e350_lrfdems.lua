if (Photon2.ReloadVehicleFile()) then return end
local VEHICLE = Photon2.LibraryVehicle()

VEHICLE.Title 		= "2014 Ford E350 Ambulance LRFD EMS"
VEHICLE.Vehicle		= "e350_vanbulance_sgm"
VEHICLE.Category 	= "Photon 2: Lake Rin EMS"
VEHICLE.Author		= "Rin Hoshizora"

local sequence = Photon2.SequenceBuilder.New

VEHICLE.Equipment = {
	{
		Category = "Livery",
		Options = {
			
			{
				Option = "Medic One",
				SubMaterials = {
					{ Id = 20, Material = "rin/lrems2/e350/medic_one" },
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
		Category = "Lightbar",
		Options = {
			{
				Option = "Patlite AXS-12HM",
				Components = {
					{
                        Component = "patlite_axs12",
                        Position = Vector( 0, 30, 111.5 ),
                        Angles = Angle( -1, -90, 0 ),
                        Scale = 1.1,
                        Options = {
                            FeetWidthOffset = 0,
                            FeetTilt = 0,
                        },
					},
				}
			},
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
						Position = Vector( -22, 125.2, 34.5 ),
						BodyGroups = {
							["bracket"] = 0,
							["mount"] = 1,
						},
						Angles = Angle( 0, 3, 0 ),
						Scale = 1.0
					},
					{
						Component = "oss_laf150",
						Position = Vector( 22, 125.2, 34.5 ),
						BodyGroups = {
							["bracket"] = 0,
							["mount"] = 1,
						},
						Angles = Angle( 0, -3, 0 ),
						Scale = 1.0
					},
				}
			},
		}
	},
	{
		Category = "Front Top Flashers",
		Options = {
			{
				Option = "Osaka Siren LAF-150",
				Components = {
					{
						Component = "oss_laf150",
						Position = Vector( 0, 39, 103.5 ),
						BodyGroups = {
							["bracket"] = 1,
							["mount"] = 0,
						},
						Angles = Angle( 0, 0, 12 ),
						Scale = 1.0,
					},
					{
						Component = "oss_laf150",
						Position = Vector( 12, 39, 103.5 ),
						BodyGroups = {
							["bracket"] = 1,
							["mount"] = 0,
						},
						Angles = Angle( 0, 0, 12 ),
						Scale = 1.0,
						Phase = 180,
					},
					{
						Component = "oss_laf150",
						Position = Vector( -12, 39, 103.5 ),
						BodyGroups = {
							["bracket"] = 1,
							["mount"] = 0,
						},
						Angles = Angle( 0, 0, 12 ),
						Scale = 1.0,
						Phase = 180,
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
						Position = Vector( -30, -122.5, 98.5 ),
						BodyGroups = {
							["bracket"] = 1,
							["mount"] = 0,
						},
						Angles = Angle( 0, 180, 2 ),
						Scale = 1.0
					},
					{
						Component = "oss_laf150",
						Position = Vector( 30, -122.5, 98.5 ),
						BodyGroups = {
							["bracket"] = 1,
							["mount"] = 0,
						},
						Angles = Angle( 0, 180, 2 ),
						Scale = 1.0
					},
					{
						Component = "oss_laf150",
						Position = Vector( -16, -117.4, 110 ),
						BodyGroups = {
							["bracket"] = 1,
							["mount"] = 0,
						},
						Angles = Angle( 0, 180, 7 ),
						Scale = 1.0,
						Phase = 180,
					},
					{
						Component = "oss_laf150",
						Position = Vector( 16, -117.4, 110 ),
						BodyGroups = {
							["bracket"] = 1,
							["mount"] = 0,
						},
						Angles = Angle( 0, 180, 7 ),
						Scale = 1.0,
						Phase = 180,
					},
				}
			},
		}
	},
	{
		Category = "Side Flashers",
		Options = {
			{
				Option = "Osaka Siren LAF-150",
				Components = {
					{
						Component = "oss_laf150",
						Position = Vector( -38.7, -95, 98.5 ),
						BodyGroups = {
							["bracket"] = 1,
							["mount"] = 0,
						},
						Angles = Angle( 0, 90, 0 ),
						Scale = 1.0,
						Phase = 180,
					},
					{
						Component = "oss_laf150",
						Position = Vector( -38.7, 5, 98.5 ),
						BodyGroups = {
							["bracket"] = 1,
							["mount"] = 0,
						},
						Angles = Angle( 0, 90, 0 ),
						Scale = 1.0
					},
					{
						Component = "oss_laf150",
						Position = Vector( 38.7, -95, 98.5 ),
						BodyGroups = {
							["bracket"] = 1,
							["mount"] = 0,
						},
						Angles = Angle( 0, 270, 0 ),
						Scale = 1.0,
						Phase = 180,
					},
					{
						Component = "oss_laf150",
						Position = Vector( 38.7, 5, 98.5 ),
						BodyGroups = {
							["bracket"] = 1,
							["mount"] = 0,
						},
						Angles = Angle( 0, 270, 0 ),
						Scale = 1.0
					},
				}
			},
		}
	},
	{
		Category = "Side Beacons",
		Options = {
			{
				Option = "Side Beacons",
				Components = {
					{
						Component = "patlite_hkf",
						Position = Vector( -37.3, -107, 98.5 ),
						Angles = Angle( 180, 270, 90 ),
						Scale = 1,
						BodyGroups = {
							["trim"] = 0,
						},
					},
					{
						Component = "patlite_hkf",
						Position = Vector( 37.3, -107, 98.5 ),
						Angles = Angle( 180, 270, 270 ),
						Scale = 1,
						BodyGroups = {
							["trim"] = 0,
						},
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
				Props = {
					{
						Model = "models/supermighty/photon/sidestep.mdl",
						Position = Vector( 0, 87, -8 ),
						Angles = Angle( 0.6, 90, 0 ),
						Scale = Vector(1.72, 0.92, 1),
					},
					{
						Model = "models/sentry/props/jp/antenna.mdl",
						Position = Vector( 0, -80, 114),
						Angles = Angle( 0, 0, 0 ),
						Scale = 1,
						BodyGroups = {
							["feet"] = 1,
						},
					},
					{
						Model = "models/sentry/props/jp/antenna.mdl",
						Position = Vector( 0, -20, 114),
						Angles = Angle( 0, 20, 0 ),
						Scale = 1,
						BodyGroups = {
							["feet"] = 1,
						},
					},
					{
						Model = "models/sentry/props/jp/necmdt.mdl",
						Position = Vector( 0, 51.8, 64),
						Angles = Angle( -12, 270, 0 ),
						Scale = 1,
						RenderGroup = RENDERGROUP_OPAQUE,
					},
					{
						Model = "models/xenosprops/na_plate/na_plate_gov.mdl",
						Position = Vector( 16.4, -128.5, 47.5 ),
						Angles = Angle( 0, 270, 00 ),
						Scale = 1,
						SubMaterials = {
							[1] = "rin/lrems2/props/plate_ems_rear",
						},
					},
					{
						Model = "models/xenosprops/na_plate/na_plate_gov.mdl",
						Position = Vector( 0, 124, 18.2 ),
						Angles = Angle( 1.5, 90, 0 ),
						Scale = 0.97,
						SubMaterials = {
							[1] = "rin/lrems2/props/plate_ems_front",
						},
					},
				}
			}
		}
	},
}

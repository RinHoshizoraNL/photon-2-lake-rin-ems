if (Photon2.ReloadVehicleFile()) then return end
local VEHICLE = Photon2.LibraryVehicle()

VEHICLE.Title 		= "1987 Ford Crown Victoria LREMS"
VEHICLE.Vehicle		= "87ltd_sgm"
VEHICLE.Category 	= "Photon 2: Lake Rin EMS"
VEHICLE.Author		= "Rin Hoshizora"

local sequence = Photon2.SequenceBuilder.New

VEHICLE.Equipment = {
    {
		Category = "Livery",
		Options = {
			{
				Option = "EMS",
				SubMaterials = {
					{ Id = 7, Material = "rin/lrems2/crownvic87/doctor_car" },
					{ Id = 15, Material = "rin/lrems2/props/white" },
				},
			},
		}
	},
	{
		Category = "Lightbar",
		Options = {
            {
				Option = "Mars Skybolt",
				Components = {
					{
                        Component = "photon_anemolis_skybolt",
                        Position = Vector( 0, -19, 57.3 ),
                        Angles = Angle( 0, 180, 0 ),
                        Scale = 1.25,
					},
				}
			},

		}
	},
	{
		Category = "Front Beacons",
		Options = {
            {
				Option = "Patlite HKF Beacons",
				Components = {
					{
                        Component = "patlite_hkf",
                        Position = Vector( 14.5, 112.5, 22 ),
                        Angles = Angle( 0, -90, 0 ),
                        Scale = 0.8,
						BodyGroups = {
							["trim"] = 1,
						},
						Inputs = {
							["Emergency.Warning"] = {
								["MODE2"] = {},
							}
						}
					},
					{
                        Component = "patlite_hkf",
                        Position = Vector( -14.5, 112.5, 22 ),
                        Angles = Angle( 0, -90, 0 ),
                        Scale = 0.8,
						BodyGroups = {
							["trim"] = 1,
						},
						Inputs = {
							["Emergency.Warning"] = {
								["MODE2"] = {},
							}
						}
					},
				},
				Props = {
					{
						Model = "models/sentry/props/soundofffascia_lbracket.mdl",
						Position = Vector( 14.5, 112.5, 22.1 ),
						Angles = Angle( 270, 0, 270 ),
						Scale = Vector( 1, 1, 4 ),
					},
					{
						Model = "models/sentry/props/soundofffascia_lbracket.mdl",
						Position = Vector( -14.5, 112.5, 22.1 ),
						Angles = Angle( 270, 0, 270 ),
						Scale = Vector( 1, 1, 4 ),
					},
				}
			},
        }
	},
	{
		Category = "Siren",
		Options = {
			{
				Option = "SP Mark-VII",
				Components = {
					{
						Name = "@siren_speaker",
						Component = "siren_prototype",
						Model = "models/sentry/props/jp/patlitespeaker.mdl",
						Position = Vector( 0, 104, 22.5 ),
						Angles = Angle( 0, 270, 0 ),
						Scale = 1,
						SubMaterials = {
						   [0] = "sentry/cvpi_hd/black"
						},
						Siren = "sp_mk7",
						Templates = {
							["Sound"] = { 
								Tone = {
									DSP = 0,
									Pitch = 100
								}
							}
						},
						Inputs = { 
							["Emergency.SirenParkKill"] = { ["PARK"] = {} }
						}
					}
				}
			}
		}
	},
	{
		Category = "Equipment",
		Options = {
			{
				Option = "Equipment",
				Props = {
					{
						Model = "models/sentry/props/jp/necradio.mdl",
						Position = Vector( 1.5, 24, 43.65 ),
						Angles = Angle( -1, 270, -0.2 ),
						Scale = 1.1,
						RenderGroup = RENDERGROUP_OPAQUE,
					},
					{
						Model = "models/sentry/props/sap500.mdl",
						Position = Vector( 0, 26, 31.35 ),
						Angles = Angle( 0, 0, 0 ),
						Scale = 1.3,
						RenderGroup = RENDERGROUP_OPAQUE,
					},
					{
						Model = "models/schmal/antenna_vhf_2.mdl",
						Position = Vector( 0, -100, 37),
						Angles = Angle( 0, 0, 4 ),
						Scale = 1
					},
					{
						Model = "models/supermighty/photon/front_holder.mdl",
						Position = Vector( -34, 111.2, 16.8 ),
						Angles = Angle( 0, 90, 0 ),
						Scale = 1
					},
					{
						Model = "models/xenosprops/na_plate/na_plate_gov.mdl",
						Position = Vector( 0, -123, 30 ),
						Angles = Angle( -16, 270, 0 ),
						Scale = 1,
						SubMaterials = {
							[1] = "rin/lrems2/props/plate_ems_rear",
						},
					},
					{
						Model = "models/xenosprops/na_plate/na_plate_gov.mdl",
						Position = Vector( -34, 112, 16.8 ),
						Angles = Angle( 0, 90, 0 ),
						Scale = 0.99,
						SubMaterials = {
							[1] = "rin/lrems2/props/plate_ems_front",
						},
					},
				}
			}
		}
	},
}

if (Photon2.ReloadVehicleFile()) then return end
local VEHICLE = Photon2.LibraryVehicle()

VEHICLE.Title 		= "1991 Chevrolet Caprice LREMS"
VEHICLE.Vehicle		= "91caprice_sgm"
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
					{ Id = 20, Material = "rin/lrems2/caprice91/doctor_car" },
				},
			},
		}
	},
	{
		Category = "Flashers",
		Options = {
			{
				Option = "Flashers",
				Components = {
					{
						Component = "photon_standard_chevcap91_lrems"
					}
				},
			}
		}
	},
	{
		Category = "Lightbar",
		Options = {
            {
				Option = "Patlite AJS-12",
				Components = {
					{
                        Component = "patlite_ajs12",
                         Position = Vector( 0, -19, 65.8 ),
                        Angles = Angle( -1, -90, 0 ),
                        Scale = 1.15,
						Options = {
                            FeetWidthOffset = 4,
                            FeetTilt = -5,
                        },
						Inputs = {
							["Emergency.Warning"] = {
								["MODE2"] = {},
							}
						}
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
                        Position = Vector( 11, 112.5, 19.5 ),
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
                        Position = Vector( -11, 112.5, 19.5 ),
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
						Position = Vector( 11, 112.5, 19.6 ),
						Angles = Angle( 270, 0, 270 ),
						Scale = Vector( 1, 1, 4 ),
					},
					{
						Model = "models/sentry/props/soundofffascia_lbracket.mdl",
						Position = Vector( -11, 112.5, 19.6 ),
						Angles = Angle( 270, 0, 270 ),
						Scale = Vector( 1, 1, 4 ),
					},
				}
			},
        }
	},
	{
		Category = "Spotlight",
		Options = {
			{
				Option = "Spotlight",
				Components = {
					{
						Component = "photon_par46_left",
						Position = Vector( -37.5, 30, 42 ),
						Angles = Angle( 0, 0, 0 ),
						Scale = 1,
						SubMaterials = {
							[5] = "sentry/shared/env_cubemap_model"
						}
					},
				}
			},
		}
	},
	{
		Category = "Siren",
		Options = {
			{
				Option = "SP Mark-VII (Digital)",
				Components = {
					{
						Name = "@siren_speaker",
						Component = "siren_prototype",
						Model = "models/sentry/props/jp/patlitespeaker.mdl",
						Position = Vector( -5, 104, 22.5 ),
						Angles = Angle( 0, 270, 0 ),
						Scale = 1,
						SubMaterials = {
						   [0] = "sentry/cvpi_hd/black"
						},
						Siren = "sp_mk7_digi",
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
						Position = Vector( 1.5, 29, 41.9 ),
						Angles = Angle( 0, 270, -0.5 ),
						Scale = 1.1,
						RenderGroup = RENDERGROUP_OPAQUE,
					},
					{
						Model = "models/sentry/props/sap500.mdl",
						Position = Vector( 0, 27, 23 ),
						Angles = Angle( 0, 0, 0 ),
						Scale = 1.3,
						RenderGroup = RENDERGROUP_OPAQUE,
					},
					{
						Model = "models/schmal/antenna_motorola.mdl",
						Position = Vector( 0, -35, 60),
						Angles = Angle( 0, 0, 2.5 ),
						Scale = 1
					},
					{
						Model = "models/supermighty/photon/front_holder.mdl",
						Position = Vector( 0, 114, 12 ),
						Angles = Angle( 0, 90, 0 ),
						Scale = 1
					},
					{
						Model = "models/xenosprops/na_plate/na_plate_gov.mdl",
						Position = Vector( 0, -123.2, 25.2 ),
						Angles = Angle( 0, 270, 00 ),
						Scale = 1,
						SubMaterials = {
							[1] = "rin/lrems2/props/plate_ems_rear",
						},
					},
					{
						Model = "models/xenosprops/na_plate/na_plate_gov.mdl",
						Position = Vector( 0, 114.7, 12 ),
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

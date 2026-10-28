if (Photon2.ReloadVehicleFile()) then return end
local VEHICLE = Photon2.LibraryVehicle()

VEHICLE.Title 		= "1986 Ford F150 Ambulance LREMS"
VEHICLE.Vehicle		= "86f150_ambu_sgm"
VEHICLE.Category 	= "Photon 2: Lake Rin EMS"
VEHICLE.Author		= "Rin Hoshizora"

local sequence = Photon2.SequenceBuilder.New

VEHICLE.Equipment = {
	{
		Category = "Livery",
		Options = {
			
			{
				Option = "Ambulance",
				SubMaterials = {
					{ Id = 22, Material = "rin/lrems2/f150_86/ambo" },
					{ Id = 27, Material = "rin/lrems2/props/white" },
				},
			},
		}
	},
	{
		Category = "Trim Delete",
		Options = {
			{
				Option = "Trim Delete",
				BodyGroups = {
					{ BodyGroup = "ftrim", Value = 1 },
					{ BodyGroup = "doortrim", Value = 0 },
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
                        Position = Vector( 0, 0, 90.9 ),
                        Angles = Angle( -1, -90, 0 ),
                        Scale = 1.2,
						Options = {
                            FeetWidthOffset = 4,
                            FeetTilt = -3,
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
                        Position = Vector( 43.8, 90, 54.9 ),
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
                        Position = Vector( -43.8, 90, 54.9 ),
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
						Position = Vector( 43.8, 90, 55 ),
						Angles = Angle( 270, 2, 180 ),
						Scale = Vector( 2, 1, 4 ),
					},
					{
						Model = "models/sentry/props/soundofffascia_lbracket.mdl",
						Position = Vector( -43.8, 90, 55 ),
						Angles = Angle( 270, -2, 0 ),
						Scale = Vector( 2, 1, 4 ),
					},
				}
			},
        }
	},
	{
		Category = "Front Flashers",
		Options = {
			{
				Option = "Front Flashers",
				Components = {
					{
						Component = "koito_flasher",
						Position = Vector( 15, 102, 33.5 ),
						Angles = Angle( 0, 0, 0 ),
						Scale = 1,
						SubMaterials = {
							[0] = "sentry/props/koitoflasher/plastic_r"
						},
						Inputs = {
							["Emergency.Warning"] = {
								["MODE2"] = {},
							}
						}
					},
					{
						Component = "koito_flasher",
						Position = Vector( -15, 102, 33.5 ),
						Angles = Angle( 0, 0, 0 ),
						Scale = 1,
						Inputs = {
							["Emergency.Warning"] = {
								["MODE2"] = {},
							}
						}
					},
				}
			}
		}
	},
	{
		Category = "Front Box Flashers",
		Options = {
            {
				Option = "Whelen 900",
				Components = {
					{
						Component = "whelen_900_halogen_lr_ems",
						Position = Vector( -40, -19.7, 115 ),
						Angles = Angle( 0, 0, 0 ),
						Scale = 1.2,
					},
					{
						Component = "whelen_900_halogen_lr_ems",
						Position = Vector( 40, -19.7, 115 ),
						Angles = Angle( 0, 0, 0 ),
						Scale = 1.2,
					},
                }
			},
		}
	},
	{
		Category = "Left Flashers",
		Options = {
            {
				Option = "Whelen 900",
				Components = {
					{
						Component = "whelen_900_halogen_lr_ems",
						Position = Vector( -58, -34, 115 ),
						Angles = Angle( 0, 90, 0 ),
						Scale = 1.2,
						Phase = 90,
					},
					{
						Component = "whelen_900_halogen_lr_ems",
						Position = Vector( -58, -202, 115 ),
						Angles = Angle( 0, 90, 0 ),
						Scale = 1.2,
					},
				},
				Props = {
					{
						Model = "models/sentry/props/whelen900.mdl",
						Position = Vector( -58, -61, 117 ),
						Angles = Angle( 0, 90, 0 ),
						Scale = 0.9,
						SubMaterials = {
							[3] = "sentry/shared/glass",
						},
					},
					{
						Model = "models/sentry/props/whelen900.mdl",
						Position = Vector( -58, -175, 117 ),
						Angles = Angle( 0, 90, 0 ),
						Scale = 0.9,
						SubMaterials = {
							[3] = "sentry/shared/glass",
						},
					},
				},
			},
		}
	},
	{
		Category = "Right Flashers",
		Options = {
            {
				Option = "Whelen 900",
				Components = {
					{
						Component = "whelen_900_halogen_lr_ems",
						Position = Vector( 58, -34, 115 ),
						Angles = Angle( 0, 270, 0 ),
						Scale = 1.2,
						Phase = 90,
					},
					{
						Component = "whelen_900_halogen_lr_ems",
						Position = Vector( 58, -202, 115 ),
						Angles = Angle( 0, 270, 0 ),
						Scale = 1.2,
					},
				},
				Props = {
					{
						Model = "models/sentry/props/whelen900.mdl",
						Position = Vector( 58, -61, 115 ),
						Angles = Angle( 0, 270, 0 ),
						Scale = 0.9,
						SubMaterials = {
							[3] = "sentry/shared/glass",
						},
					},
					{
						Model = "models/sentry/props/whelen900.mdl",
						Position = Vector( 58, -175, 115 ),
						Angles = Angle( 0, 270, 0 ),
						Scale = 0.9,
						SubMaterials = {
							[3] = "sentry/shared/glass",
						},
					},
				},
			},
		}
	},
	{
		Category = "Rear Flashers",
		Options = {
            {
				Option = "Whelen 900",
				Components = {
					{
						Component = "whelen_900_halogen_lr_ems",
						Position = Vector( -40, -216.2, 115 ),
						Angles = Angle( 0, 180, 0 ),
						Scale = 1.2,
						Phase = 90,
					},
					{
						Component = "whelen_900_halogen_lr_ems",
						Position = Vector( 40, -216.2, 115 ),
						Angles = Angle( 0, 180, 0 ),
						Scale = 1.2,
						Phase = 90,
					},
					{
						Component = "whelen_900_halogen_lr_ems",
						Position = Vector( -20, -216.2, 115 ),
						Angles = Angle( 0, 180, 0 ),
						Scale = 1.2,
					},
					{
						Component = "whelen_900_halogen_lr_ems",
						Position = Vector( 20, -216.2, 115 ),
						Angles = Angle( 0, 180, 0 ),
						Scale = 1.2,
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
						Position = Vector( 0, 90, 35 ),
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
						Model = "models/sentry/props/whelen900.mdl",
						Position = Vector( 0, -216.2, 115 ),
						Angles = Angle( 0, 180, 0 ),
						Scale = 1.2,
						SubMaterials = {
							[3] = "sentry/shared/glass",
						},
					},
					{
						Model = "models/supermighty/photon/sidestep.mdl",
						Position = Vector( 0, 63, -5 ),
						Angles = Angle( 0, 90, 0 ),
						Scale = Vector(0.95, 0.95, 1),
					},
					{
						Model = "models/sentry/props/jp/antenna.mdl",
						Position = Vector( 0, -115, 127),
						Angles = Angle( 0, 20, 0 ),
						Scale = 1,
						BodyGroups = {
							["feet"] = 1,
						},
					},
					{
						Model = "models/xenosprops/na_plate/na_plate_gov.mdl",
						Position = Vector( -41, -215.7, 30 ),
						Angles = Angle( 0, 270, 0 ),
						Scale = 1,
						SubMaterials = {
							[1] = "rin/lrems2/props/plate_ems_rear",
						},
					},
					{
						Model = "models/xenosprops/na_plate/na_plate_gov.mdl",
						Position = Vector( 0, 102.7, 22.7 ),
						Angles = Angle( 4, 90, 0 ),
						Scale = 1,
						SubMaterials = {
							[1] = "rin/lrems2/props/plate_ems_front",
						},
					},
				}
			}
		}
	},
}

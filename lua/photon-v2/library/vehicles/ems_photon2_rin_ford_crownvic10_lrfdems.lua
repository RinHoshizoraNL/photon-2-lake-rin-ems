if (Photon2.ReloadVehicleFile()) then return end --rin
local VEHICLE = Photon2.LibraryVehicle()

VEHICLE.Title 		= "2010 Ford Crown Victoria LREMS"
VEHICLE.Vehicle		= "cvpi_hd_sgm"
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
					{ Id = 3, Material = "rin/lrems2/crownvic10/doctor_car" }
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
						Component = "photon_standard_cvpi10",
						Segments = {
							["Headlight_flashers"] = {
								Frames = {
									[4] = "[PASS] 1 21 19 9 11 30 2 22 20 10 12 31"
								},
								Sequences = {
									STAGE3 = sequence():Alternate(1,2,6),
									CUT = { 4 }
								}
							},
							["Rear_flashers_EMS"] = {
								Off = "OFF",
								Frames = {
									[1] = "15:~RI",
									[2] = "16:~RI",
								},
								Sequences = {
									STAGE3 = sequence():FlashHold(1,2,5):FlashHold(2,2,5):SetTiming(1/30)
								}
							}
						},
						Inputs = {
							["Emergency.Warning"] = {
								["MODE3"] = { 
									Headlight_flashers = "STAGE3",
									Rear_flashers_EMS = "STAGE3"
								}
							},
						}
					}
				}
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
						Component = "whelen_justice_lr_ems",
						Position = Vector( 0, -19.2, 69.2 ),
						Angles = Angle( -1, 270, 0 ),
						Scale = 0.9,
					},
				}
			}
		}
	},
	{
		Category = "Front Lights",
		Options = {
			{
				Option = "Whelen 700 Super-LED",
				Components = {
					{
						Name = "@front_700",
						Component = "creeper_whelen_700_superled",
						Position = Vector( 10, 110.8, 30.2 ),
						Angles = Angle( 0, -5, 18 ),
						Scale = 0.7,
						SubMaterials = {
							[7] = "schmal/photon/fedsig_visionslr/lens_pod_2",
						},
						Segments = {
							LightEMS = {
								Frames = {
									[1] = "1:R 3:R"
								},
								Sequences = {
									["STAGE1"] = {1,1,1,1,1,1,0,0,0,0,0,0},
									["STAGE3"] = {1,0,1,0,1,0,0,0,1,1,0,0,1,1,0,0,1,1,0,0,0},
								}
							},
						},
						Inputs = {
							["Emergency.Warning"] = {
								["MODE1"] = {
									LightEMS = "STAGE1"
								},
								["MODE2"] = {},
								["MODE3"] = {
									LightEMS = "STAGE3"
								}
							},
						}
					},
					{
						Inherit = "@front_700",
						Position = Vector( -10, 110.8, 30.2 ),
						Angles = Angle( 0, 5, 18 ),
						Inputs = {
							["Emergency.Warning"] = {
								["MODE1"] = {
									LightEMS = "STAGE1"
								},
								["MODE2"] = {},
								["MODE3"] = {
									LightEMS = "STAGE3"
								}
							},
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
		Category = "Spotlight",
		Options = {
			{
				Option = "Pillar Spotlight",
				Components = {
					{
						Component = "photon_par46_left",
						Position = Vector( -35.06, 26.46, 49.282 ),
						Angles = Angle( 0, 0, 0 ),
						Scale = 1,
					},
				},
				BodyGroups = {
					{ BodyGroup = "door_l_notch", Value = 0 },
					{ BodyGroup = "door_r_notch", Value = 1 },
				}
			},
		}
	},
	{
		Category = "Rain Guards",
		Options = {
			{
				Option = "Rain Guards",
				BodyGroups = {
					{ BodyGroup = "rainguards", Value = 1 },
				},
			},
			{
				Option = "None",
				BodyGroups = {
					{ BodyGroup = "rainguards", Value = 0 },
				},
			},
		}
	},
	{
		Category = "Trim Package",
		Options = {
			{
				Option = "Street Appearance Package",
				BodyGroups = {
					{ BodyGroup = "grille", Value = 0 },
					{ BodyGroup = "reartrim", Value = 0 },
					{ BodyGroup = "handles", Value = 0 },
					{ BodyGroup = "trunkmodel", Value = 1 },
					{ BodyGroup = "mirrors", Value = 0 },
					{ BodyGroup = "bumperf_chrome", Value = 0 },
					{ BodyGroup = "bumperr_chrome", Value = 0 },
                    { BodyGroup = "rearfascia", Value = 1 },
					{ BodyGroup = "spotlight_l", Value = 1 },
					{ BodyGroup = "spotlight_r", Value = 1 },
					{ BodyGroup = "windowbars", Value = 0 },
                    { BodyGroup = "hubcaps", Value = 0 },
                    { BodyGroup = "trunkemblem", Value = 0 },
                    { BodyGroup = "partition", Value = 1 },
                    { BodyGroup = "doortrim", Value = 0 },
                    { BodyGroup = "door_l_notch", Value = 1 },
                    { BodyGroup = "door_r_notch", Value = 1 },
                    { BodyGroup = "keypad", Value = 0 },
                    { BodyGroup = "mirrors", Value = 0 },
				},
			},
		}
	},
    {
		Category = "Equipment",
		Options = {
			{
				Option = "Equipment",
				Components = {
					{
						Component = "photon_pan_toughbookcf30",
						Position = Vector( 6.5, 13.5, 40 ),
						Angles = Angle( 0, 31, 0 ),
						Scale = 1,
						Options = {
							Pole = 2,
							Base = -60,
							-- You can change the screen material by using this option:
							Screen = "rin/lrems2/props/laptop_screen_ems",
						},
						RenderGroup = RENDERGROUP_OPAQUE,
					}
				},
				Props = {
					{
						Model = "models/sentry/props/jp/oss_mkd1.mdl",
						Position = Vector( -0.2, 10, 26.85 ),
						Angles = Angle( -69, 270, 0 ),
						Scale = 1,
						RenderGroup = RENDERGROUP_OPAQUE,
					},
					{
						Model = "models/sentry/props/jp/necradio.mdl",
						Position = Vector( -0.2, 12.75, 28 ),
						Angles = Angle( -69, 270, 0 ),
						Scale = 1.1,
						RenderGroup = RENDERGROUP_OPAQUE,
					},
					{
						Model = "models/sentry/props/sap500.mdl",
						Position = Vector( 0, 7.4, 26.2 ),
						Angles = Angle( 0, 0, -69 ),
						Scale = 1,
						RenderGroup = RENDERGROUP_OPAQUE,
					},
					{
						Model = "models/sentry/props/jp/dashcam.mdl",
						Position = Vector( 7, 15, 62 ),
						Angles = Angle( 8, 264.8, 0 ),
						Scale = 1,
						RenderGroup = RENDERGROUP_OPAQUE,
					},
					{
						Model = "models/sentry/props/jp/dashcam.mdl",
						Position = Vector( 0, -67, 62.7 ),
						Angles = Angle( 8, 90, 0 ),
						Scale = 1,
						RenderGroup = RENDERGROUP_OPAQUE,
					},
					{
						Model = "models/sentry/props/jp/antenna.mdl",
						Position = Vector( 0, -106, 48.6),
						Angles = Angle( 0, 0, 4.5 ),
						Scale = 1
					},
					{
						Model = "models/xenosprops/na_plate/na_plate_gov.mdl",
						Position = Vector( 0, -124.55, 36.2 ),
						Angles = Angle( -11, 270, 00 ),
						Scale = 1,
						SubMaterials = {
							[1] = "rin/lrems2/props/plate_ems_rear",
						},
					},
					{
						Model = "models/xenosprops/na_plate/na_plate_gov.mdl",
						Position = Vector( 0, 118.8, 18.2 ),
						Angles = Angle( 6.5, 90, 0 ),
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
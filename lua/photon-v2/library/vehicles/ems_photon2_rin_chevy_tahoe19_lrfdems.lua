if (Photon2.ReloadVehicleFile()) then return end --rin
local VEHICLE = Photon2.LibraryVehicle()

VEHICLE.Title 		= "2019 Chevrolet Tahoe LREMS"
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
		Category = "Lightbar",
		Options = {
            {
				Option = "Whelen Legacy",
				Components = {
					{
                        Component = "whelen_legacy_54_lr_ems",
                         Position = Vector( 0, -9.5, 88.5 ),
                        Angles = Angle( 1, 90, 0 ),
                        Scale = 0.95,
						BodyGroups = {
							["clamps"] = 1,
						},
						Bones = {
							["foot_left"] =	{ Vector( 0.5, 0, 0 ), Angle( 0, 0, 0 ), 1 },
							["foot_right"] =	{ Vector( -0.5, 0, 0 ), Angle( 0, 0, 0 ), 1 },
							["clamp_low_left"] =	{ Vector( 1.2, 0, 0 ), Angle( 0, 0, 0 ), 1 },
							["clamp_low_right"] =	{ Vector( -1.2, 0, 0 ), Angle( 0, 0, 0 ), 1 },
						},
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
						Name = "@siren_speaker",
						Component = "siren_prototype",
						Model = "models/sentry/props/jp/patlitespeaker.mdl",
						Position = Vector( 20.5, 117, 21.25 ),
						Angles = Angle( 0, -100, 0 ),
						Scale = 0.65,
						Siren = "whelen_295hfsa6",
						Templates = {
							["Sound"] = { 
								Tone = {
									DSP = 0,
									Pitch = 100
								}
							}
						},
					},
				},
				Props = {
					{
						Model = "models/sentry/props/jp/patlitespeaker.mdl",
						Position = Vector( -20.5, 117, 21.25 ),
						Angles = Angle( 0, -80, 0 ),
						Scale = 0.65,
					},
				}
			}
		}
	},
	{
		Category = "Spotlight",
		Options = {
			{
				Option = "Pillar Spotlight",
				Components = {
					{
						Component = "photon_whe_par46_left",
						Position = Vector( -37, 40.5, 68 ),
						Angles = Angle( 0, 0, 0 ),
						Scale = 1,
					},
				},
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
		Category = "Front Lights",
		Options = {
			{
				Option = "Whelen Ion",
				Components = {
					{
						Name = "@front_ion",
						Component = "photon_whe_ion",
						Position = Vector( 18, 117, 43.95 ),
						Angles = Angle( -1.5, -8, 0 ),
						Scale = 0.9,
						States = { "R" },
						Segments = {
							LightEMS = {
								Frames = {
									[1] = "Light"
								},
								Sequences = {
									["STAGE1"] = sequence():TripleFlash( 0, 1 ):SetTiming( 1/15 ),
									["STAGE3"] = sequence():TripleFlash( 1, 0 ):SetTiming( 1/20 ),
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
						},
						Inputs = {
							["Emergency.Warning"] = {
								["MODE1"] = {
									DVI = "ON"
								},
								["MODE2"] = {},
								["MODE3"] = {
									LightEMS = "STAGE3"
								}
							},
						}
					},
					{
						Inherit = "@front_ion",
						Position = Vector( -18, 117, 43.95 ),
						Angles = Angle( 1.5, 8, 0 ),
						Inputs = {
							["Emergency.Warning"] = {
								["MODE1"] = {
									DVI = "ON"
								},
								["MODE2"] = {},
								["MODE3"] = {
									LightEMS = "STAGE3"
								}
							},
						}
					},
					{
						Inherit = "@front_ion",
						Position = Vector( 35.5, 111.5, 21.8 ),
						Angles = Angle( 0, -27, 0 ),
						Inputs = {
							["Emergency.Warning"] = {
								["MODE1"] = {
									DVI = "ON:180"
								},
								["MODE2"] = {},
								["MODE3"] = {
									LightEMS = "STAGE3:180"
								}
							},
						}
					},
					{
						Inherit = "@front_ion",
						Position = Vector( -35.5, 111.5, 21.8 ),
						Angles = Angle( 0, 27, 0 ),
						Inputs = {
							["Emergency.Warning"] = {
								["MODE1"] = {
									DVI = "ON:180"
								},
								["MODE2"] = {},
								["MODE3"] = {
									LightEMS = "STAGE3:180"
								}
							},
						}
					},
                }
			},
		}
	},
	{
		Category = "Rear Lights",
		Options = {
			{
				Option = "Whelen Ion",
				Components = {
					{
						Name = "@rear_ion",
						Component = "photon_whe_ion_surface",
						Position = Vector( 27.5, -124.6, 49.5 ),
						Angles = Angle( 0, 188, 0 ),
						Scale = 0.9,
						States = { "R" },
						Segments = {
							LightEMS = {
								Frames = {
									[1] = "Light"
								},
								Sequences = {
									["STAGE1"] = sequence():TripleFlash( 0, 1 ):SetTiming( 1/15 ),
									["STAGE3"] = sequence():TripleFlash( 1, 0 ):SetTiming( 1/20 ),
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
						},
						Inputs = {
							["Emergency.Warning"] = {
								["MODE1"] = {
									DVI = "ON"
								},
								["MODE2"] = {},
								["MODE3"] = {
									LightEMS = "STAGE3"
								}
							},
						}
					},
					{
						Inherit = "@rear_ion",
						Position = Vector( -27.5, -124.6, 49.5 ),
						Angles = Angle( 0, 172, 0 ),
						Inputs = {
							["Emergency.Warning"] = {
								["MODE1"] = {
									DVI = "ON"
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
		Category = "Side Lights",
		Options = {
            {
				Option = "Whelen Vertex",
				Components = {
					{
                        Component = "whelen_vertex_lr_ems",
                         Position = Vector( 49.4, 76.5, 44 ),
                        Angles = Angle( 0, 90, 90 ),
                        Scale = 1,
					},
					{
                        Component = "whelen_vertex_lr_ems",
                         Position = Vector( -49.4, 76.5, 44 ),
                        Angles = Angle( 0, -90, 90 ),
                        Scale = 1,
					},
					{
                        Component = "whelen_vertex_lr_ems",
                         Position = Vector( 49.4, -69.5, 44 ),
                        Angles = Angle( 0, 90, 90 ),
                        Scale = 1,
						Phase = 180,
					},
					{
                        Component = "whelen_vertex_lr_ems",
                         Position = Vector( -49.4, -69.5, 44 ),
                        Angles = Angle( 0, -90, 90 ),
                        Scale = 1,
						Phase = 180,
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
						Model = "models/schmal/antennas/antenna_6.mdl",
						Position = Vector( -21.1, -60, 92.2),
						Angles = Angle( -1, 90, -3.5 ),
						Scale = 1
					},
					{
						Model = "models/schmal/antennas/antenna_6.mdl",
						Position = Vector( 21.1, -60, 92.2),
						Angles = Angle( -1, 90, 3.5 ),
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
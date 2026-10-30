if (Photon2.ReloadVehicleFile()) then return end --rin
local VEHICLE = Photon2.LibraryVehicle()

VEHICLE.Title 		= "2021 Chevrolet Tahoe LREMS"
VEHICLE.Vehicle		= "21tahoe_sgm"
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
					{ Id = 20, Material = "rin/lrems2/tahoe21/doctor_car" }
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
						Component = "samm_21_tahoe_lighting",
						Segments = {
							HighbeamsEMS = {
								Frames = {
									[1] = "5:W",
									[2] = "6:W",
								},
								Sequences = {
									STAGE3 = sequence():Alternate(1,2,5),
								}
							},
							ReverseEMS = {
								Frames = {
									[1] = "12:R 13:R",
								},
								Sequences = {
									STAGE3 = sequence():TripleFlash( 0, 1 ):SetTiming( 1/20 ),
								}
							}
						},
						Inputs = {
							["Emergency.Warning"] = {
								["MODE3"] = { 
									HighbeamsEMS = "STAGE3",
									ReverseEMS = "STAGE3"
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
				Option = "Whelen Legacy",
				Components = {
					{
                        Component = "whelen_legacy_54_lr_ems",
                         Position = Vector( 0, -9.8, 92 ),
                        Angles = Angle( 1.7, 90, 0 ),
                        Scale = 0.92,
						BodyGroups = {
							["clamps"] = 1,
						},
						Bones = {
							["foot_left"] =	{ Vector( 0.5, 0, 0 ), Angle( 0, 0, 0 ), 1 },
							["foot_right"] =	{ Vector( -0.5, 0, 0 ), Angle( 0, 0, 0 ), 1 },
							["clamp_low_left"] =	{ Vector( 0.8, 0, 0 ), Angle( 0, 0, 0 ), 1 },
							["clamp_low_right"] =	{ Vector( -0.8, 0, 0 ), Angle( 0, 0, 0 ), 1 },
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
						Position = Vector( 15, 109, 38.2 ),
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
						Position = Vector( -15, 109, 38.2 ),
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
						Position = Vector( -36.5, 38, 72 ),
						Angles = Angle( 0, 0, 0 ),
						Scale = 1,
					},
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
						Component = "photon_whe_ion_surface",
						Position = Vector( 15.3, 110, 51.7 ),
						Angles = Angle( -0.7, -10, 0 ),
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
						Position = Vector( -15.3, 110, 51.7 ),
						Angles = Angle( 0.7, 10, 0 ),
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
						Position = Vector( 36.5, 106.3, 32.5 ),
						Angles = Angle( -7, -41, -3 ),
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
						Position = Vector( -36.5, 106.3, 32.5 ),
						Angles = Angle( 7, 41, -3 ),
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
						Position = Vector( 13, -125, 52 ),
						Angles = Angle( 0, 186, 10 ),
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
						Position = Vector( -13, -125, 52 ),
						Angles = Angle( 0, 174, 10 ),
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
                         Position = Vector( 46.8, 73, 47.5 ),
                        Angles = Angle( 0, 90, 80 ),
                        Scale = 1,
					},
					{
                        Component = "whelen_vertex_lr_ems",
                         Position = Vector( -46.8, 73, 47.5 ),
                        Angles = Angle( 0, -90, 80 ),
                        Scale = 1,
					},
					{
                        Component = "whelen_vertex_lr_ems",
                         Position = Vector( 47.5, -71, 48.2 ),
                        Angles = Angle( 0, 90, 80 ),
                        Scale = 1,
						Phase = 180,
					},
					{
                        Component = "whelen_vertex_lr_ems",
                         Position = Vector( -47.5, -71, 48.2 ),
                        Angles = Angle( 0, -90, 80 ),
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
				Props = {
					{
						Model = "models/sentry/props/jp/dashcam.mdl",
						Position = Vector( 10, 29.5, 83 ),
						Angles = Angle( 8, 264.8, 0 ),
						Scale = 1,
						RenderGroup = RENDERGROUP_OPAQUE,
					},
					{
						Model = "models/schmal/antennas/antenna_6.mdl",
						Position = Vector( -15, -35, 95.7),
						Angles = Angle( 0, 90, -1 ),
						Scale = 1
					},
					{
						Model = "models/schmal/antennas/antenna_6.mdl",
						Position = Vector( 15, -35, 95.7),
						Angles = Angle( 0, 90, 1 ),
						Scale = 1
					},
					{
						Model = "models/sentry/props/procopper_cvpi.mdl",
						Position = Vector( 0, 8, 16),
						Angles = Angle( 0, 0, 0 ),
						Scale = 1,
						RenderGroup = RENDERGROUP_OPAQUE,
					},
					{
						Model = "models/sentry/props/jp/oss_mkd1.mdl",
						Position = Vector( -0.2, 18.05, 42.7 ),
						Angles = Angle( -69, 270, 0 ),
						Scale = 1,
						RenderGroup = RENDERGROUP_OPAQUE,
					},
					{
						Model = "models/sentry/props/jp/necradio.mdl",
						Position = Vector( -0.2, 20.8, 44 ),
						Angles = Angle( -69, 270, 0 ),
						Scale = 1.1,
						RenderGroup = RENDERGROUP_OPAQUE,
					},
					{
						Model = "models/sentry/props/sap500.mdl",
						Position = Vector( 0, 15.35, 42.1 ),
						Angles = Angle( 0, 0, -69 ),
						Scale = 1,
						RenderGroup = RENDERGROUP_OPAQUE,
					},
					{
						Model = "models/sentry/props/jp/necmdt.mdl",
						Position = Vector( 0, 27.7, 60 ),
						Angles = Angle( -5, 270, 0 ),
						Scale = 0.8,
						RenderGroup = RENDERGROUP_OPAQUE,
					},
					{
						Model = "models/xenosprops/na_plate/na_plate_gov.mdl",
						Position = Vector( 0, -125.3, 52.5 ),
						Angles = Angle( -11, 270, 0 ),
						Scale = 1.02,
						SubMaterials = {
							[1] = "rin/lrems2/props/plate_ems_rear",
						},
					},
					{
						Model = "models/supermighty/photon/front_holder.mdl",
						Position = Vector( 0, 117, 29 ),
						Angles = Angle( 0, 90, 0 ),
						Scale = 1,
					},
					{
						Model = "models/xenosprops/na_plate/na_plate_gov.mdl",
						Position = Vector( 0, 117.7, 29 ),
						Angles = Angle( 0, 90, 0 ),
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
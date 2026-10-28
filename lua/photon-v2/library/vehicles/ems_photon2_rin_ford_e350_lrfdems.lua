if (Photon2.ReloadVehicleFile()) then return end
local VEHICLE = Photon2.LibraryVehicle()

VEHICLE.Title 		= "2014 Ford E350 Ambulance LREMS"
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
						Inputs = {
							["Emergency.Warning"] = {
								["MODE2"] = {},
							},
						}
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
						Component = "oss_laf150_lr_ems",
						Position = Vector( -22, 125.2, 34.5 ),
						BodyGroups = {
							["bracket"] = 0,
							["mount"] = 1,
						},
						Angles = Angle( 0, 3, 0 ),
						Scale = 1.0
					},
					{
						Component = "oss_laf150_lr_ems",
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
		Category = "Front Lights",
		Options = {
			{
				Option = "Whelen 600 Super-LED",
				Components = {
					{
						Name = "@front_600",
						Component = "creeper_whelen_600_superled",
						Position = Vector( 0, 37.5, 103.5 ),
						Angles = Angle( 0, 0, 10 ),
						Scale = 1,
						SubMaterials = {
							[7] = "schmal/photon/fedsig_visionslr/lens_pod_2",
						},
						Segments = {
							LightEMS = {
								Frames = {
									[1] = "1:R 3:R"
								},
								Sequences = {
									["STAGE3"] = {1,0,1,0,1,0,0,0,1,1,0,0,1,1,0,0,1,1,0,0,0},
								}
							},
							["DVI"] = {
								Frames = {
									[0] = "[~R*0.5] 1 3",
									[1] = "1:~R 3:~R",
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
						Inherit = "@front_600",
						Position = Vector( 12, 37.5, 103.5 ),
						Angles = Angle( 0, 0, 10 ),
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
						Inherit = "@front_600",
						Position = Vector( -12, 37.5, 103.5 ),
						Angles = Angle( 0, 0, 10 ),
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
		Category = "Side Lights",
		Options = {
			{
				Option = "Whelen 700 Super-LED",
				Components = {
					{
						Name = "@side_700",
						Component = "creeper_whelen_700_superled",
						Position = Vector( -37.3, 3, 98.5 ),
						Angles = Angle( 0, 90, 0 ),
						Scale = 1.0,
						SubMaterials = {
							[7] = "schmal/photon/fedsig_visionslr/lens_pod_2",
						},
						Segments = {
							LightEMS = {
								Frames = {
									[1] = "1:R 3:R"
								},
								Sequences = {
									["STAGE3"] = {1,0,1,0,1,0,0,0,1,1,0,0,1,1,0,0,1,1,0,0,0},
								}
							},
							["DVI"] = {
								Frames = {
									[0] = "[~R*0.5] 1 3",
									[1] = "1:~R 3:~R",
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
						Inherit = "@side_700",
						Position = Vector( 37.3, 3, 98.5 ),
						Angles = Angle( 0, 270, 0 ),
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
						Inherit = "@side_700",
						Position = Vector( -37.3, -104, 98.5 ),
						Angles = Angle( 0, 90, 0 ),
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
						Inherit = "@side_700",
						Position = Vector( 37.3, -104, 98.5 ),
						Angles = Angle( 0, 270, 0 ),
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
				Option = "Whelen 900 Super-LED",
				Components = {
					{
						Name = "@rear_900",
						Component = "creeper_whelen_900_led",
						Position = Vector( -27, -121, 97.7 ),
						Angles = Angle( 0, 180, 3 ),
						Scale = 1,
						SubMaterials = {
							[7] = "schmal/photon/fedsig_visionslr/lens_pod_2",
						},
						Segments = {
							LightEMS = {
								Frames = {
									[1] = "1:R 3:R"
								},
								Sequences = {
									["STAGE3"] = {1,0,1,0,1,0,0,0,1,1,0,0,1,1,0,0,1,1,0,0,0},
								}
							},
							["DVI"] = {
								Frames = {
									[0] = "[~R*0.5] 1 3",
									[1] = "1:~R 3:~R",
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
						Inherit = "@rear_900",
						Position = Vector( 27, -121, 97.7 ),
						Angles = Angle( 0, 180, 3 ),
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
						Inherit = "@rear_900",
						Position = Vector( -13.5, -121, 97.7 ),
						Angles = Angle( 0, 180, 3 ),
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
						Inherit = "@rear_900",
						Position = Vector( 13.5, -121, 97.7 ),
						Angles = Angle( 0, 180, 3 ),
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
		Category = "Equipment",
		Options = {
			{
				Option = "Equipment",
				Props = {
					{
						Model = "models/creeper/photon/whelen_900_superled.mdl",
						Position = Vector( 0, -121, 97.7 ),
						Angles = Angle( 0, 180, 3 ),
						Scale = 1,
					},
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

if (Photon2.ReloadVehicleFile()) then return end
local VEHICLE = Photon2.LibraryVehicle()

VEHICLE.Title 		= "2014 Ford F550 Crew Cab Ambulance LREMS MER"
VEHICLE.Vehicle		= "f550_ambu_sm"
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
					{ Id = 2, Material = "rin/lrems2/f550/mer" },
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
                         Position = Vector( 0, 28, 93.6 ),
                        Angles = Angle( 0, 90, 0 ),
                        Scale = 0.95,
						BodyGroups = {
							["clamps"] = 2,
						},
						Bones = {
							["foot_left"] =	{ Vector( -2, 0, 0 ), Angle( 0, 0, 0 ), 1 },
							["foot_right"] =	{ Vector( 2, 0, 0 ), Angle( 0, 0, 0 ), 1 },
						},
					},
				}
			},
        }
	},
	{
		Category = "Pushbar Front Lights",
		Options = {
			{
				Option = "Osaka Siren LAF-150",
				Components = {
					{
						Component = "oss_laf150_lr_ems",
						Position = Vector( -14, 166, 45.85 ),
						BodyGroups = {
							["bracket"] = 0,
							["mount"] = 0,
						},
						Angles = Angle( 0, 0, 0 ),
						Scale = 1.0
					},
					{
						Component = "oss_laf150_lr_ems",
						Position = Vector( 14, 166, 45.85 ),
						BodyGroups = {
							["bracket"] = 0,
							["mount"] = 0,
						},
						Angles = Angle( 0, 0, 0 ),
						Scale = 1.0
					},
					{
						Component = "oss_laf150_lr_ems",
						Position = Vector( -25.2, 164, 39 ),
						BodyGroups = {
							["bracket"] = 1,
							["mount"] = 0,
						},
						Angles = Angle( 90, 90, 0 ),
						Scale = 1.0,
						Phase = 180
					},
					{
						Component = "oss_laf150_lr_ems",
						Position = Vector( 25.2, 164, 39 ),
						BodyGroups = {
							["bracket"] = 1,
							["mount"] = 0,
						},
						Angles = Angle( 90, 270, 0 ),
						Scale = 1.0,
						Phase = 180
					},
				}
			},
		}
	},
	{
		Category = "Front Lights",
		Options = {
			{
				Option = "Whelen 900 Super-LED",
				Components = {
					{
						Name = "@front_900",
						Component = "creeper_whelen_900_led",
						Position = Vector( 0, -20.5, 114.5 ),
						Angles = Angle( 0, 0, 0 ),
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
						Inherit = "@front_900",
						Position = Vector( 40, -20.5, 114.5 ),
						Angles = Angle( 0, 0, 0 ),
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
						Inherit = "@front_900",
						Position = Vector( -40, -20.5, 114.5 ),
						Angles = Angle( 0, 0, 0 ),
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
				Option = "Whelen 900 Super-LED",
				Components = {
					{
						Inherit = "@front_900",
						Position = Vector( 53.3, -34, 114.5 ),
						Angles = Angle( 0, -90, 0 ),
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
						Inherit = "@front_900",
						Position = Vector( -53.3, -34, 114.5 ),
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
						Inherit = "@front_900",
						Position = Vector( 53.3, -198, 114.5 ),
						Angles = Angle( 0, -90, 0 ),
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
						Inherit = "@front_900",
						Position = Vector( -53.3, -198, 114.5 ),
						Angles = Angle( 0, 90, 0 ),
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
		Category = "Rear Lights",
		Options = {
			{
				Option = "Whelen 900 Super-LED",
				Components = {
					{
						Inherit = "@front_900",
						Position = Vector( 40, -211.5, 114.5 ),
						Angles = Angle( 0, 180, 0 ),
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
						Inherit = "@front_900",
						Position = Vector( -40, -211.5, 114.5 ),
						Angles = Angle( 0, 180, 0 ),
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
						Inherit = "@front_900",
						Position = Vector( 20, -211.5, 114.5 ),
						Angles = Angle( 0, 180, 0 ),
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
						Inherit = "@front_900",
						Position = Vector( -20, -211.5, 114.5 ),
						Angles = Angle( 0, 180, 0 ),
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
		Category = "Left Scene Lights",
		Options = {
			{
				Option = "Left Scene Lights",
				Components = {
					{
						Component = "samm_illum_bar",
						Position = Vector( -54.4, -60, 112.3 ),
						Angles = Angle( 0, 90, -10 ),
						Scale = 1,
						Inputs = {
							["Emergency.SceneRight"] = {
								["ON"] = {}
							},
							["Emergency.SceneForward"] = {
								["ON"] = {}
							},
						}
					},
					{
						Component = "samm_illum_bar",
						Position = Vector( -54.4, -115, 112.3 ),
						Angles = Angle( 0, 90, -10 ),
						Scale = 1,
						Inputs = {
							["Emergency.SceneRight"] = {
								["ON"] = {}
							},
							["Emergency.SceneForward"] = {
								["ON"] = {}
							},
						}
					},
					{
						Component = "samm_illum_bar",
						Position = Vector( -54.4, -170, 112.3 ),
						Angles = Angle( 0, 90, -10 ),
						Scale = 1,
						Inputs = {
							["Emergency.SceneRight"] = {
								["ON"] = {}
							},
							["Emergency.SceneForward"] = {
								["ON"] = {}
							},
						}
					},
				}
			},
		}
	},
	{
		Category = "Right Scene Lights",
		Options = {
			{
				Option = "Right Scene Lights",
				Components = {
					{
						Component = "samm_illum_bar",
						Position = Vector( 54.4, -60, 112.3 ),
						Angles = Angle( 0, -90, -10 ),
						Scale = 1,
						Inputs = {
							["Emergency.SceneLeft"] = {
								["ON"] = {}
							},
							["Emergency.SceneForward"] = {
								["ON"] = {}
							},
						}
					},
					{
						Component = "samm_illum_bar",
						Position = Vector( 54.4, -115, 112.3 ),
						Angles = Angle( 0, -90, -10 ),
						Scale = 1,
						Inputs = {
							["Emergency.SceneLeft"] = {
								["ON"] = {}
							},
							["Emergency.SceneForward"] = {
								["ON"] = {}
							},
						}
					},
					{
						Component = "samm_illum_bar",
						Position = Vector( 54.4, -170, 112.3 ),
						Angles = Angle( 0, -90, -10 ),
						Scale = 1,
						Inputs = {
							["Emergency.SceneLeft"] = {
								["ON"] = {}
							},
							["Emergency.SceneForward"] = {
								["ON"] = {}
							},
						}
					},
				}
			},
		}
	},
	{
		Category = "Tail Lights",
		Options = {
			{
				Option = "Tail Lights",
				Components = {
					{
						Component = "creeper_whelen_600_btt",
						Position = Vector( -39, -211.5, 31.5 ),
						Angles = Angle( 0, 180, 0 ),
						Scale = 1,
					},
					{
						Component = "creeper_whelen_600_turn_left",
						Position = Vector( -39, -211.5, 65 ),
						Angles = Angle( 0, 180, 0 ),
						Scale = 1,
					},
					{
						Component = "creeper_whelen_600_rev",
						Position = Vector( -39, -211.5, 37.5 ),
						Angles = Angle( 0, 180, 0 ),
						Scale = 1,
					},
					{
						Component = "creeper_whelen_600_btt",
						Position = Vector( 39, -211.5, 31.5 ),
						Angles = Angle( 0, 180, 0 ),
						Scale = 1,
					},
					{
						Component = "creeper_whelen_600_turn_right",
						Position = Vector( 39, -211.5, 65 ),
						Angles = Angle( 0, 180, 0 ),
						Scale = 1,
					},
					{
						Component = "creeper_whelen_600_rev",
						Position = Vector( 39, -211.5, 37.5 ),
						Angles = Angle( 0, 180, 0 ),
						Scale = 1,
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
						Position = Vector( 0, -211.5, 114.5 ),
						Angles = Angle( 0, 180, 0 ),
						Scale = 1,
					},
					{
						Model = "models/schmal/setina_pushbar_durango.mdl",
						Position = Vector( 0, 160, 41),
						Angles = Angle( 0, 270, 0 ),
						Scale = Vector( 0.75, 1.2, 1.2),
						BodyGroups = {
							["fender_wrap"] = 1,
						},
					},
					{
						Model = "models/sentry/props/jp/antenna.mdl",
						Position = Vector( 0, 5, 92.75),
						Angles = Angle( 0, 0, 0 ),
						Scale = 1,
						BodyGroups = {
							["feet"] = 1,
						},
					},
					{
						Model = "models/sentry/props/jp/antenna.mdl",
						Position = Vector( 0, -120, 126.35),
						Angles = Angle( 0, 20, 0 ),
						Scale = 1,
						BodyGroups = {
							["feet"] = 1,
						},
					},
					{
						Model = "models/schmal/antenna_vhf_1.mdl",
						Position = Vector( 45.5, 146, 35.5),
						Angles = Angle( 0, 20, 0 ),
						Scale = 1,
					},
					{
						Model = "models/schmal/antenna_vhf_1.mdl",
						Position = Vector( -45.5, 146, 35.5),
						Angles = Angle( 0, 20, 0 ),
						Scale = 1,
					},
					{
						Model = "models/sentry/props/jp/necmdt.mdl",
						Position = Vector( 0, 73, 59),
						Angles = Angle( -12, 270, 0 ),
						Scale = 1,
						RenderGroup = RENDERGROUP_OPAQUE,
					},
					{
						Model = "models/supermighty/photon/front_holder.mdl",
						Position = Vector( 0, 158.5, 29 ),
						Angles = Angle( 0, 90, 0 ),
						Scale = 1
					},
					{
						Model = "models/xenosprops/na_plate/na_plate_gov.mdl",
						Position = Vector( -39, -210, 47 ),
						Angles = Angle( -8, 270, 0 ),
						Scale = 1,
						SubMaterials = {
							[1] = "rin/lrems2/props/plate_ems_rear",
						},
					},
					{
						Model = "models/xenosprops/na_plate/na_plate_gov.mdl",
						Position = Vector( 0, 159.3, 29 ),
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

note
	EIS: "src=main.rsml", "type=trace"
	description: "[
		This class contains the documentation of all requirements.
	]"
class REQUIREMENTS_DOCUMENTATION	
feature -- Requirements
	requirement_0_1_doc: STRING
	note
		EIS:"src=main.rsml", "ref=[0.1]", "type=trace"
		doc: "true"
	do
		Result := "[
					 
						The aim of the automatic delivery drone (later called "the drone") is to transport parcels from the commercial enterprise warehouse to its customers. The drone is a quadricopter equipped with a clamp.
				]"
	end
	
	requirement_0_2_doc: STRING
	note
		EIS:"src=main.rsml", "ref=[0.2]", "type=trace"
		doc: "true"
	do
		Result := "[
					
						When activated, the drone shall take over a parcel (pick it in the warehouse and deliver it).
				]"
	end
	
	requirement_0_3_doc: STRING
	note
		EIS:"src=main.rsml", "ref=[0.3]", "type=trace"
		doc: "true"
	do
		Result := "[
					
						The drone shall be controlled by a web application, and being accessible all the time by this application.
				]"
	end
	
	requirement_0_4_doc: STRING
	note
		EIS:"src=main.rsml", "ref=[0.4]", "type=trace"
		doc: "true"
	do
		Result := "[
					
						In normal mode, the drone shall be fully automated, but an operator must be able to switch to control mode to take control of the drone with the application.	
				]"
	end
	
	_drone_mode_could_be_normal_modedrone_mode_could_be_control_mode_doc: STRING
		note
			EIS: "src=main.rsml", "ref=[0.4.1]", "type=trace"
			doc: "true"
			refines: "{REQUIREMENTS_DOCUMENTATION}.requirement_0_4_doc"
		do
			Result := "[
							[0.4.1] (refines [0.4]) Drone mode could be equal to normal mode or drone mode could be equal to control mode.
					]"
		end
		
	requirement_0_5_doc: STRING
	note
		EIS:"src=main.rsml", "ref=[0.5]", "type=trace"
		doc: "true"
	do
		Result := "[
					
						The drone is propelled by four rotors, each driven by a brushless motor. The power shall be enough to transport parcels weighing up to 10 kg and with a size up to 1x1 m. 	
				]"
	end
	
	requirement_1_1_doc: STRING
	note
		EIS:"src=main.rsml", "ref=[1.1]", "type=trace"
		doc: "true"
	do
		Result := "[
					
						The drone shall pick up a parcel, go to the destination and drop it off when activated on the web application.
				]"
	end
	
	when_drone_status_is_activated_then_eventually_attached_parcel_should_not_be_null_doc: STRING
		note
			EIS: "src=main.rsml", "ref=[1.1.1]", "type=trace"
			doc: "true"
			parts: "{REQUIREMENTS_DOCUMENTATION}.requirement_1_1_doc"
		do
			Result := "[
							[1.1.1] (parts of [1.1]) When the drone status is equal to activated then eventually attached parcel shall be not equal to null within 120 [s].
					]"
		end
		
	when_attached_parcel_is_not_null_then_eventually_drone_location_should_be_destination_doc: STRING
		note
			EIS: "src=main.rsml", "ref=[1.1.2]", "type=trace"
			doc: "true"
			parts: "{REQUIREMENTS_DOCUMENTATION}.requirement_1_1_doc"
		do
			Result := "[
							[1.1.2] (parts of [1.1]) When attached parcel is not equal to null then eventually drone location shall be equal to destination within 1500 [s].
					]"
		end
		
	when_drone_location_is_destination_then_eventually_attached_parcel_should_be_null_doc: STRING
		note
			EIS: "src=main.rsml", "ref=[1.1.3]", "type=trace"
			doc: "true"
			parts: "{REQUIREMENTS_DOCUMENTATION}.requirement_1_1_doc"
			parts: "{REQUIREMENTS_DOCUMENTATION}.requirement_1_4_doc"
		do
			Result := "[
							[1.1.3] (parts of [1.1] and parts of [1.4]) When drone location is equal to destination then eventually attached parcel shall be equal to null within 120 [s].
					]"
		end
		
	requirement_1_2_doc: STRING
	note
		EIS:"src=main.rsml", "ref=[1.2]", "type=trace"
		doc: "true"
	do
		Result := "[
					
						An operator shall assign a parcel (identified by a unique identifier -- encoded in a QR code on the parcel -- and a position in the warehouse) to a drone through the application.
				]"
	end
	
	when_drone_status_is_activated_then_immediately_assigned_parcel_should_not_be_null_and_parcel_position_should_not_be_null_doc: STRING
		note
			EIS: "src=main.rsml", "ref=[1.2.1]", "type=trace"
			doc: "true"
			parts: "{REQUIREMENTS_DOCUMENTATION}.requirement_1_2_doc"
		do
			Result := "[
							[1.2.1] (parts of [1.2]) When the drone status is equal to activated then immediately assigned parcel shall be not equal to null and parcel position shall be not equal to null.
					]"
		end
		
	requirement_1_3_doc: STRING
	note
		EIS:"src=main.rsml", "ref=[1.3]", "type=trace"
		doc: "true"
		repeats: "{REQUIREMENTS_DOCUMENTATION}.requirement_1_1_doc"
	do
		Result := "[
					
						The drone shall go to the parcel, catch it, and deliver it to the destination (collected from a service that give a destination (GPS coordinates) given an identifier).
				]"
	end
	
	requirement_1_4_doc: STRING
	note
		EIS:"src=main.rsml", "ref=[1.4]", "type=trace"
		doc: "true"
	do
		Result := "[
					
						When the destination is reached, the drone shall drop the parcel and return back to the warehouse to its charge station.	
				]"
	end
	
	when_drone_location_is_destination_and_attached_parcel_is_null_then_immediately_drone_status_should_be_return_doc: STRING
		note
			EIS: "src=main.rsml", "ref=[1.4.1]", "type=trace"
			doc: "true"
			parts: "{REQUIREMENTS_DOCUMENTATION}.requirement_1_4_doc"
		do
			Result := "[
							[1.4.1] (parts of [1.4]) When drone location is equal to destination and attached parcel is equal to null then immediately drone status shall be equal to return.
					]"
		end
		
	when_drone_location_is_destination_and_attached_parcel_is_null_then_eventually_drone_location_should_be_charge_station_location_doc: STRING
		note
			EIS: "src=main.rsml", "ref=[1.4.2]", "type=trace"
			doc: "true"
			parts: "{REQUIREMENTS_DOCUMENTATION}.requirement_1_4_doc"
		do
			Result := "[
							[1.4.2] (parts of [1.4]) When drone location is equal to destination and attached parcel is equal to null then eventually drone location shall be equal to charge station location within 1500 [s].
					]"
		end
		
	when_assigned_parcel_is_not_null_then_eventually_drone_location_should_be_parcel_position_and_attached_parcel_should_not_be_null_doc: STRING
		note
			EIS: "src=main.rsml", "ref=[2]", "type=trace"
			doc: "true"
			refines: "{REQUIREMENTS_DOCUMENTATION}.when_drone_status_is_activated_then_eventually_attached_parcel_should_not_be_null_doc"
		do
			Result := "[
							[2] (refines [1.1.1]) When assigned parcel is not equal to null then eventually drone location shall be equal to parcel position and attached parcel shall be not equal to null within 120 [s].
					]"
		end
		
	when_drone_location_is_parcel_position_and_scanned_qr_code_is_not_assigned_parcel_then_immediately_application_status_must_be_invalid_parcel_doc: STRING
		note
			EIS: "src=main.rsml", "ref=[2.1]", "type=trace"
			doc: "true"
			alternative: "{REQUIREMENTS_DOCUMENTATION}.when_assigned_parcel_is_not_null_then_eventually_drone_location_should_be_parcel_position_and_attached_parcel_should_not_be_null_doc"
		do
			Result := "[
							[2.1] (is an alternative of [2]) When drone location is equal to parcel position and scanned QR code is not equal to assigned parcel then immediately application status must be equal to invalid parcel.
					]"
		end
		
	when_drone_location_is_parcel_position_and_scanned_qr_code_is_null_then_immediately_application_status_must_be_missing_parcel_doc: STRING
		note
			EIS: "src=main.rsml", "ref=[2.2]", "type=trace"
			doc: "true"
			alternative: "{REQUIREMENTS_DOCUMENTATION}.when_assigned_parcel_is_not_null_then_eventually_drone_location_should_be_parcel_position_and_attached_parcel_should_not_be_null_doc"
		do
			Result := "[
							[2.2] (is an alternative of [2]) When drone location is equal to parcel position and scanned QR code is equal to null then immediately application status must be equal to missing parcel.
					]"
		end
		
	_drone_status_must_be_standby_and_drone_alarm_must_be_on_doc: STRING
		note
			EIS: "src=main.rsml", "ref=[2.2.1]", "type=trace"
			doc: "true"
			refines: "{REQUIREMENTS_DOCUMENTATION}.when_drone_location_is_parcel_position_and_scanned_qr_code_is_null_then_immediately_application_status_must_be_missing_parcel_doc"
		do
			Result := "[
							[2.2.1] (refines [2.2]) The drone status must be equal to standby and the drone alarm must be equal to on.
					]"
		end
		
	when_drone_battery_status_is_less_or_equal_to_low_battery_status_then_immediately_drone_status_should_be_in_charge_doc: STRING
		note
			EIS: "src=main.rsml", "ref=[2.3]", "type=trace"
			doc: "true"
			alternative: "{REQUIREMENTS_DOCUMENTATION}.when_assigned_parcel_is_not_null_then_eventually_drone_location_should_be_parcel_position_and_attached_parcel_should_not_be_null_doc"
			repeats: "{REQUIREMENTS_DOCUMENTATION}.when_drone_status_is_in_charge_and_drone_battery_status_is_less_or_equal_to_low_battery_status_then_eventually_drone_status_must_be_in_charge_doc"
		do
			Result := "[
							[2.3] (is an alternative of [2] and repeats [3.3]) When drone battery status is less or equal to low battery status then immediately the drone status shall be equal to in charge.
					]"
		end
		
	_battery_status_in_application_must_be_drone_battery_status_doc: STRING
		note
			EIS: "src=main.rsml", "ref=[3.1]", "type=trace"
			doc: "true"
		do
			Result := "[
							[3.1] Battery status in application must be equal to drone battery status.
					]"
		end
		
	when_drone_battery_status_is_less_or_equal_to_low_battery_status_then_immediately_application_status_must_be_low_charge_doc: STRING
		note
			EIS: "src=main.rsml", "ref=[3.2]", "type=trace"
			doc: "true"
		do
			Result := "[
							[3.2] When drone battery status is less or equal to low battery status then immediately application status must be equal to low charge.
					]"
		end
		
	when_drone_status_is_in_charge_and_drone_battery_status_is_less_or_equal_to_low_battery_status_then_eventually_drone_status_must_be_in_charge_doc: STRING
		note
			EIS: "src=main.rsml", "ref=[3.3]", "type=trace"
			doc: "true"
		do
			Result := "[
							[3.3] When drone status is equal to in charge and drone battery status is less or equal to low battery status then eventually drone status must be equal to in charge.
					]"
		end
		
	when_attached_parcel_is_not_null_then_eventually_drone_location_should_be_destination_doc: STRING
		note
			EIS: "src=main.rsml", "ref=[4.1]", "type=trace"
			doc: "true"
			repeats: "{REQUIREMENTS_DOCUMENTATION}.when_attached_parcel_is_not_null_then_eventually_drone_location_should_be_destination_doc"
		do
			Result := "[
							[4.1] (repeats [1.1.2]) When attached parcel is not equal to null then eventually drone location shall be equal to destination within 1500 [s].
					]"
		end
		
	_drone_status_should_be_delivering_doc: STRING
		note
			EIS: "src=main.rsml", "ref=[4.1.1]", "type=trace"
			doc: "true"
			refines: "{REQUIREMENTS_DOCUMENTATION}.when_attached_parcel_is_not_null_then_eventually_drone_location_should_be_destination_doc"
		do
			Result := "[
							[4.1.1] (refines [4.1]) The drone status shall be equal to delivering.
					]"
		end
		
	when_assigned_parcel_is_not_null_then_immediately_destination_should_be_destination_for_parcel_from_webservice_doc: STRING
		note
			EIS: "src=main.rsml", "ref=[4.2]", "type=trace"
			doc: "true"
		do
			Result := "[
							[4.2] When assigned parcel is not equal to null then immediately the destination shall be equal to destination for the parcel from the webservice.
					]"
		end
		
	requirement_4_3_doc: STRING
	note
		EIS:"src=main.rsml", "ref=[4.3]", "type=trace"
		doc: "true"
	do
		Result := "[
					"Handled parcels must be transported carefully"
				]"
	end
	
	requirement_4_3_1_doc: STRING
	note
		EIS:"src=main.rsml", "ref=[4.3.1]", "type=trace"
		doc: "true"
		refines: "{REQUIREMENTS_DOCUMENTATION}.requirement_4_3_doc"
	do
		Result := "[
					"At any time, the drone avoids obstacles, flies at the minimum safe height and is able to stop in less than 1 second."
				]"
	end
	
	requirement_4_3_1_1_doc: STRING
	note
		EIS:"src=main.rsml", "ref=[4.3.1.1]", "type=trace"
		doc: "true"
		parts: "{REQUIREMENTS_DOCUMENTATION}.requirement_4_3_1_doc"
	do
		Result := "[
					"The drone must avoid the obstacles"
				]"
	end
	
	_nearest_obstacle_must_be_greater_than_1.50_doc: STRING
		note
			EIS: "src=main.rsml", "ref=[4.3.1.1.1]", "type=trace"
			doc: "true"
			refines: "{REQUIREMENTS_DOCUMENTATION}.requirement_4_3_1_1_doc"
		do
			Result := "[
							[4.3.1.1.1] (refines [4.3.1.1]) Nearest obstacle must be greater than 1.50 [m].
					]"
		end
		
	_drone_altitude_must_be_greater_than_minimum_safe_height_doc: STRING
		note
			EIS: "src=main.rsml", "ref=[4.3.1.2]", "type=trace"
			doc: "true"
			parts: "{REQUIREMENTS_DOCUMENTATION}.requirement_4_3_1_doc"
		do
			Result := "[
							[4.3.1.2] (parts of [4.3.1]) Drone altitude must be greater than minimum safe height.
					]"
		end
		
	requirement_4_3_1_2_1_doc: STRING
	note
		EIS:"src=main.rsml", "ref=[4.3.1.2.1]", "type=trace"
		doc: "true"
		trace: "{REQUIREMENTS_DOCUMENTATION}._drone_altitude_must_be_greater_than_minimum_safe_height_doc"
	do
		Result := "[
					
						This requirement is probably wrong, since there is no constraint. See []
				]"
	end
	
	_time_to_stop_must_be_less_than_1_doc: STRING
		note
			EIS: "src=main.rsml", "ref=[4.3.1.3]", "type=trace"
			doc: "true"
			parts: "{REQUIREMENTS_DOCUMENTATION}.requirement_4_3_1_doc"
		do
			Result := "[
							[4.3.1.3] (parts of [4.3.1]) Time to stop must be less than 1 [s].
					]"
		end
		
	requirement_4_3_2_doc: STRING
	note
		EIS:"src=main.rsml", "ref=[4.3.2]", "type=trace"
		doc: "true"
	do
		Result := "[
					"Parcels must be dropped carefully."
				]"
	end
	
	when_drone_position_is_destination_and_drone_status_is_release_then_immediately_drone_altitude_must_be_less_or_equal_to_10_doc: STRING
		note
			EIS: "src=main.rsml", "ref=[4.3.2.1]", "type=trace"
			doc: "true"
		do
			Result := "[
							[4.3.2.1] When drone position is equal to destination and drone status is equal to release then immediately the drone altitude must be less or equal to 10 [cm].
					]"
		end
		
	requirement_4_4_doc: STRING
	note
		EIS:"src=main.rsml", "ref=[4.4]", "type=trace"
		doc: "true"
	do
		Result := "[
					"If one or several components are malfunctioning, the drone send a message to an operator."
				]"
	end
	
	when_malfunction_status_is_true_then_immediately_application_status_must_be_malfunctioning_drone_doc: STRING
		note
			EIS: "src=main.rsml", "ref=[4.4.1]", "type=trace"
			doc: "true"
			refines: "{REQUIREMENTS_DOCUMENTATION}.requirement_4_4_doc"
		do
			Result := "[
							[4.4.1] (refines [4.4]) When malfunction status is equal to true then immediately application status must be equal to malfunctioning drone.
					]"
		end
		
	requirement_4_5_doc: STRING
	note
		EIS:"src=main.rsml", "ref=[4.5]", "type=trace"
		doc: "true"
	do
		Result := "[
					"When its battery is low, the drone sends a message and lands."
				]"
	end
	
	when_drone_battery_status_is_less_or_equal_to_low_battery_status_then_immediately_application_status_must_be_low_charge_doc: STRING
		note
			EIS: "src=main.rsml", "ref=[4.5.1]", "type=trace"
			doc: "true"
			parts: "{REQUIREMENTS_DOCUMENTATION}.requirement_4_5_doc"
			repeats: "{REQUIREMENTS_DOCUMENTATION}.when_drone_battery_status_is_less_or_equal_to_low_battery_status_then_immediately_application_status_must_be_low_charge_doc"
		do
			Result := "[
							[4.5.1] (parts of [4.5] and repeats [3.2]) When the drone battery status is less or equal to low battery status then immediately application status must be equal to low charge.
					]"
		end
		
	when_drone_battery_status_is_less_or_equal_to_low_battery_status_then_eventually_drone_altitude_must_be_0_doc: STRING
		note
			EIS: "src=main.rsml", "ref=[4.5.2]", "type=trace"
			doc: "true"
			parts: "{REQUIREMENTS_DOCUMENTATION}.requirement_4_5_doc"
			contradicts: "{REQUIREMENTS_DOCUMENTATION}._drone_altitude_must_be_greater_than_minimum_safe_height_doc"
		do
			Result := "[
							[4.5.2] (parts of [4.5] and contradicts [4.3.1.2]) When the drone battery status is less or equal to low battery status then eventually drone altitude must be equal to 0 [cm].
					]"
		end
		
	when_distance_to_warehouse_is_greater_than_500_and_drone_battery_status_is_less_or_equal_to_low_battery_status_then_eventually_drone_mode_must_be_recovery_mode_and_position_in_application_must_be_drone_location_and_drone_altitude_must_be_0_doc: STRING
		note
			EIS: "src=main.rsml", "ref=[4.5.3]", "type=trace"
			doc: "true"
		do
			Result := "[
							[4.5.3] When the distance to warehouse is greater than 500 [m] and the drone battery status is less or equal to low battery status then eventually drone mode must be equal to recovery mode and position in application must be equal to drone location and drone altitude must be equal to 0 [cm].
					]"
		end
		
	when_distance_to_warehouse_is_greater_than_500_then_immediately_position_in_application_must_be_drone_location_doc: STRING
		note
			EIS: "src=main.rsml", "ref=[4.5.3.1]", "type=trace"
			doc: "true"
			parts: "{REQUIREMENTS_DOCUMENTATION}.when_distance_to_warehouse_is_greater_than_500_and_drone_battery_status_is_less_or_equal_to_low_battery_status_then_eventually_drone_mode_must_be_recovery_mode_and_position_in_application_must_be_drone_location_and_drone_altitude_must_be_0_doc"
		do
			Result := "[
							[4.5.3.1] (parts of [4.5.3]) When the distance to warehouse is greater than 500 [m] then immediately position in application must be equal to drone location.
					]"
		end
		
	when_drone_battery_status_is_less_or_equal_to_low_battery_status_then_eventually_drone_mode_must_be_recovery_mode_and_drone_altitude_must_be_0_doc: STRING
		note
			EIS: "src=main.rsml", "ref=[4.5.3.2]", "type=trace"
			doc: "true"
			parts: "{REQUIREMENTS_DOCUMENTATION}.when_distance_to_warehouse_is_greater_than_500_and_drone_battery_status_is_less_or_equal_to_low_battery_status_then_eventually_drone_mode_must_be_recovery_mode_and_position_in_application_must_be_drone_location_and_drone_altitude_must_be_0_doc"
		do
			Result := "[
							[4.5.3.2] (parts of [4.5.3]) When the drone battery status is less or equal to low battery status then eventually drone mode must be equal to recovery mode and drone altitude must be equal to 0 [cm] within 120 [s].
					]"
		end
		
	requirement_5_doc: STRING
	note
		EIS:"src=main.rsml", "ref=[5]", "type=trace"
		doc: "true"
	do
		Result := "[
					"Parcels are dropped at destination and parcels drop locations are confirmed by an operator."
				]"
	end
	
	when_drone_location_is_destination_then_eventually_attached_parcel_should_be_null_and_drop_location_status_should_be_confirmed_doc: STRING
		note
			EIS: "src=main.rsml", "ref=[5.1]", "type=trace"
			doc: "true"
			refines: "{REQUIREMENTS_DOCUMENTATION}.requirement_5_doc"
			adds: "{REQUIREMENTS_DOCUMENTATION}.when_drone_location_is_destination_then_eventually_attached_parcel_should_be_null_doc"
		do
			Result := "[
							[5.1] (refines [5] and is an addition of [1.1.3]) When drone location is equal to destination then eventually attached parcel shall be equal to null and drop location status shall be equal to confirmed.
					]"
		end
		
	when_drop_location_status_is_confirmed_then_eventually_attached_parcel_should_be_null_and_assigned_parcel_should_be_null_doc: STRING
		note
			EIS: "src=main.rsml", "ref=[5.1.1]", "type=trace"
			doc: "true"
			parts: "{REQUIREMENTS_DOCUMENTATION}.when_drone_location_is_destination_then_eventually_attached_parcel_should_be_null_and_drop_location_status_should_be_confirmed_doc"
		do
			Result := "[
							[5.1.1] (parts of [5.1]) When drop location status is equal to confirmed then eventually attached parcel shall be equal to null and assigned parcel shall be equal to null within 120 [s].
					]"
		end
		
	requirement_6_doc: STRING
	note
		EIS:"src=main.rsml", "ref=[6]", "type=trace"
		doc: "true"
		repeats: "{REQUIREMENTS_DOCUMENTATION}.requirement_1_4_doc"
	do
		Result := "[
					"When the drone has no more parcel assigned and attached, the drone shall go back to its charge station."
				]"
	end
	
	when_assigned_parcel_is_null_and_attached_parcel_is_null_then_eventually_drone_location_should_be_charge_station_location_doc: STRING
		note
			EIS: "src=main.rsml", "ref=[6.1]", "type=trace"
			doc: "true"
			refines: "{REQUIREMENTS_DOCUMENTATION}.requirement_6_doc"
			refines: "{REQUIREMENTS_DOCUMENTATION}.when_drone_location_is_destination_and_attached_parcel_is_null_then_eventually_drone_location_should_be_charge_station_location_doc"
		do
			Result := "[
							[6.1] (refines [6] and refines [1.4.2]) When assigned parcel is equal to null and attached parcel is equal to null then eventually drone location shall be equal to charge station location within 1500 [s].
					]"
		end
		
	requirement_7_1_doc: STRING
	note
		EIS:"src=main.rsml", "ref=[7.1]", "type=trace"
		doc: "true"
	do
		Result := "[
					"The drone shall be able to fly during 1 hour."
				]"
	end
	
	requirement_7_2_doc: STRING
	note
		EIS:"src=main.rsml", "ref=[7.2]", "type=trace"
		doc: "true"
	do
		Result := "[
					"The drone shall be able to fly inside and outside."
				]"
	end
	
end

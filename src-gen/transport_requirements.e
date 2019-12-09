note
	EIS: "src=main.rsml", "ref=Transport", "type=trace"
	description: "[
	This class contains requirements in the context of: Transport.
]"
class TRANSPORT_REQUIREMENTS
inherit
	DOMAIN_KNOWLEDGE
feature
	-- For temporal requirements
	duration: DOUBLE
	
	-- States range
	delivering : DOUBLE = 1
	destination_for_parcel_from_webservice : DOUBLE = 2
	null : DOUBLE = 3
	low_charge : DOUBLE = 4
	recovery_mode : DOUBLE = 5
	release : DOUBLE = 6
	low_battery_status : DOUBLE = 7
	malfunctioning_drone : DOUBLE = 8
	true : DOUBLE = 9
	minimum_safe_height : DOUBLE = 10
	
	-- States
	drone_altitude : DOUBLE
	nearest_obstacle : DOUBLE
	destination : DOUBLE
	drone_position : DOUBLE
	drone_location : DOUBLE
	drone_status : DOUBLE
	drone_mode : DOUBLE
	position_in_application : DOUBLE
	distance_to_warehouse : DOUBLE
	attached_parcel : DOUBLE
	drone_battery_status : DOUBLE
	application_status : DOUBLE
	malfunction_status : DOUBLE
	time_to_stop : DOUBLE
	assigned_parcel : DOUBLE

feature -- Requirements

	when_attached_parcel_is_not_null_then_eventually_drone_location_should_be_destination
	note
		doc: "{REQUIREMENTS_DOCUMENTATION}.when_attached_parcel_is_not_null_then_eventually_drone_location_should_be_destination_doc"
		EIS: "src=main.rsml", "ref={BEHAVIOR_REQUIREMENTS}.1.1.2", "type=repeats"
	do
		from
			check assume: (attached_parcel /= null) end
			-- Add call to specification
		until
			((drone_location = destination)) or
			(duration - old duration) > 1500
		loop
			check assume: (attached_parcel /= null) end
			-- Add call to specification
		end
		check assert: (drone_location = destination) end
		check assert: (duration - old duration) <= 1500 end
	end
	
	_drone_status_should_be_delivering
	note
		doc: "{REQUIREMENTS_DOCUMENTATION}._drone_status_should_be_delivering_doc"
		EIS: "src=main.rsml", "ref={TRANSPORT_REQUIREMENTS}.4.1", "type=refines"
	do
		from
			-- Add call to specification
		until
			((drone_status = delivering)) or
			(duration - old duration) > 31536000 -- seconds (equivalent to 1 year)
		loop
			-- Add call to specification
		end
		check assert: (drone_status = delivering) end
		check assert: (duration - old duration) <= 31536000 end -- seconds (equivalent to 1 year)
	end
	
	when_assigned_parcel_is_not_null_then_immediately_destination_should_be_destination_for_parcel_from_webservice
	note
		doc: "{REQUIREMENTS_DOCUMENTATION}.when_assigned_parcel_is_not_null_then_immediately_destination_should_be_destination_for_parcel_from_webservice_doc"
	require
		when_assigned_parcel_is_not_equal_to_null: (assigned_parcel /= null)
	deferred
	ensure
		check_destination_shall_be_equal_to_destination_for_parcel_from_webservice: (destination = destination_for_parcel_from_webservice)
	end
	
	requirement_4_3
	note
		doc: "{REQUIREMENTS_DOCUMENTATION}.requirement_4_3_doc"
	deferred
	end
	
	requirement_4_3_1
	note
		doc: "{REQUIREMENTS_DOCUMENTATION}.requirement_4_3_1_doc"
		EIS: "src=main.rsml", "ref={TRANSPORT_REQUIREMENTS}.4.3", "type=refines"
	deferred
	end
	
	requirement_4_3_1_1
	note
		doc: "{REQUIREMENTS_DOCUMENTATION}.requirement_4_3_1_1_doc"
		EIS: "src=main.rsml", "ref={TRANSPORT_REQUIREMENTS}.4.3.1", "type=parts"
	deferred
	end
	
	_nearest_obstacle_must_be_greater_than_1.50
	note
		doc: "{REQUIREMENTS_DOCUMENTATION}._nearest_obstacle_must_be_greater_than_1.50_doc"
		EIS: "src=main.rsml", "ref={TRANSPORT_REQUIREMENTS}.4.3.1.1", "type=refines"
	do
		from
			-- Add call to specification
		until
			((nearest_obstacle > 1.50)) or
			(duration - old duration) > 31536000 -- seconds (equivalent to 1 year)
		loop
			-- Add call to specification
		end
		check assert: (nearest_obstacle > 1.50) end
		check assert: (duration - old duration) <= 31536000 end -- seconds (equivalent to 1 year)
	end
	
	_drone_altitude_must_be_greater_than_minimum_safe_height
	note
		doc: "{REQUIREMENTS_DOCUMENTATION}._drone_altitude_must_be_greater_than_minimum_safe_height_doc"
		EIS: "src=main.rsml", "ref={TRANSPORT_REQUIREMENTS}.4.3.1", "type=parts"
	do
		from
			-- Add call to specification
		until
			((drone_altitude > minimum_safe_height)) or
			(duration - old duration) > 31536000 -- seconds (equivalent to 1 year)
		loop
			-- Add call to specification
		end
		check assert: (drone_altitude > minimum_safe_height) end
		check assert: (duration - old duration) <= 31536000 end -- seconds (equivalent to 1 year)
	end
	
	requirement_4_3_1_2_1
	note
		doc: "{REQUIREMENTS_DOCUMENTATION}.requirement_4_3_1_2_1_doc"
		EIS: "src=main.rsml", "ref={TRANSPORT_REQUIREMENTS}.4.3.1.2", "type=trace"
	deferred
	end
	
	_time_to_stop_must_be_less_than_1
	note
		doc: "{REQUIREMENTS_DOCUMENTATION}._time_to_stop_must_be_less_than_1_doc"
		EIS: "src=main.rsml", "ref={TRANSPORT_REQUIREMENTS}.4.3.1", "type=parts"
	do
		from
			-- Add call to specification
		until
			((time_to_stop < 1)) or
			(duration - old duration) > 31536000 -- seconds (equivalent to 1 year)
		loop
			-- Add call to specification
		end
		check assert: (time_to_stop < 1) end
		check assert: (duration - old duration) <= 31536000 end -- seconds (equivalent to 1 year)
	end
	
	requirement_4_3_2
	note
		doc: "{REQUIREMENTS_DOCUMENTATION}.requirement_4_3_2_doc"
	deferred
	end
	
	when_drone_position_is_destination_and_drone_status_is_release_then_immediately_drone_altitude_must_be_less_or_equal_to_10
	note
		doc: "{REQUIREMENTS_DOCUMENTATION}.when_drone_position_is_destination_and_drone_status_is_release_then_immediately_drone_altitude_must_be_less_or_equal_to_10_doc"
	require
		when_drone_position_is_equal_to_destination: (drone_position = destination)
		when_drone_status_is_equal_to_release: (drone_status = release)
	deferred
	ensure
		check_drone_altitude_must_be_less_or_equal_to_10_cm: (drone_altitude <= 10)
	end
	
	requirement_4_4
	note
		doc: "{REQUIREMENTS_DOCUMENTATION}.requirement_4_4_doc"
	deferred
	end
	
	when_malfunction_status_is_true_then_immediately_application_status_must_be_malfunctioning_drone
	note
		doc: "{REQUIREMENTS_DOCUMENTATION}.when_malfunction_status_is_true_then_immediately_application_status_must_be_malfunctioning_drone_doc"
		EIS: "src=main.rsml", "ref={TRANSPORT_REQUIREMENTS}.4.4", "type=refines"
	require
		when_malfunction_status_is_equal_to_true: (malfunction_status = true)
	deferred
	ensure
		check_application_status_must_be_equal_to_malfunctioning_drone: (application_status = malfunctioning_drone)
	end
	
	requirement_4_5
	note
		doc: "{REQUIREMENTS_DOCUMENTATION}.requirement_4_5_doc"
	deferred
	end
	
	when_drone_battery_status_is_less_or_equal_to_low_battery_status_then_immediately_application_status_must_be_low_charge
	note
		doc: "{REQUIREMENTS_DOCUMENTATION}.when_drone_battery_status_is_less_or_equal_to_low_battery_status_then_immediately_application_status_must_be_low_charge_doc"
		EIS: "src=main.rsml", "ref={TRANSPORT_REQUIREMENTS}.4.5", "type=parts"
		EIS: "src=main.rsml", "ref={STATUS_REQUIREMENTS}.3.2", "type=repeats"
	require
		when_drone_battery_status_is_less_or_equal_to_low_battery_status: (drone_battery_status <= low_battery_status)
	deferred
	ensure
		check_application_status_must_be_equal_to_low_charge: (application_status = low_charge)
	end
	
	when_drone_battery_status_is_less_or_equal_to_low_battery_status_then_eventually_drone_altitude_must_be_0
	note
		doc: "{REQUIREMENTS_DOCUMENTATION}.when_drone_battery_status_is_less_or_equal_to_low_battery_status_then_eventually_drone_altitude_must_be_0_doc"
		EIS: "src=main.rsml", "ref={TRANSPORT_REQUIREMENTS}.4.5", "type=parts"
		EIS: "src=main.rsml", "ref={TRANSPORT_REQUIREMENTS}.4.3.1.2", "type=contradicts"
	do
		from
			check assume: (drone_battery_status <= low_battery_status) end
			-- Add call to specification
		until
			((drone_altitude = 0)) or
			(duration - old duration) > 31536000 -- seconds (equivalent to 1 year)
		loop
			check assume: (drone_battery_status <= low_battery_status) end
			-- Add call to specification
		end
		check assert: (drone_altitude = 0) end
		check assert: (duration - old duration) <= 31536000 end -- seconds (equivalent to 1 year)
	end
	
	when_distance_to_warehouse_is_greater_than_500_and_drone_battery_status_is_less_or_equal_to_low_battery_status_then_eventually_drone_mode_must_be_recovery_mode_and_position_in_application_must_be_drone_location_and_drone_altitude_must_be_0
	note
		doc: "{REQUIREMENTS_DOCUMENTATION}.when_distance_to_warehouse_is_greater_than_500_and_drone_battery_status_is_less_or_equal_to_low_battery_status_then_eventually_drone_mode_must_be_recovery_mode_and_position_in_application_must_be_drone_location_and_drone_altitude_must_be_0_doc"
	do
		from
			check assume: (distance_to_warehouse > 500) end
			check assume: (drone_battery_status <= low_battery_status) end
			-- Add call to specification
		until
			((drone_mode = recovery_mode) and (position_in_application = drone_location) and (drone_altitude = 0)) or
			(duration - old duration) > 31536000 -- seconds (equivalent to 1 year)
		loop
			check assume: (distance_to_warehouse > 500) end
			check assume: (drone_battery_status <= low_battery_status) end
			-- Add call to specification
		end
		check assert: (drone_mode = recovery_mode) end
		check assert: (position_in_application = drone_location) end
		check assert: (drone_altitude = 0) end
		check assert: (duration - old duration) <= 31536000 end -- seconds (equivalent to 1 year)
	end
	
	when_distance_to_warehouse_is_greater_than_500_then_immediately_position_in_application_must_be_drone_location
	note
		doc: "{REQUIREMENTS_DOCUMENTATION}.when_distance_to_warehouse_is_greater_than_500_then_immediately_position_in_application_must_be_drone_location_doc"
		EIS: "src=main.rsml", "ref={TRANSPORT_REQUIREMENTS}.4.5.3", "type=parts"
	require
		when_distance_to_warehouse_is_greater_than_500_m: (distance_to_warehouse > 500)
	deferred
	ensure
		check_position_in_application_must_be_equal_to_drone_location: (position_in_application = drone_location)
	end
	
	when_drone_battery_status_is_less_or_equal_to_low_battery_status_then_eventually_drone_mode_must_be_recovery_mode_and_drone_altitude_must_be_0
	note
		doc: "{REQUIREMENTS_DOCUMENTATION}.when_drone_battery_status_is_less_or_equal_to_low_battery_status_then_eventually_drone_mode_must_be_recovery_mode_and_drone_altitude_must_be_0_doc"
		EIS: "src=main.rsml", "ref={TRANSPORT_REQUIREMENTS}.4.5.3", "type=parts"
	do
		from
			check assume: (drone_battery_status <= low_battery_status) end
			-- Add call to specification
		until
			((drone_mode = recovery_mode) and (drone_altitude = 0)) or
			(duration - old duration) > 120
		loop
			check assume: (drone_battery_status <= low_battery_status) end
			-- Add call to specification
		end
		check assert: (drone_mode = recovery_mode) end
		check assert: (drone_altitude = 0) end
		check assert: (duration - old duration) <= 120 end
	end
	
end

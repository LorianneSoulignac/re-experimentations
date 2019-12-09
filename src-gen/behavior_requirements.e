note
	EIS: "src=main.rsml", "ref=Behavior", "type=trace"
	description: "[
	This class contains requirements in the context of: Behavior.
]"
class BEHAVIOR_REQUIREMENTS
inherit
	DOMAIN_KNOWLEDGE
feature
	-- For temporal requirements
	duration: DOUBLE
	
	-- States range
	null : DOUBLE = 1
	destination : DOUBLE = 2
	charge_station_location : DOUBLE = 3
	return : DOUBLE = 4
	activated : DOUBLE = 5
	
	-- States
	drone_location : DOUBLE
	drone_status : DOUBLE
	assigned_parcel : DOUBLE
	attached_parcel : DOUBLE
	parcel_position : DOUBLE

feature -- Requirements

	requirement_1_1
	note
		doc: "{REQUIREMENTS_DOCUMENTATION}.requirement_1_1_doc"
	deferred
	end
	
	when_drone_status_is_activated_then_eventually_attached_parcel_should_not_be_null
	note
		doc: "{REQUIREMENTS_DOCUMENTATION}.when_drone_status_is_activated_then_eventually_attached_parcel_should_not_be_null_doc"
		EIS: "src=main.rsml", "ref={BEHAVIOR_REQUIREMENTS}.1.1", "type=parts"
	do
		from
			check assume: (drone_status = activated) end
			-- Add call to specification
		until
			((attached_parcel /= null)) or
			(duration - old duration) > 120
		loop
			check assume: (drone_status = activated) end
			-- Add call to specification
		end
		check assert: (attached_parcel /= null) end
		check assert: (duration - old duration) <= 120 end
	end
	
	when_attached_parcel_is_not_null_then_eventually_drone_location_should_be_destination
	note
		doc: "{REQUIREMENTS_DOCUMENTATION}.when_attached_parcel_is_not_null_then_eventually_drone_location_should_be_destination_doc"
		EIS: "src=main.rsml", "ref={BEHAVIOR_REQUIREMENTS}.1.1", "type=parts"
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
	
	when_drone_location_is_destination_then_eventually_attached_parcel_should_be_null
	note
		doc: "{REQUIREMENTS_DOCUMENTATION}.when_drone_location_is_destination_then_eventually_attached_parcel_should_be_null_doc"
		EIS: "src=main.rsml", "ref={BEHAVIOR_REQUIREMENTS}.1.1", "type=parts"
		EIS: "src=main.rsml", "ref={BEHAVIOR_REQUIREMENTS}.1.4", "type=parts"
	do
		from
			check assume: (drone_location = destination) end
			-- Add call to specification
		until
			((attached_parcel = null)) or
			(duration - old duration) > 120
		loop
			check assume: (drone_location = destination) end
			-- Add call to specification
		end
		check assert: (attached_parcel = null) end
		check assert: (duration - old duration) <= 120 end
	end
	
	requirement_1_2
	note
		doc: "{REQUIREMENTS_DOCUMENTATION}.requirement_1_2_doc"
	deferred
	end
	
	when_drone_status_is_activated_then_immediately_assigned_parcel_should_not_be_null_and_parcel_position_should_not_be_null
	note
		doc: "{REQUIREMENTS_DOCUMENTATION}.when_drone_status_is_activated_then_immediately_assigned_parcel_should_not_be_null_and_parcel_position_should_not_be_null_doc"
		EIS: "src=main.rsml", "ref={BEHAVIOR_REQUIREMENTS}.1.2", "type=parts"
	require
		when_drone_status_is_equal_to_activated: (drone_status = activated)
	deferred
	ensure
		check_assigned_parcel_shall_be_not_equal_to_null: (assigned_parcel /= null)
		check_parcel_position_shall_be_not_equal_to_null: (parcel_position /= null)
	end
	
	requirement_1_3
	note
		doc: "{REQUIREMENTS_DOCUMENTATION}.requirement_1_3_doc"
		EIS: "src=main.rsml", "ref={BEHAVIOR_REQUIREMENTS}.1.1", "type=repeats"
	deferred
	end
	
	requirement_1_4
	note
		doc: "{REQUIREMENTS_DOCUMENTATION}.requirement_1_4_doc"
	deferred
	end
	
	when_drone_location_is_destination_and_attached_parcel_is_null_then_immediately_drone_status_should_be_return
	note
		doc: "{REQUIREMENTS_DOCUMENTATION}.when_drone_location_is_destination_and_attached_parcel_is_null_then_immediately_drone_status_should_be_return_doc"
		EIS: "src=main.rsml", "ref={BEHAVIOR_REQUIREMENTS}.1.4", "type=parts"
	require
		when_drone_location_is_equal_to_destination: (drone_location = destination)
		when_attached_parcel_is_equal_to_null: (attached_parcel = null)
	deferred
	ensure
		check_drone_status_shall_be_equal_to_return: (drone_status = return)
	end
	
	when_drone_location_is_destination_and_attached_parcel_is_null_then_eventually_drone_location_should_be_charge_station_location
	note
		doc: "{REQUIREMENTS_DOCUMENTATION}.when_drone_location_is_destination_and_attached_parcel_is_null_then_eventually_drone_location_should_be_charge_station_location_doc"
		EIS: "src=main.rsml", "ref={BEHAVIOR_REQUIREMENTS}.1.4", "type=parts"
	do
		from
			check assume: (drone_location = destination) end
			check assume: (attached_parcel = null) end
			-- Add call to specification
		until
			((drone_location = charge_station_location)) or
			(duration - old duration) > 1500
		loop
			check assume: (drone_location = destination) end
			check assume: (attached_parcel = null) end
			-- Add call to specification
		end
		check assert: (drone_location = charge_station_location) end
		check assert: (duration - old duration) <= 1500 end
	end
	
end

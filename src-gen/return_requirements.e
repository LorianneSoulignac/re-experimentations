note
	EIS: "src=main.rsml", "ref=Return", "type=trace"
	description: "[
	This class contains requirements in the context of: Return.
]"
class RETURN_REQUIREMENTS
inherit
	DOMAIN_KNOWLEDGE
feature
	-- For temporal requirements
	duration: DOUBLE
	
	-- States range
	null : DOUBLE = 1
	charge_station_location : DOUBLE = 2
	
	-- States
	drone_location : DOUBLE
	assigned_parcel : DOUBLE
	attached_parcel : DOUBLE

feature -- Requirements

	requirement_6
	note
		doc: "{REQUIREMENTS_DOCUMENTATION}.requirement_6_doc"
		EIS: "src=main.rsml", "ref={BEHAVIOR_REQUIREMENTS}.1.4", "type=repeats"
	deferred
	end
	
	when_assigned_parcel_is_null_and_attached_parcel_is_null_then_eventually_drone_location_should_be_charge_station_location
	note
		doc: "{REQUIREMENTS_DOCUMENTATION}.when_assigned_parcel_is_null_and_attached_parcel_is_null_then_eventually_drone_location_should_be_charge_station_location_doc"
		EIS: "src=main.rsml", "ref={RETURN_REQUIREMENTS}.6", "type=refines"
		EIS: "src=main.rsml", "ref={BEHAVIOR_REQUIREMENTS}.1.4.2", "type=refines"
	do
		from
			check assume: (assigned_parcel = null) end
			check assume: (attached_parcel = null) end
			-- Add call to specification
		until
			((drone_location = charge_station_location)) or
			(duration - old duration) > 1500
		loop
			check assume: (assigned_parcel = null) end
			check assume: (attached_parcel = null) end
			-- Add call to specification
		end
		check assert: (drone_location = charge_station_location) end
		check assert: (duration - old duration) <= 1500 end
	end
	
end

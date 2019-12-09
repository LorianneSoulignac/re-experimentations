note
	EIS: "src=main.rsml", "ref=Drop", "type=trace"
	description: "[
	This class contains requirements in the context of: Drop.
]"
class DROP_REQUIREMENTS
inherit
	DOMAIN_KNOWLEDGE
feature
	-- For temporal requirements
	duration: DOUBLE
	
	-- States range
	null : DOUBLE = 1
	destination : DOUBLE = 2
	confirmed : DOUBLE = 3
	
	-- States
	drop_location_status : DOUBLE
	drone_location : DOUBLE
	assigned_parcel : DOUBLE
	attached_parcel : DOUBLE

feature -- Requirements

	requirement_5
	note
		doc: "{REQUIREMENTS_DOCUMENTATION}.requirement_5_doc"
	deferred
	end
	
	when_drone_location_is_destination_then_eventually_attached_parcel_should_be_null_and_drop_location_status_should_be_confirmed
	note
		doc: "{REQUIREMENTS_DOCUMENTATION}.when_drone_location_is_destination_then_eventually_attached_parcel_should_be_null_and_drop_location_status_should_be_confirmed_doc"
		EIS: "src=main.rsml", "ref={DROP_REQUIREMENTS}.5", "type=refines"
		EIS: "src=main.rsml", "ref={BEHAVIOR_REQUIREMENTS}.1.1.3", "type=adds"
	do
		from
			check assume: (drone_location = destination) end
			-- Add call to specification
		until
			((attached_parcel = null) and (drop_location_status = confirmed)) or
			(duration - old duration) > 31536000 -- seconds (equivalent to 1 year)
		loop
			check assume: (drone_location = destination) end
			-- Add call to specification
		end
		check assert: (attached_parcel = null) end
		check assert: (drop_location_status = confirmed) end
		check assert: (duration - old duration) <= 31536000 end -- seconds (equivalent to 1 year)
	end
	
	when_drop_location_status_is_confirmed_then_eventually_attached_parcel_should_be_null_and_assigned_parcel_should_be_null
	note
		doc: "{REQUIREMENTS_DOCUMENTATION}.when_drop_location_status_is_confirmed_then_eventually_attached_parcel_should_be_null_and_assigned_parcel_should_be_null_doc"
		EIS: "src=main.rsml", "ref={DROP_REQUIREMENTS}.5.1", "type=parts"
	do
		from
			check assume: (drop_location_status = confirmed) end
			-- Add call to specification
		until
			((attached_parcel = null) and (assigned_parcel = null)) or
			(duration - old duration) > 120
		loop
			check assume: (drop_location_status = confirmed) end
			-- Add call to specification
		end
		check assert: (attached_parcel = null) end
		check assert: (assigned_parcel = null) end
		check assert: (duration - old duration) <= 120 end
	end
	
end

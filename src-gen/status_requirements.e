note
	EIS: "src=main.rsml", "ref=Status", "type=trace"
	description: "[
	This class contains requirements in the context of: Status.
]"
class STATUS_REQUIREMENTS
inherit
	DOMAIN_KNOWLEDGE
feature
	-- For temporal requirements
	duration: DOUBLE
	
	-- States range
	low_charge : DOUBLE = 1
	in_charge : DOUBLE = 2
	low_battery_status : DOUBLE = 3
	
	-- States
	drone_battery_status : DOUBLE
	application_status : DOUBLE
	drone_status : DOUBLE
	battery_status_in_application : DOUBLE

feature -- Requirements

	_battery_status_in_application_must_be_drone_battery_status
	note
		doc: "{REQUIREMENTS_DOCUMENTATION}._battery_status_in_application_must_be_drone_battery_status_doc"
	do
		from
			-- Add call to specification
		until
			((battery_status_in_application = drone_battery_status)) or
			(duration - old duration) > 31536000 -- seconds (equivalent to 1 year)
		loop
			-- Add call to specification
		end
		check assert: (battery_status_in_application = drone_battery_status) end
		check assert: (duration - old duration) <= 31536000 end -- seconds (equivalent to 1 year)
	end
	
	when_drone_battery_status_is_less_or_equal_to_low_battery_status_then_immediately_application_status_must_be_low_charge
	note
		doc: "{REQUIREMENTS_DOCUMENTATION}.when_drone_battery_status_is_less_or_equal_to_low_battery_status_then_immediately_application_status_must_be_low_charge_doc"
	require
		when_drone_battery_status_is_less_or_equal_to_low_battery_status: (drone_battery_status <= low_battery_status)
	deferred
	ensure
		check_application_status_must_be_equal_to_low_charge: (application_status = low_charge)
	end
	
	when_drone_status_is_in_charge_and_drone_battery_status_is_less_or_equal_to_low_battery_status_then_eventually_drone_status_must_be_in_charge
	note
		doc: "{REQUIREMENTS_DOCUMENTATION}.when_drone_status_is_in_charge_and_drone_battery_status_is_less_or_equal_to_low_battery_status_then_eventually_drone_status_must_be_in_charge_doc"
	do
		from
			check assume: (drone_status = in_charge) end
			check assume: (drone_battery_status <= low_battery_status) end
			-- Add call to specification
		until
			((drone_status = in_charge)) or
			(duration - old duration) > 31536000 -- seconds (equivalent to 1 year)
		loop
			check assume: (drone_status = in_charge) end
			check assume: (drone_battery_status <= low_battery_status) end
			-- Add call to specification
		end
		check assert: (drone_status = in_charge) end
		check assert: (duration - old duration) <= 31536000 end -- seconds (equivalent to 1 year)
	end
	
end

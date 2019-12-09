note
	EIS: "src=main.rsml", "ref=Handling", "type=trace"
	description: "[
	This class contains requirements in the context of: Handling.
]"
class HANDLING_REQUIREMENTS
inherit
	DOMAIN_KNOWLEDGE
feature
	-- For temporal requirements
	duration: DOUBLE
	
	-- States range
	missing_parcel : DOUBLE = 1
	null : DOUBLE = 2
	standby : DOUBLE = 3
	in_charge : DOUBLE = 4
	low_battery_status : DOUBLE = 5
	invalid_parcel : DOUBLE = 6
	parcel_position : DOUBLE = 7
	on : DOUBLE = 8
	
	-- States
	drone_battery_status : DOUBLE
	scanned_qr_code : DOUBLE
	drone_alarm : DOUBLE
	drone_location : DOUBLE
	application_status : DOUBLE
	drone_status : DOUBLE
	assigned_parcel : DOUBLE
	attached_parcel : DOUBLE

feature -- Requirements

	when_assigned_parcel_is_not_null_then_eventually_drone_location_should_be_parcel_position_and_attached_parcel_should_not_be_null
	note
		doc: "{REQUIREMENTS_DOCUMENTATION}.when_assigned_parcel_is_not_null_then_eventually_drone_location_should_be_parcel_position_and_attached_parcel_should_not_be_null_doc"
		EIS: "src=main.rsml", "ref={BEHAVIOR_REQUIREMENTS}.1.1.1", "type=refines"
	do
		from
			check assume: (assigned_parcel /= null) end
			-- Add call to specification
		until
			((drone_location = parcel_position) and (attached_parcel /= null)) or
			(duration - old duration) > 120
		loop
			check assume: (assigned_parcel /= null) end
			-- Add call to specification
		end
		check assert: (drone_location = parcel_position) end
		check assert: (attached_parcel /= null) end
		check assert: (duration - old duration) <= 120 end
	end
	
	when_drone_location_is_parcel_position_and_scanned_qr_code_is_not_assigned_parcel_then_immediately_application_status_must_be_invalid_parcel
	note
		doc: "{REQUIREMENTS_DOCUMENTATION}.when_drone_location_is_parcel_position_and_scanned_qr_code_is_not_assigned_parcel_then_immediately_application_status_must_be_invalid_parcel_doc"
		EIS: "src=main.rsml", "ref={HANDLING_REQUIREMENTS}.2", "type=alternative"
	require
		when_drone_location_is_equal_to_parcel_position: (drone_location = parcel_position)
		when_scanned_qr_code_is_not_equal_to_assigned_parcel: (scanned_qr_code /= assigned_parcel)
	deferred
	ensure
		check_application_status_must_be_equal_to_invalid_parcel: (application_status = invalid_parcel)
	end
	
	when_drone_location_is_parcel_position_and_scanned_qr_code_is_null_then_immediately_application_status_must_be_missing_parcel
	note
		doc: "{REQUIREMENTS_DOCUMENTATION}.when_drone_location_is_parcel_position_and_scanned_qr_code_is_null_then_immediately_application_status_must_be_missing_parcel_doc"
		EIS: "src=main.rsml", "ref={HANDLING_REQUIREMENTS}.2", "type=alternative"
	require
		when_drone_location_is_equal_to_parcel_position: (drone_location = parcel_position)
		when_scanned_qr_code_is_equal_to_null: (scanned_qr_code = null)
	deferred
	ensure
		check_application_status_must_be_equal_to_missing_parcel: (application_status = missing_parcel)
	end
	
	_drone_status_must_be_standby_and_drone_alarm_must_be_on
	note
		doc: "{REQUIREMENTS_DOCUMENTATION}._drone_status_must_be_standby_and_drone_alarm_must_be_on_doc"
		EIS: "src=main.rsml", "ref={HANDLING_REQUIREMENTS}.2.2", "type=refines"
	do
		from
			-- Add call to specification
		until
			((drone_status = standby) and (drone_alarm = on)) or
			(duration - old duration) > 31536000 -- seconds (equivalent to 1 year)
		loop
			-- Add call to specification
		end
		check assert: (drone_status = standby) end
		check assert: (drone_alarm = on) end
		check assert: (duration - old duration) <= 31536000 end -- seconds (equivalent to 1 year)
	end
	
	when_drone_battery_status_is_less_or_equal_to_low_battery_status_then_immediately_drone_status_should_be_in_charge
	note
		doc: "{REQUIREMENTS_DOCUMENTATION}.when_drone_battery_status_is_less_or_equal_to_low_battery_status_then_immediately_drone_status_should_be_in_charge_doc"
		EIS: "src=main.rsml", "ref={HANDLING_REQUIREMENTS}.2", "type=alternative"
		EIS: "src=main.rsml", "ref={STATUS_REQUIREMENTS}.3.3", "type=repeats"
	require
		when_drone_battery_status_is_less_or_equal_to_low_battery_status: (drone_battery_status <= low_battery_status)
	deferred
	ensure
		check_drone_status_shall_be_equal_to_in_charge: (drone_status = in_charge)
	end
	
end

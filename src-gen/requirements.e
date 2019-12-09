note
	EIS: "src=main.rsml", "ref=globals requirements", "type=trace"
	description: "[
	This class contains globals requirements.
]"
class REQUIREMENTS
inherit
	DOMAIN_KNOWLEDGE
feature
	-- For temporal requirements
	duration: DOUBLE
	
	-- States range
	control_mode : DOUBLE = 1
	normal_mode : DOUBLE = 2
	
	-- States
	drone_mode : DOUBLE

feature -- Requirements

	requirement_0_1
	note
		doc: "{REQUIREMENTS_DOCUMENTATION}.requirement_0_1_doc"
	deferred
	end
	
	requirement_0_2
	note
		doc: "{REQUIREMENTS_DOCUMENTATION}.requirement_0_2_doc"
	deferred
	end
	
	requirement_0_3
	note
		doc: "{REQUIREMENTS_DOCUMENTATION}.requirement_0_3_doc"
	deferred
	end
	
	requirement_0_4
	note
		doc: "{REQUIREMENTS_DOCUMENTATION}.requirement_0_4_doc"
	deferred
	end
	
	_drone_mode_could_be_normal_modedrone_mode_could_be_control_mode
	note
		doc: "{REQUIREMENTS_DOCUMENTATION}._drone_mode_could_be_normal_modedrone_mode_could_be_control_mode_doc"
		EIS: "src=main.rsml", "ref={REQUIREMENTS}.0.4", "type=refines"
	do
		from
			-- Add call to specification
		until
			((drone_mode = normal_modedrone_mode = control_mode)) or
			(duration - old duration) > 31536000 -- seconds (equivalent to 1 year)
		loop
			-- Add call to specification
		end
		check assert: (drone_mode = normal_modedrone_mode = control_mode) end
		check assert: (duration - old duration) <= 31536000 end -- seconds (equivalent to 1 year)
	end
	
	requirement_0_5
	note
		doc: "{REQUIREMENTS_DOCUMENTATION}.requirement_0_5_doc"
	deferred
	end
	
end

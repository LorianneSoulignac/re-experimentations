note
	EIS: "src=main.rsml", "ref=Environment", "type=trace"
	description: "[
	This class contains the domain knowledge that will be used by requirements.
]"
class DOMAIN_KNOWLEDGE
feature
	number_of_rotors : DOUBLE
	number_of_clamp : DOUBLE
	max_weight_of_parcel : DOUBLE
	max_size_of_parcel : DOUBLE
	low_battery_status : DOUBLE
	minimum_safe_height : DOUBLE
	minimum_safe_height : DOUBLE
invariant
	number_of_rotors_is_4: number_of_rotors = 4 -- 
	number_of_clamp_is_1: number_of_clamp = 1 -- 
	max_weight_of_parcel_is_10: max_weight_of_parcel = 10 -- kg
	max_size_of_parcel_is_1: max_size_of_parcel = 1 -- m
	low_battery_status_is_10: low_battery_status = 10 -- percent
	minimum_safe_height_is_50: minimum_safe_height = 50 -- m
	minimum_safe_height_is_50: minimum_safe_height = 50 -- m
end

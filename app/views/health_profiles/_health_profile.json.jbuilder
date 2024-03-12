json.extract! health_profile, :id, :systolic_arterial_pressure, :diastolic_arterial_pressure, :mean_arterial_pressure, :created_at, :updated_at
json.url health_profile_url(health_profile, format: :json)

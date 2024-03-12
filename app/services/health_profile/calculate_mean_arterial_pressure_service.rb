class HealthProfile::CalculateMeanArterialPressureService < ApplicationService
  private

  def run
    ((kwargs[:systolic_arterial_pressure].to_i + 2 * kwargs[:diastolic_arterial_pressure].to_i)/3)
  end
end

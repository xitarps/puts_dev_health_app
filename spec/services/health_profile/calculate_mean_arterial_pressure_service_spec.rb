require 'rails_helper'

describe HealthProfile::CalculateMeanArterialPressureService do
  context '.calculate_mean_arterial_pressure' do
    it 'returns mean_arterial_pressure 96 for PAS: 130, PAD: 80' do
      # PAM = (PAS + 2 * PAD) / 3
      pas = 130
      pad = 80
      pam = 96

      expect(described_class.call(systolic_arterial_pressure: pas,
                                  diastolic_arterial_pressure: pad)).to eq(pam)  
    end
    
  end
end

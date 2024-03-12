class HealthProfilesController < ApplicationController
  before_action :set_health_profile, only: %i[ show edit update destroy ]

  def index
    @health_profiles = HealthProfile.all
  end

  def show; end

  def new
    @health_profile = HealthProfile.new
  end

  def edit; end

  def create
    persist_health_profile
    return redirect_to @result[:object], notice: "Successfully created." if @result[:is_succeeded]

    render :new, status: :unprocessable_entity
  end

  def update
    persist_health_profile
    return redirect_to @result[:object], notice: "Successfully updated." if @result[:is_succeeded]

    render :edit, status: :unprocessable_entity
  end

  def destroy
    @health_profile.destroy!

    redirect_to health_profiles_path, notice: "Successfully destroyed."
  end

  private

  def set_health_profile
    @health_profile = HealthProfile.find(params[:id])
  end

  def health_profile_params
    params.require(:health_profile).permit(:systolic_arterial_pressure, :diastolic_arterial_pressure)
  end

  def persist_health_profile
    @result = HealthProfile::PersistHealthProfileService.call(
      target: 'HealthProfile',
      id: @health_profile&.id,
      action: action_name.to_sym,
      params: health_profile_params.as_json,
      services: {
        mean_arterial_pressure: HealthProfile::CalculateMeanArterialPressureService
      }
    )
  end
end

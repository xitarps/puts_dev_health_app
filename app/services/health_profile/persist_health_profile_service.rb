class HealthProfile::PersistHealthProfileService < ApplicationService
  private

  def actions
    {
      create: lambda do
                @target = @target.new **@params.merge(@dynamic_params)
                result = @target.save
                build_result_hash(@target, !!result)
              end,
      update: lambda do
                @target = @target.find(@id)
                result = @target.update **@params.merge(@dynamic_params)
                build_result_hash(@target, !!result)
              end
    }
  end

  def run
    define_instance_variables
    actions[@action].call
  end

  def define_instance_variables
    @id = kwargs[:id]
    @target = Object.const_get kwargs[:target]
    @action = kwargs[:action]
    @params = kwargs[:params]

    @dynamic_params = build_params_hash_from_all_kwargs_services
  end

  def build_params_hash_from_all_kwargs_services
    kwargs[:services].inject({}) do |result_hash, service_key_value_array|
      { service_key_value_array.first => service_key_value_array.last.call(**kwargs[:params])}
    end
  end

  def build_result_hash(object, is_succeeded)
    {
      object: object,
      is_succeeded: is_succeeded
    }
  end
end
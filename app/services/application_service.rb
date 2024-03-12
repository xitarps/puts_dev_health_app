class ApplicationService
  def initialize(*, **)
    @args = [*]
    @kwargs = Hash[**]&.deep_symbolize_keys!
    run unless self.class.private_method_defined?(:run)
  end

  def self.call(*, **) = (new(*, **).call)

  def call = (run)

  private

  attr_reader :args, :kwargs

  def run
    raise 'Private Method \'run\' is missing inside your service'
  end
end

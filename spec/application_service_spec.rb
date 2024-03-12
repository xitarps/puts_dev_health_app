require 'rails_helper'

describe ApplicationService do
  context '#call' do
    it 'cannot instantiate without setting run method' do
      message = 'Private Method \'run\' is missing inside your service'

      expect { subject.call }.to raise_error(RuntimeError, message)
    end

    it 'instantiate when run method was set' do
      described_class.class_eval { def run; end }

      expect { subject.call }.not_to raise_error
    end

    it 'call run' do
      allow(subject).to receive(:run)

      subject.call
      expect(subject).to have_received(:run)
    end
  end
end

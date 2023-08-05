require 'rails_helper'

RSpec.describe DuelsService, type: :service do
  describe '.call' do
    let(:user_1) { create(:user) }
    let(:user_2) { create(:user) }

    it 'creates a duel with the given users' do
      duel = described_class.call(user_1: user_1, user_2: user_2)

      expect(duel.user_1).to eq(user_1)
      expect(duel.user_2).to eq(user_2)
      expect(duel.state).to eq('starting')
      expect(Duel.count).to eq(1)
    end
  end
end

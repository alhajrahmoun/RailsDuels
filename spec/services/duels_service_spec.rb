# frozen_string_literal: true

require 'rails_helper'

RSpec.describe DuelsService, type: :service do
  describe '.call' do
    let(:user_1) { create(:user, level: 'beginner') }
    let(:user_2) { create(:user, level: 'beginner') }
    let(:duel) { described_class.call(participants: [user_1, user_2]) }

    it 'creates a duel with the given users' do
      expect(duel.users).to contain_exactly(user_1, user_2)
      expect(duel.state).to eq('starting')
      expect(Duel.count).to eq(1)
    end

    it 'returns sets duel complexity' do
      expect(duel.complexity).to eq('beginner')
    end
  end
end

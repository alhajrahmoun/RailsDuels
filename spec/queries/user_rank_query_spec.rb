# frozen_string_literal: true

require 'rails_helper'

RSpec.describe UserRankQuery do
  describe '.call' do
    let!(:user1) { create(:user, points: 55, level: :beginner) }
    let!(:user2) { create(:user, points: 30, level: :beginner) }
    let!(:user3) { create(:user, points: 40, level: :beginner) }

    it 'returns the user rank' do
      expect(described_class.call(user1)).to eq(1)
      expect(described_class.call(user2)).to eq(3)
      expect(described_class.call(user3)).to eq(2)
    end
  end
end

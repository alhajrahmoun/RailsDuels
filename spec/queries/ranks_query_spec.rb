require 'rails_helper'

RSpec.describe RanksQuery do
  let!(:user1) { create(:user, username: 'alice', points: 100) }
  let!(:user2) { create(:user, username: 'bob', points: 200) }
  let!(:user3) { create(:user, username: 'charles', points: 300) }

  describe '.call' do
    it 'returns users with rank based on points' do
      result = described_class.call

      expect(result.take.username).to eq('charles')
    end

    context 'when limit is present' do
      it 'limits the number of results' do
        result = described_class.call(limit: 2)

        expect(result.size).to eq(2)
      end
    end

    context 'when min_points is present' do
      it 'returns users with points greater than min_points' do
        result = described_class.call(min_points: 200)

        expect(result.size).to eq(2)
        expect(result.pluck(:username)).to contain_exactly('bob', 'charles')
      end
    end
  end
end
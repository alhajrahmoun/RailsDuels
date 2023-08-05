require 'rails_helper'

RSpec.describe OnlineUsersQuery do
  let!(:online_user) { create(:user, online: true) }
  let!(:other_online_user) { create(:user, online: true) }
  let!(:offline_user) { create(:user, online: false) }

  describe '.call' do
    it 'returns the total number of online users' do
      result = OnlineUsersQuery.call

      expect(result).to eq(2)
    end
  end
end
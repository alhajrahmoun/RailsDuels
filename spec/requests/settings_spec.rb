# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Settings' do
  let(:user) { create(:user) }

  before do
    sign_in user
  end

  describe 'GET /show' do
    it 'responds successfully when user is authenticated' do
      get settings_path

      expect(response).to have_http_status(:success)
    end

    it 'redirects to login page when user is not authenticated' do
      sign_out user

      get settings_path

      expect(response).to redirect_to(new_user_session_path)
    end
  end

  describe 'PUT /update' do
    context 'when the update is successful' do
      it 'updates the user level' do
        patch update_user_level_path, params: { user: { level: 'beginner' } }

        expect(user.reload.level).to eq('beginner')
      end

      it 'redirects to the settings path with a success message' do
        patch update_user_level_path, params: { user: { level: 'beginner' } }

        follow_redirect!

        expect(response.body).to include(I18n.t('actions.success'))
      end
    end

    context 'when the update fails' do
      it 'does not update the user level' do
        patch update_user_level_path, params: { user: { level: '' } }

        expect(user.reload.level).not_to eq('')
      end

      it 'renders the show template with an error message' do
        patch update_user_level_path, params: { user: { level: '' } }

        expect(response.body).to include(I18n.t('actions.failure'))
      end
    end

    context 'when user is not authenticated' do
      it 'redirects to login page' do
        sign_out user

        patch update_user_level_path, params: { user: { level: 'beginner' } }
        expect(response).to redirect_to(new_user_session_path)
      end
    end
  end
end

# frozen_string_literal: true

require 'rails_helper'

RSpec.describe DuelFinalizerService, type: :service do
  include ActiveSupport::Testing::TimeHelpers

  let(:duel) { create(:duel, state: :ongoing) }
  let(:service) { described_class.new(duel) }

  describe '#call' do
    context 'when duel is finished' do
      before do
        allow(duel).to receive(:finished?).and_return(true)
      end

      it 'does not update duel state' do
        expect { service.call }.not_to(change(duel, :state))
      end
    end

    context 'when duel has less than 10 submissions' do
      before do
        allow(duel.submissions).to receive(:count).and_return(5)
      end

      it 'does not update duel state' do
        expect { service.call }.not_to(change(duel, :state))
      end
    end

    context 'when duel is not finished and has 10 submissions and user_1 wins' do
      let!(:user1_submissions) { create_list(:submission, 5, user: duel.user_1, duel: duel, points: 10) }
      let!(:user2_submissions) { create_list(:submission, 4, user: duel.user_2, duel: duel, points: 10) }
      let!(:user2_wrong_submission) { create(:submission, user: duel.user_2, duel: duel, points: 0) }

      before do
        duel.user_1.update(status: :in_duel)
        duel.user_2.update(status: :in_duel)
        allow(duel).to receive(:finished?).and_return(false)
        allow(duel.submissions).to receive(:count).and_return(10)
      end

      it 'updates duel state to finished' do
        expect { service.call }.to change(duel, :state).from('ongoing').to('finished')
      end

      it 'updates user_1 status to idle' do
        expect { service.call }.to change { duel.user_1.status }.from('in_duel').to('idle')
      end

      it 'updates user_2 status to idle' do
        expect { service.call }.to change { duel.user_2.status }.from('in_duel').to('idle')
      end

      it 'updates user_1 points' do
        expect { service.call }.to change { duel.user_1.points }.from(0).to(55)
      end

      it 'updates user_2 points' do
        expect { service.call }.not_to change { duel.user_2.points }.from(0)
      end

      it 'updates duel winner' do
        expect { service.call }.to change(duel, :winner).from(nil).to(duel.user_1)
      end

      it 'updates duel winner points' do
        expect { service.call }.to change(duel, :winner_points).from(nil).to(55)
      end
    end

    context 'when duel is not finished and has 10 submissions and duel is a tie' do
      let!(:submission_time) { Time.zone.now }

      let!(:user1_submissions) do
        travel_to submission_time do
          create_list(:submission, 5, user: duel.user_1, duel: duel, points: 10)
        end
      end

      let!(:user2_submissions) do
        travel_to submission_time do
          create_list(:submission, 5, user: duel.user_2, duel: duel, points: 10)
        end
      end

      before do
        duel.user_1.update(status: :in_duel)
        duel.user_2.update(status: :in_duel)
        allow(duel).to receive(:finished?).and_return(false)
        allow(duel.submissions).to receive(:count).and_return(10)
      end

      it 'updates duel state to finished' do
        expect { service.call }.to change(duel, :state).from('ongoing').to('finished')
      end

      it 'updates user_1 status to idle' do
        expect { service.call }.to change { duel.user_1.status }.from('in_duel').to('idle')
      end

      it 'updates user_2 status to idle' do
        expect { service.call }.to change { duel.user_2.status }.from('in_duel').to('idle')
      end

      it 'updates user_1 points' do
        expect { service.call }.to change { duel.user_1.points }.from(0).to(50)
      end

      it 'updates user_2 points' do
        expect { service.call }.to change { duel.user_2.points }.from(0).to(50)
      end

      it 'updates duel winner' do
        expect { service.call }.not_to change(duel, :winner).from(nil)
      end

      it 'updates duel winner points' do
        expect { service.call }.to change(duel, :winner_points).from(nil).to(50)
      end
    end
  end
end

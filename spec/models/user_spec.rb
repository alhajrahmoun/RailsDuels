# frozen_string_literal: true

require 'rails_helper'

RSpec.describe User, type: :model do
  let(:user) { build(:user) }

  context 'validations' do
    it 'validates presence of email' do
      user.email = nil
      expect(user.valid?).to be_falsey
      expect(user.errors.messages[:email]).to include("can't be blank")
    end

    it 'validates uniqueness of email' do
      existing_user = create(:user)
      user.email = existing_user.email
      expect(user.valid?).to be_falsey
      expect(user.errors.messages[:email]).to include("has already been taken")
    end

    it 'validates presence of username' do
      user.username = nil
      expect(user.valid?).to be_falsey
      expect(user.errors.messages[:username]).to include("can't be blank")
    end

    it 'validates uniqueness of username' do
      existing_user = create(:user)
      user.username = existing_user.username
      expect(user.valid?).to be_falsey
      expect(user.errors.messages[:username]).to include("has already been taken")
    end
  end

  context 'associations' do
    it 'has many duels' do
      expect(user).to respond_to(:duels)
    end

    it 'has many submissions' do
      expect(user).to respond_to(:submissions)
    end

    it 'has many problems through submissions' do
      expect(user).to respond_to(:problems)
    end
  end

  context 'enums' do
    it 'defines a level enum' do
      expect(user).to respond_to(:level)
    end

    it 'defines a status enum' do
      expect(user).to respond_to(:status)
    end
  end

  describe '#duels' do
    let(:user) { create(:user) }
    let(:duel_1) { create(:duel, user_1: user) }
    let!(:duel_2) { create(:duel, user_2: user) }

    it 'returns all duels of the user' do
      duels = user.duels
      expect(duels).to include(duel_1)
      expect(duels).to include(duel_2)
    end
  end

  describe '#problems_without_submissions' do
    let(:user) { create(:user) }
    let(:duel) { create(:duel) }
    let!(:duel_problem_1) { create(:duel_problem, duel: duel, problem: create(:problem)) }
    let!(:duel_problem_2) { create(:duel_problem, duel: duel, problem: create(:problem)) }
    let!(:submission) { create(:submission, user: user, duel: duel, problem: duel_problem_2.problem) }

    it 'returns problems in the duel that the user has not submitted' do
      problems = user.problems_without_submissions(duel_id: duel.id)
      expect(problems).to include(duel_problem_1.problem)
      expect(problems).not_to include(duel_problem_2.problem)
    end
  end
end
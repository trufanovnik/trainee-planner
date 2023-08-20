# frozen_string_literal: true

require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'create' do
    let(:user) { FactoryBot.build(:user) }
    subject { user }
    it { should respond_to(:first_name) }
    it { should respond_to(:email) }
  end
end

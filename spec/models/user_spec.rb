require 'rails_helper'

RSpec.describe User, type: :model do

    describe "Validations" do
        describe "Email" do
            it { is_expected.to validate_presence_of(:email) }
            it { is_expected.to allow_value("test@mediswap.com").for(:email) }
            it { is_expected.to allow_value("test.test@mediswap.com").for(:email) }
            it { is_expected.to_not allow_value("test@test@mediswap.com").for(:email) }
            it { is_expected.to_not allow_value("@mediswap.com").for(:email) }
            it { is_expected.to_not allow_value("test@").for(:email) }
            it { is_expected.to_not allow_value("test").for(:email) }
        end
        describe "Password" do
            it { is_expected.to validate_presence_of(:password) }
            it { is_expected.to allow_value("password").for(:password) }
            it { is_expected.to_not allow_value("test").for(:password) }
        end
    end

end

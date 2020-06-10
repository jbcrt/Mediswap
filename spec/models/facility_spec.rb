require 'rails_helper'

RSpec.describe Facility, type: :model do

    describe "Validations" do
        describe "Name" do
            it { is_expected.to validate_presence_of(:name) }
            it { is_expected.to validate_length_of(:name).is_at_least(1).is_at_most(50) }
        end
        describe "Category" do
            it { is_expected.to validate_presence_of(:category) }
            it { is_expected.to validate_inclusion_of(:category).in_array(FACILITY_CATEGORIES) }
            it { is_expected.to_not allow_value("Hôpital").for(:category) }
        end
        describe "Description" do
            it { is_expected.to validate_presence_of(:description) }
            it { is_expected.to validate_length_of(:description).is_at_least(1).is_at_most(10000) }
        end
        describe "Street" do
            it { is_expected.to validate_presence_of(:street) }
            it { is_expected.to validate_length_of(:street).is_at_least(1).is_at_most(50) }
        end
        describe "Additional address" do
            it { is_expected.to validate_length_of(:additional_address).is_at_most(50) }
            it { is_expected.to allow_value("", nil).for(:additional_address) }
        end
        describe "Department" do
            it { is_expected.to validate_presence_of(:department) }
            it { is_expected.to validate_inclusion_of(:department).in_array(DEPARTMENTS) }
            it { is_expected.to_not allow_value("Californie").for(:department) }
        end
    end
end

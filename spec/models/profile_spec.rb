require 'rails_helper'

RSpec.describe Profile, type: :model do

    describe "Validations" do
        describe "Title" do
            it { is_expected.to validate_presence_of(:title) }
            it { should define_enum_for(:title).with_values(Profile.titles).backed_by_column_of_type(:string) }
        end
        describe "First Name" do
            it { is_expected.to validate_presence_of(:first_name) }
            it { is_expected.to allow_value("John").for(:first_name) }
            it { is_expected.to allow_value("John-John").for(:first_name) }
            it { is_expected.to allow_value("Amélie").for(:first_name) }
            it { is_expected.to allow_value("Mickaël").for(:first_name) }
            it { is_expected.to_not allow_value("John_").for(:first_name) }
            it { is_expected.to_not allow_value("John0").for(:first_name) }
            it { is_expected.to_not allow_value("0").for(:first_name) }
        end
        describe "Last name" do
            it { is_expected.to validate_presence_of(:last_name) }
            it { is_expected.to allow_value("Doe").for(:last_name) }
            it { is_expected.to allow_value("O'Brian").for(:last_name) }
            it { is_expected.to allow_value("de La Fontaine").for(:last_name) }
            it { is_expected.to_not allow_value("Doe_").for(:last_name) }
            it { is_expected.to_not allow_value("Doe0").for(:last_name) }
            it { is_expected.to_not allow_value("0").for(:last_name) }
        end
        
        context "If User is a health profesionnal" do
            describe "Profession" do
                it { is_expected.to validate_presence_of(:profession) }
                it { is_expected.to validate_inclusion_of(:profession).in_array(PROFESSIONS) }
                it { is_expected.to_not allow_value("Developper").for(:profession) }
            end
            describe "Professional ID number" do
                it { is_expected.to validate_presence_of(:professional_id_number) }
                it { is_expected.to validate_numericality_of(:professional_id_number).only_integer }
                it { should validate_length_of(:professional_id_number).is_at_least(9).is_at_most(11) }
                it { is_expected.to_not allow_value("0000").for(:professional_id_number) }
                it { is_expected.to_not allow_value("56165462194951651").for(:professional_id_number) }
                it { is_expected.to_not allow_value("Test").for(:professional_id_number) }
                it { is_expected.to_not allow_value("9615961,9195").for(:professional_id_number) }
                it { is_expected.to_not allow_value("9661,9195").for(:professional_id_number) }
                it { is_expected.to_not allow_value("9661.9195").for(:professional_id_number) }
            end
        end
    end
end

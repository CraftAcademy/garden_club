require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'DB table' do
  it { is_expected.to have_db_column :id }
  it { is_expected.to have_db_column :name }
  it { is_expected.to have_db_column :email }
  it { is_expected.to have_db_column :encrypted_password }
  it { is_expected.to have_db_column :provider}
  it { is_expected.to have_db_column :uid }
end

describe 'Validations' do
  it { is_expected.to validate_presence_of :name }
  it { is_expected.to validate_presence_of :email }
  it { is_expected.to validate_presence_of :password }
  it { is_expected.to validate_uniqueness_of(:email).case_insensitive }
  it { is_expected.to validate_confirmation_of :password }
  it { is_expected.to validate_length_of :password }

  # it 'should validate email is equal to email_confirmatiion' do
  #   expect(FactoryGirl.create(:user, email: 'amber@amber.com', email_confirmation: 'amber@other.com')).not_to be_valid
  # end
end

describe 'Factory' do
  it 'should have valid Factory' do
    expect(FactoryGirl.create(:user)).to be_valid
  end
end

describe 'Actual validation of confirmation?' do
  it 'tests password confirmation' do
    @user = FactoryGirl.build(:user, name: "Amber", email: "amber@amber.com", password: "password", password_confirmation: "password")
    expect(@user.save).to be true
  end

  it 'tests password confirmation sad path' do
    @user = FactoryGirl.build(:user, name: "Amber", email: "amber@amber.com", password: "password", password_confirmation: "p")
    expect(@user.save).to be false
  end

end


describe 'Email validations' do
  it 'should have an @' do
    expect(FactoryGirl.build(:user, email: "amberamber.com", email_confirmation: "amberamber.com")).not_to be_valid
  end
  it 'should have a .' do
    expect(FactoryGirl.build(:user, email: "amber@ambercom", email_confirmation: "amber@ambercom")).not_to be_valid
  end
  it 'should not have a space' do
    expect(FactoryGirl.build(:user, email: "am ber@amber.com", email_confirmation: "am ber@amber.com")).not_to be_valid
  end
end

describe 'Facebook validations'
  it 'should save with FB information' do
    @user = User.new(email: "amber@amber.com", password: "password", password_confirmation: "password")
    binding.pry
    @user.from_omniauth({hash: {provider: 'facebook', uid: '13247098'}})
    expect(User.first).not_to be nil
  end
end

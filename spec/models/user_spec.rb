require "rails_helper"
require "support/factory_girl"

RSpec.describe User, type: :model do
  it 'is valid' do
    user = create(:user)
    expect(user).to be_valid
  end
end

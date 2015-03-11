require "rails_helper"

RSpec.describe Status, type: :model do
  describe 'is valid' do
    it 'has a current type' do
      status = create(:status)
      expect(status.current_type).to eq("Paid")
    end

    it 'can be saved' do
      status = build(:status)
      status.save
      expect(status.id).to be_truthy
    end
  end

  describe 'it is invalid' do
    it 'cannot be saved without a current_type' do
      status = build(:status, current_type: nil)
      status.save
      expect(status.id).to be_nil
    end
  end
end

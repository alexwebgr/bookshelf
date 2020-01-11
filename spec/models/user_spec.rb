require 'rails_helper'

RSpec.describe User, type: :model do
  describe "Validations" do
    it "creates a user with a valid params" do
      user = create(:user)

      expect(user).to be_valid
    end

    it "does not create a user with the same email" do
      create(:user)
      user2 = build(:user)

      expect(user2.valid?).to be_falsey
    end

    it "does not create a user with invalid email" do
      user = build(:user, :invalid_email)

      expect(user.valid?).to be_falsey
    end

    it "does not create a user with empty password" do
      user = build(:user, :empty_password)

      expect(user.valid?).to be_falsey
    end
  end
end

require 'rails_helper'

RSpec.describe Upload, type: :model do
  describe "Validations" do
    it "creates an upload with a valid params" do
      upload = create(:upload)

      expect(upload).to be_valid
    end
  end
end

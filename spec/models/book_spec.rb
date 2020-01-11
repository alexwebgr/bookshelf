require 'rails_helper'

RSpec.describe Book, type: :model do
  describe "Validations" do
    it "creates a book with a valid params" do
      book = create(:book)

      expect(book).to be_valid
    end

    it "does not create a book with invalid params" do
      book = build(:book, :invalid)

      expect(book.valid?).to be_falsey
    end

    it "does not create a book with the same unique_identifier" do
      create(:book)
      book2 = build(:book)

      expect(book2.valid?).to be_falsey
    end
  end
end

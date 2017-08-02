require 'rails_helper'

RSpec.describe Link, type: :model do
  context "Validations", type: :model do
    describe "validates url and title" do
      it { should validate_presence_of(:url)}
      it { should validate_presence_of(:title)}
      it { should belong_to(:user) }

      it "is only valid with http://" do
        user = User.create(email: "stover@test.com", password: "pass", password_confirmation: "pass")
        link = user.links.new(title: "Google", url: "http://www.google.com")

        expect(link).to be_valid
      end

      it "is invalid without http://" do
        user = User.create(email: "stover@test.com", password: "pass", password_confirmation: "pass")
        link = user.links.new(title: "Google", url: "www.google.com")

        expect(link).to be_invalid
      end
    end
  end
end

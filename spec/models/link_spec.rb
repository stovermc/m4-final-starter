require 'rails_helper'

RSpec.describe Link, type: :model do
  context "Validations", type: :model do
    describe "validates url and title" do
      it { should validate_presence_of(:url)}
      it { should validate_presence_of(:title)}
      it { should belong_to(:user) }
    end
  end
end

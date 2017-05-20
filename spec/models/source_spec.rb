require 'rails_helper'

RSpec.describe Source, type: :model do
  let(:source) { create(:source) }

  it { is_expected.to validate_presence_of(:title) }

  describe "attributes" do
    it "has title attribute" do
      expect(source).to have_attributes(title: source.title)
    end
  end

end

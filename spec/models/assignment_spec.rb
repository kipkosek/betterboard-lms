require 'rails_helper'

RSpec.describe Assignment, type: :model do
  let(:assignment) { create(:assignment) }

  it { is_expected.to validate_presence_of(:name) }
  it { is_expected.to validate_presence_of(:instructions) }
  it { is_expected.to validate_presence_of(:duedate) }

  describe "attributes" do
    it "has title, instructions, and duedate attributes" do
      expect(assignment).to have_attributes(name: assignment.name, instructions: assignment.instructions, duedate: assignment.duedate)
    end
  end
end

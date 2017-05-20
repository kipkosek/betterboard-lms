require 'rails_helper'

def setup_instructor
  @request.env["devise.mapping"] = Devise.mappings[:instructor]
  sign_in FactoryGirl.create(:instructor)
end

def setup_student
  @request.env["devise.mapping"] = Devise.mappings[:student]
  sign_in FactoryGirl.create(:student)
end

RSpec.describe AssignmentsController, type: :controller do
  let(:instructor) { create(:instructor) }
  let(:my_assignment) { create (:assignment) }

  context "student doing CRUD on assignment" do
    before do
      setup_student
    end

    describe "GET index" do
      it "returns http success" do
        get :index
        expect(response).to have_http_status(:success)
      end
    end

    describe "GET show" do
      it "returns http success" do
        get :show, params: { id: my_assignment.id }
        expect(response).to have_http_status(:success)
      end
    end
  end


  context "instructor doing CRUD on assignment" do
    before do
      setup_instructor
    end

    describe "GET index" do
      it "returns http success" do
        get :index
        expect(response).to have_http_status(:success)
      end
    end

    describe "GET show" do
      it "returns http success" do
        get :show, params: { id: my_assignment.id }
        expect(response).to have_http_status(:success)
      end
    end

    describe "GET new" do
      it "returns http success" do
        get :new
        expect(response).to have_http_status(:success)
      end
    end

    describe "POST create" do
      it "increases the number of assignments by 1" do
        expect{ post :create, params: { assignment: { name: Faker::Lorem.sentence, instructions: Faker::Lorem.sentence, duedate: Faker::Date.forward(30)} } }.to change(Assignment,:count).by(1)
      end
    end

  end

end

require 'rails_helper'

# This spec was generated by rspec-rails when you ran the scaffold generator.
# It demonstrates how one might use RSpec to specify the controller code that
# was generated by Rails when you ran the scaffold generator.
#
# It assumes that the implementation code is generated by the rails scaffold
# generator.  If you are using any extension libraries to generate different
# controller code, this generated spec may or may not pass.
#
# It only uses APIs available in rails and/or rspec-rails.  There are a number
# of tools you can use to make these specs even more expressive, but we're
# sticking to rails and rspec-rails APIs to keep things simple and stable.
#
# Compared to earlier versions of this generator, there is very limited use of
# stubs and message expectations in this spec.  Stubs are only used when there
# is no simpler way to get a handle on the object needed for the example.
# Message expectations are only used when there is no simpler way to specify
# that an instance is receiving a specific message.

RSpec.describe TestSuitesController, type: :controller do

  # This should return the minimal set of attributes required to create a valid
  # TestSuite. As you add validations to TestSuite, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) {
    { name: 'test', description: 'desc' }
  }

  let(:invalid_attributes) {
    { none: 3 }
  }

  before(:each) do
    allow_any_instance_of(ApplicationController).to receive(:require_user).and_return(true)
  end

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # TestSuitesController. Be sure to keep this updated too.
  let(:valid_session) { {} }

  describe "GET #index" do
    it "assigns all test_suites as @test_suites" do
      test_suite = TestSuite.create! valid_attributes
      get :index, {}, valid_session
      expect(assigns(:test_suites)).to eq([test_suite])
    end
  end

  describe "GET #show" do
    it "assigns the requested test_suite as @test_suite" do
      test_suite = TestSuite.create! valid_attributes
      get :show, {:id => test_suite.to_param}, valid_session
      expect(assigns(:test_suite)).to eq(test_suite)
    end
  end

  describe "GET #new" do
    it "assigns a new test_suite as @test_suite" do
      get :new, {}, valid_session
      expect(assigns(:test_suite)).to be_a_new(TestSuite)
    end
  end

  describe "GET #edit" do
    it "assigns the requested test_suite as @test_suite" do
      test_suite = TestSuite.create! valid_attributes
      get :edit, {:id => test_suite.to_param}, valid_session
      expect(assigns(:test_suite)).to eq(test_suite)
    end
  end

  describe "POST #create" do
    context "with valid params" do
      it "creates a new TestSuite" do
        expect {
          post :create, {:test_suite => valid_attributes}, valid_session
        }.to change(TestSuite, :count).by(1)
      end

      it "assigns a newly created test_suite as @test_suite" do
        post :create, {:test_suite => valid_attributes}, valid_session
        expect(assigns(:test_suite)).to be_a(TestSuite)
        expect(assigns(:test_suite)).to be_persisted
      end

      it "redirects to the created test_suite" do
        post :create, {:test_suite => valid_attributes}, valid_session
        expect(response).to redirect_to(TestSuite.last)
      end
    end

    context "with invalid params" do
      it "assigns a newly created but unsaved test_suite as @test_suite" do
        post :create, {:test_suite => invalid_attributes}, valid_session
        expect(assigns(:test_suite)).to be_a_new(TestSuite)
      end

      it "re-renders the 'new' template" do
        post :create, {:test_suite => invalid_attributes}, valid_session
        expect(response).to render_template("new")
      end
    end
  end

  describe "PUT #update" do
    context "with valid params" do
      let(:new_attributes) {
        { name: "updated", description: 'description2' }
      }

      it "updates the requested test_suite" do
        test_suite = TestSuite.create! valid_attributes
        put :update, {:id => test_suite.to_param, :test_suite => new_attributes}, valid_session
        test_suite.reload
        expect(test_suite.name).to eq("updated")
        expect(test_suite.description).to eq("description2")
      end

      it "assigns the requested test_suite as @test_suite" do
        test_suite = TestSuite.create! valid_attributes
        put :update, {:id => test_suite.to_param, :test_suite => valid_attributes}, valid_session
        expect(assigns(:test_suite)).to eq(test_suite)
      end

      it "redirects to the test_suite" do
        test_suite = TestSuite.create! valid_attributes
        put :update, {:id => test_suite.to_param, :test_suite => valid_attributes}, valid_session
        expect(response).to redirect_to(test_suite)
      end
    end

    context "with invalid params" do
      it "assigns the test_suite as @test_suite" do
        test_suite = TestSuite.create! valid_attributes
        put :update, {:id => test_suite.to_param, :test_suite => invalid_attributes}, valid_session
        expect(assigns(:test_suite)).to eq(test_suite)
      end
    end
  end

  describe "DELETE #destroy" do
    it "destroys the requested test_suite" do
      test_suite = TestSuite.create! valid_attributes
      expect {
        delete :destroy, {:id => test_suite.to_param}, valid_session
      }.to change(TestSuite, :count).by(-1)
    end

    it "redirects to the test_suites list" do
      test_suite = TestSuite.create! valid_attributes
      delete :destroy, {:id => test_suite.to_param}, valid_session
      expect(response).to redirect_to(test_suites_url)
    end
  end

end

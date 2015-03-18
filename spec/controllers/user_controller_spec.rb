require 'rails_helper'



RSpec.describe UsersController, type: :controller do

  # This should return the minimal set of attributes required to create a valid
  # Feature. As you add validations to Feature, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) {
    {
      email: 'email@example.com',
      password: '123456'
    }
  }

  let(:invalid_attributes) {
    {
      email: 'email',
      password: '12'
    }
  }

  before(:each) do
    allow_any_instance_of(ApplicationController).to receive(:require_user).and_return(true)
  end

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # FeaturesController. Be sure to keep this updated too.
  let(:valid_session) { {} }

  describe "GET #show" do
    it "assigns the requested user as @user" do
      user = User.new valid_attributes
      user.save!
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
      get :show
      expect(assigns(:user)).to eq(user)
    end
  end

  describe "GET #new" do
    it "assigns a new user as @new_user" do
      get :new
      expect(assigns(:new_user)).to be_a_new(User)
    end
  end

  describe "GET #index" do
    it "assigns a all users as @users" do
      user = User.new valid_attributes
      user.save!
      get :index
      expect(assigns(:users)).to eq(User.all)
    end
  end

  describe "GET #edit" do
    it "assigns the requested feature as @feature" do
      user = User.new valid_attributes
      user.save!
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
      get :edit
      expect(assigns(:user)).to eq(user)
    end
  end

  describe "POST #create" do
    context "with valid params" do
      it "creates a new user" do
        expect {
          post :create, {:user => valid_attributes}
        }.to change(User, :count).by(1)
      end

      it "assigns a newly created user as @user" do
        post :create, {:user => valid_attributes}
        expect(assigns(:new_user)).to be_a(User)
        expect(assigns(:new_user)).to be_persisted
      end

      it "redirects to the created github_token" do
        post :create, {:user => valid_attributes}
        expect(response).to redirect_to(user_path)
      end
    end

    context "with invalid params" do
      it "assigns a newly created but unsaved github_token as @github_token" do
        post :create, {:user => invalid_attributes}
        expect(assigns(:new_user)).to be_a_new(User)
      end

      it "re-renders the 'new' template" do
        post :create, {:user => invalid_attributes}
        expect(response).to render_template("new")
      end
    end
  end

end

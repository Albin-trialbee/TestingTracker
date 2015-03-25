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

RSpec.describe GithubTokensController, type: :controller do

  # This should return the minimal set of attributes required to create a valid
  # GithubToken. As you add validations to GithubToken, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) {
    { access_token: 'tokentokentokentokentokentokentokentoken', title: 'test' }
  }

  let(:invalid_attributes) {
    { access_token: 'token', title: 'test' }
  }

  before(:each) do
    @user = User.new email: 'admin@example.com', password: '123456', admin: true
    @user.save!
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@user)
  end

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # GithubTokensController. Be sure to keep this updated too.
  let(:valid_session) { {} }

  describe "GET #index" do
    it "assigns all github_tokens as @github_tokens" do
      github_token = GithubToken.create! valid_attributes
      get :index, {}, valid_session
      expect(assigns(:github_tokens)).to eq([github_token])
    end
  end

  describe "GET #show" do
    it "assigns the requested github_token as @github_token" do
      github_token = GithubToken.create! valid_attributes
      get :show, {:id => github_token.to_param}, valid_session
      expect(assigns(:github_token)).to eq(github_token)
    end
  end

  describe "GET #new" do
    it "assigns a new github_token as @github_token" do
      get :new, {}, valid_session
      expect(assigns(:github_token)).to be_a_new(GithubToken)
    end
  end

  describe "GET #edit" do
    it "assigns the requested github_token as @github_token" do
      github_token = GithubToken.create! valid_attributes
      get :edit, {:id => github_token.to_param}, valid_session
      expect(assigns(:github_token)).to eq(github_token)
    end
  end

  describe "POST #create" do
    context "with valid params" do
      it "creates a new GithubToken" do
        expect {
          post :create, {:github_token => valid_attributes}, valid_session
        }.to change(GithubToken, :count).by(1)
      end

      it "assigns a newly created github_token as @github_token" do
        post :create, {:github_token => valid_attributes}, valid_session
        expect(assigns(:github_token)).to be_a(GithubToken)
        expect(assigns(:github_token)).to be_persisted
      end

      it "redirects to the created github_token" do
        post :create, {:github_token => valid_attributes}, valid_session
        expect(response).to redirect_to(GithubToken.last)
      end
    end

    context "with invalid params" do
      it "assigns a newly created but unsaved github_token as @github_token" do
        post :create, {:github_token => invalid_attributes}, valid_session
        expect(assigns(:github_token)).to be_a_new(GithubToken)
      end

      it "re-renders the 'new' template" do
        post :create, {:github_token => invalid_attributes}, valid_session
        expect(response).to render_template("new")
      end
    end
  end

  describe "PUT #update" do
    context "with valid params" do
      let(:new_attributes) {
        { access_token: 'tokentokentokentokentokentokentokentoken', title: 'test2' }
      }

      it "updates the requested github_token" do
        github_token = GithubToken.create! valid_attributes
        put :update, {:id => github_token.to_param, :github_token => new_attributes}, valid_session
        github_token.reload
        expect(github_token.title).to eq('test2')
      end

      it "assigns the requested github_token as @github_token" do
        github_token = GithubToken.create! valid_attributes
        put :update, {:id => github_token.to_param, :github_token => valid_attributes}, valid_session
        expect(assigns(:github_token)).to eq(github_token)
      end

      it "redirects to the github_token" do
        github_token = GithubToken.create! valid_attributes
        put :update, {:id => github_token.to_param, :github_token => valid_attributes}, valid_session
        expect(response).to redirect_to(github_token)
      end
    end

    context "with invalid params" do
      it "assigns the github_token as @github_token" do
        github_token = GithubToken.create! valid_attributes
        put :update, {:id => github_token.to_param, :github_token => invalid_attributes}, valid_session
        expect(assigns(:github_token)).to eq(github_token)
      end

      it "re-renders the 'edit' template" do
        github_token = GithubToken.create! valid_attributes
        put :update, {:id => github_token.to_param, :github_token => invalid_attributes}, valid_session
        expect(response).to render_template("edit")
      end
    end
  end

  describe "DELETE #destroy" do
    it "destroys the requested github_token" do
      github_token = GithubToken.create! valid_attributes
      expect {
        delete :destroy, {:id => github_token.to_param}, valid_session
      }.to change(GithubToken, :count).by(-1)
    end

    it "redirects to the github_tokens list" do
      github_token = GithubToken.create! valid_attributes
      delete :destroy, {:id => github_token.to_param}, valid_session
      expect(response).to redirect_to(github_tokens_url)
    end
  end

end

require 'spec_helper'

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

describe HeartsController do

  # This should return the minimal set of attributes required to create a valid
  # Heart. As you add validations to Heart, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) { { "start_time" => "2013-11-23 03:03:55" } }

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # HeartsController. Be sure to keep this updated too.
  let(:valid_session) { {} }

  describe "GET index" do
    it "assigns all hearts as @hearts" do
      heart = Heart.create! valid_attributes
      get :index, {}, valid_session
      assigns(:hearts).should eq([heart])
    end
  end

  describe "GET show" do
    it "assigns the requested heart as @heart" do
      heart = Heart.create! valid_attributes
      get :show, {:id => heart.to_param}, valid_session
      assigns(:heart).should eq(heart)
    end
  end

  describe "GET new" do
    it "assigns a new heart as @heart" do
      get :new, {}, valid_session
      assigns(:heart).should be_a_new(Heart)
    end
  end

  describe "GET edit" do
    it "assigns the requested heart as @heart" do
      heart = Heart.create! valid_attributes
      get :edit, {:id => heart.to_param}, valid_session
      assigns(:heart).should eq(heart)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new Heart" do
        expect {
          post :create, {:heart => valid_attributes}, valid_session
        }.to change(Heart, :count).by(1)
      end

      it "assigns a newly created heart as @heart" do
        post :create, {:heart => valid_attributes}, valid_session
        assigns(:heart).should be_a(Heart)
        assigns(:heart).should be_persisted
      end

      it "redirects to the created heart" do
        post :create, {:heart => valid_attributes}, valid_session
        response.should redirect_to(Heart.last)
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved heart as @heart" do
        # Trigger the behavior that occurs when invalid params are submitted
        Heart.any_instance.stub(:save).and_return(false)
        post :create, {:heart => { "start_time" => "invalid value" }}, valid_session
        assigns(:heart).should be_a_new(Heart)
      end

      it "re-renders the 'new' template" do
        # Trigger the behavior that occurs when invalid params are submitted
        Heart.any_instance.stub(:save).and_return(false)
        post :create, {:heart => { "start_time" => "invalid value" }}, valid_session
        response.should render_template("new")
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      it "updates the requested heart" do
        heart = Heart.create! valid_attributes
        # Assuming there are no other hearts in the database, this
        # specifies that the Heart created on the previous line
        # receives the :update_attributes message with whatever params are
        # submitted in the request.
        Heart.any_instance.should_receive(:update).with({ "start_time" => "2013-11-23 03:03:55" })
        put :update, {:id => heart.to_param, :heart => { "start_time" => "2013-11-23 03:03:55" }}, valid_session
      end

      it "assigns the requested heart as @heart" do
        heart = Heart.create! valid_attributes
        put :update, {:id => heart.to_param, :heart => valid_attributes}, valid_session
        assigns(:heart).should eq(heart)
      end

      it "redirects to the heart" do
        heart = Heart.create! valid_attributes
        put :update, {:id => heart.to_param, :heart => valid_attributes}, valid_session
        response.should redirect_to(heart)
      end
    end

    describe "with invalid params" do
      it "assigns the heart as @heart" do
        heart = Heart.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        Heart.any_instance.stub(:save).and_return(false)
        put :update, {:id => heart.to_param, :heart => { "start_time" => "invalid value" }}, valid_session
        assigns(:heart).should eq(heart)
      end

      it "re-renders the 'edit' template" do
        heart = Heart.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        Heart.any_instance.stub(:save).and_return(false)
        put :update, {:id => heart.to_param, :heart => { "start_time" => "invalid value" }}, valid_session
        response.should render_template("edit")
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested heart" do
      heart = Heart.create! valid_attributes
      expect {
        delete :destroy, {:id => heart.to_param}, valid_session
      }.to change(Heart, :count).by(-1)
    end

    it "redirects to the hearts list" do
      heart = Heart.create! valid_attributes
      delete :destroy, {:id => heart.to_param}, valid_session
      response.should redirect_to(hearts_url)
    end
  end

end

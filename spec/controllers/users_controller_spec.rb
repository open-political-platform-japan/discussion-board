describe UsersController do

  # This should return the minimal set of attributes required to create a valid
  # User. As you add validations to User, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) { FactoryGirl.attributes_for(:user) }

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # UsersController. Be sure to keep this updated too.
  let(:valid_session) { { user_id: @user.id } }

  before do
    @user = FactoryGirl.create(:user)
  end

  describe "GET show" do
    subject { get :show, {id: @user.to_param}, valid_session }
    it "assigns the requested user as @user" do
      subject
      expect(assigns(:user)).to eq(@user)
    end
  end

  describe "GET edit" do
    subject(:action){ get :edit, {id: @user.to_param}, valid_session }
    it "assigns the requested user as @user" do
      subject
      expect(assigns(:user)).to eq(@user)
    end
  end

  describe "PUT update" do
    subject(:action){ put :update, {id: @user.to_param, user: attributes}, valid_session }
    describe "with valid params" do
      let(:attributes){ { "username" => "updated_name" } }
      it "updates the requested user" do
        subject
        expect(assigns(:user).username).to eq('updated_name')
      end

      it "assigns the requested user as @user" do
        subject
        expect(assigns(:user)).to eq(@user)
      end

      it "redirects to the user" do
        subject
        expect(response).to redirect_to(@user)
      end
    end

    describe "with invalid params" do
      let(:attributes){ { "nickname" => "" } }
      it "assigns the user as @user" do
        subject
        expect(assigns(:user)).to eq(@user)
      end

      it { should render_template("edit") }
    end
  end
end

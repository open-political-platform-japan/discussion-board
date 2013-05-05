require 'spec_helper'

describe UsersController do
  # This should return the minimal set of attributes required to create a valid
  # User. As you add validations to User, be sure to
  # update the return value of this method accordingly.
  def valid_attributes
    { "key" => "MyString" }
  end

  describe 'GET index' do
    before do
      @user = User.create! valid_attributes
      controller.index
    end
    describe 'assigns all users as @users' do
      subject { controller.instance_variable_get('@users') }
      it { should eq([@user]) }
    end
  end

  describe 'GET show' do
    before do
      @user = User.create! valid_attributes
      controller.show(@user.to_param)
    end
    describe 'assigns the requested user as @user' do
      subject { controller.instance_variable_get('@user') }
      it { should eq(@user) }
    end
  end

  describe 'GET new' do
    before do
      controller.new
    end
    describe 'assigns a new user as @user' do
      subject { controller.instance_variable_get('@user') }
      it { should be_a_new(User) }
    end
  end

  describe 'GET edit' do
    before do
      @user = User.create! valid_attributes
      controller.edit(@user.to_param)
    end
    describe 'assigns the requested user as @user' do
      subject { controller.instance_variable_get('@user') }
      it { should eq(@user) }
    end
  end

  describe 'POST create' do
    context 'with valid params' do
      before do
        controller.should_receive(:redirect_to) {|u| u.should eq(User.last) }
      end
      describe 'creates a new User' do
        it { expect {
          controller.create(valid_attributes)
        }.to change(User, :count).by(1) }
      end

      describe 'assigns a newly created user as @user and redirects to the created user' do
        before do
          controller.create(valid_attributes)
        end
        subject { controller.instance_variable_get('@user') }
        it { should be_a(User) }
        it { should be_persisted }
      end
    end

    context 'with invalid params' do
      describe "assigns a newly created but unsaved user as @user, and re-renders the 'new' template" do
        before do
          User.any_instance.stub(:save) { false }
          controller.should_receive(:render).with(:action => 'new')
          controller.create({ "key" => "invalid value" })
        end
        subject { controller.instance_variable_get('@user') }
        it { should be_a_new(User) }
      end
    end
  end

  describe 'PUT update' do
    context 'with valid params' do
      describe 'updates the requested user, assigns the requested user as @user, and redirects to the user' do
        before do
          @user = User.create! valid_attributes
          controller.should_receive(:redirect_to).with(@user, anything)
          controller.update(@user.to_param, valid_attributes)
        end
        subject { controller.instance_variable_get('@user') }
        it { should eq(@user) }
      end
    end

    context 'with invalid params' do
      describe "assigns the user as @user, and re-renders the 'edit' template" do
        before do
          @user = User.create! valid_attributes
          # Trigger the behavior that occurs when invalid params are submitted
          User.any_instance.stub(:save) { false }
          controller.should_receive(:render).with(:action => 'edit')
          controller.update(@user.to_param, { "key" => "invalid value" })
        end
        subject { controller.instance_variable_get('@user') }
        it { should eq(@user) }
      end
    end
  end

  describe 'DELETE destroy' do
    before do
      @user = User.create! valid_attributes
      controller.stub(:users_url) { '/users' }
      controller.should_receive(:redirect_to).with('/users')
    end
    it 'destroys the requested user, and redirects to the users list' do
      expect {
        controller.destroy(@user.to_param)
      }.to change(User, :count).by(-1)
    end
  end
end

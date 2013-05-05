require 'spec_helper'

describe SpeaksController do
  # This should return the minimal set of attributes required to create a valid
  # Speak. As you add validations to Speak, be sure to
  # update the return value of this method accordingly.
  def valid_attributes
    { "user" => "" }
  end

  describe 'GET index' do
    before do
      @speak = Speak.create! valid_attributes
      controller.index
    end
    describe 'assigns all speaks as @speaks' do
      subject { controller.instance_variable_get('@speaks') }
      it { should eq([@speak]) }
    end
  end

  describe 'GET show' do
    before do
      @speak = Speak.create! valid_attributes
      controller.show(@speak.to_param)
    end
    describe 'assigns the requested speak as @speak' do
      subject { controller.instance_variable_get('@speak') }
      it { should eq(@speak) }
    end
  end

  describe 'GET new' do
    before do
      controller.new
    end
    describe 'assigns a new speak as @speak' do
      subject { controller.instance_variable_get('@speak') }
      it { should be_a_new(Speak) }
    end
  end

  describe 'GET edit' do
    before do
      @speak = Speak.create! valid_attributes
      controller.edit(@speak.to_param)
    end
    describe 'assigns the requested speak as @speak' do
      subject { controller.instance_variable_get('@speak') }
      it { should eq(@speak) }
    end
  end

  describe 'POST create' do
    context 'with valid params' do
      before do
        controller.should_receive(:redirect_to) {|u| u.should eq(Speak.last) }
      end
      describe 'creates a new Speak' do
        it { expect {
          controller.create(valid_attributes)
        }.to change(Speak, :count).by(1) }
      end

      describe 'assigns a newly created speak as @speak and redirects to the created speak' do
        before do
          controller.create(valid_attributes)
        end
        subject { controller.instance_variable_get('@speak') }
        it { should be_a(Speak) }
        it { should be_persisted }
      end
    end

    context 'with invalid params' do
      describe "assigns a newly created but unsaved speak as @speak, and re-renders the 'new' template" do
        before do
          Speak.any_instance.stub(:save) { false }
          controller.should_receive(:render).with(:action => 'new')
          controller.create({ "user" => "invalid value" })
        end
        subject { controller.instance_variable_get('@speak') }
        it { should be_a_new(Speak) }
      end
    end
  end

  describe 'PUT update' do
    context 'with valid params' do
      describe 'updates the requested speak, assigns the requested speak as @speak, and redirects to the speak' do
        before do
          @speak = Speak.create! valid_attributes
          controller.should_receive(:redirect_to).with(@speak, anything)
          controller.update(@speak.to_param, valid_attributes)
        end
        subject { controller.instance_variable_get('@speak') }
        it { should eq(@speak) }
      end
    end

    context 'with invalid params' do
      describe "assigns the speak as @speak, and re-renders the 'edit' template" do
        before do
          @speak = Speak.create! valid_attributes
          # Trigger the behavior that occurs when invalid params are submitted
          Speak.any_instance.stub(:save) { false }
          controller.should_receive(:render).with(:action => 'edit')
          controller.update(@speak.to_param, { "user" => "invalid value" })
        end
        subject { controller.instance_variable_get('@speak') }
        it { should eq(@speak) }
      end
    end
  end

  describe 'DELETE destroy' do
    before do
      @speak = Speak.create! valid_attributes
      controller.stub(:speaks_url) { '/speaks' }
      controller.should_receive(:redirect_to).with('/speaks')
    end
    it 'destroys the requested speak, and redirects to the speaks list' do
      expect {
        controller.destroy(@speak.to_param)
      }.to change(Speak, :count).by(-1)
    end
  end
end

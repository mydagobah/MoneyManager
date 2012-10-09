require 'spec_helper'

describe Money do

  let(:user) { FactoryGirl.create(:user) }

  before { @money = user.money.build(description: 'GiantEagle', value: 20.5) }

  subject { @money }

  it { should respond_to(:value) }
  it { should respond_to(:description) }
  it { should respond_to(:user_id) }
  it { should respond_to(:category) }
  it { should respond_to(:year) }
  its(:user) { should == user }
  it { should be_valid }

  describe "when user_id is not present" do
    before { @money.user_id = nil }
    it { should_not be_valid }
  end

  # test money can only accessible by its user
  describe "accessible attributes" do
    it "should not allow access to user_id" do
      expect do
        Money.new(user_id: user.id)
      end.to raise_error(ActiveModel::MassAssignmentSecurity::Error)
    end
  end

  describe "with blank description" do
    before { @money.description = " " }
    it { should_not be_valid }
  end

  describe "with description that is too long" do
    before { @money.description = "a" * 105 }
    it { should_not be_valid }
  end

  describe "the value should contain a number" do
    before { @money.value = "not a number" }
    it { should_not be_valid }
  end



end

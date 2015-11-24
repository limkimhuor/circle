require "rails_helper"

describe User, :type => :model do

    context "if you don't enter anything" do
      subject{User.new}
      it{ should_not be_valid }
      it{ should have(1).errors_on(:name) }
      it{ should have(2).errors_on(:age) }
    end

    context "if the name is over the numer of characters" do
      subject{User.new(name: 'aaaaaaaaaabbbbbbbbbbc',age: 10)}
      it {should_not be_valid}
      it{ should have(1).errors_on(:name) }
      it{ should have(0).errors_on(:age) }
    end

    context "if the age is beyond the scope" do
      subject{User.new(name: 'taro',age: 1001)}
      it {should_not be_valid}
      it{ should have(0).errors_on(:name) }
      it{ should have(1).errors_on(:age) }
    end

    context "if the normal data is set" do
      subject{User.new(name: 'taro',age: 20)}
      it {should be_valid}
    end
end


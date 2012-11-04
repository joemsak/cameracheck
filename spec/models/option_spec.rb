require 'spec_no_rails_helper'
require './app/models/option'

describe Option do
  it "requires the text" do
    option = Option.new(:text => nil)
    option.valid?
    option.errors[:text].should include("can't be blank")
  end
end

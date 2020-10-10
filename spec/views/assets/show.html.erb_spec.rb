require 'rails_helper'

RSpec.describe "assets/show", type: :view do
  before(:each) do
    @asset = assign(:asset, Fabricate(:asset))
  end

  it "renders attributes in <p>" do
    render
  end
end

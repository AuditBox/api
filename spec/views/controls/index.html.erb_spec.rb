require 'rails_helper'

RSpec.describe "controls/index", type: :view do
  let(:controls) { [1,1].map { Fabricate(:control) } }
  before(:each) do
    assign(:controls, controls)
  end

  it "renders a list of controls" do
    render
  end
end

require 'rails_helper'

RSpec.describe "assets/index", type: :view do
  let(:org) { Fabricate(:organization) }
  before(:each) do
    assign(:scopes, [])
    assign(:assets, [
      Fabricate(:asset, organization: org),
      Fabricate(:asset, organization: org)
    ])
  end

  it "renders a list of assets" do
    render
  end
end

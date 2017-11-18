require "spec_helper"

RSpec.describe Apitester do
  it "has a version number" do
    expect(Apitester::VERSION).not_to be nil
  end

  it "does something useful" do
    expect(false).to eq(true)
  end
end

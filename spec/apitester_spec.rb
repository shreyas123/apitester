require "spec_helper"

RSpec.describe Apitester do
  it "has a version number" do
    expect(Apitester::VERSION).not_to be nil
  end
end

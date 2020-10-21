require 'spec_helper'

RSpec.describe Surveyor::Answer do
  subject { described_class.new(question: "Hello ?", value: "Hello World") }

  it "has a question" do
    expect(subject.question).to eq("Hello ?")
  end

  it "has a value" do
    expect(subject.value).to eq("Hello World")
  end
end

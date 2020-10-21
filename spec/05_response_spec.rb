require 'spec_helper'

RSpec.describe Surveyor::Response do
  subject { described_class.new(email: "user@user.com") }

  it "has an email" do
    expect(subject.email).to eq("user@user.com")
  end

  it "can have answers added" do
    answer = double(:answer)
    subject.add_answer(answer)
    expect(subject.answers).to include(answer)
  end
end

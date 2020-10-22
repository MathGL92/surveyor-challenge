require 'spec_helper'

RSpec.describe Surveyor::Survey do
  subject { described_class.new(name: "Engagement Survey") }

  it "has a name" do
    expect(subject.name).to eq("Engagement Survey")
  end

  it "can have questions added" do
    question = double(:question)
    subject.add_question(question)
    expect(subject.questions).to include(question)
  end

  it "can have responses added" do
    response = double(:response)
    subject.add_response(response)
    expect(subject.responses).to include(response)
  end

  it "finds a survey's response by the user's email address" do
    response = double(:response, email: "user@user.com")
    subject.add_response(response)
    expect(subject.find_response("user@user.com")).to eq(response)
    expect(subject.find_response("admin@user.com")).to eq(nil)
  end

  it "says if the user has responded to this survey yet" do
    response = double(:response, email: "user@user.com")
    subject.add_response(response)
    expect(subject.responded?("user@user.com")).to eq(true)
    expect(subject.responded?("admin@user.com")).to eq(false)
  end
end

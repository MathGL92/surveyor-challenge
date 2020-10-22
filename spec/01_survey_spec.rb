require 'spec_helper'
require 'pry'

RSpec.describe Surveyor::Survey do
  subject { described_class.new(name: "Engagement Survey") }

  let(:response_1) { Surveyor::Response.new(email: "user1@user.com") }
  let(:response_2) { Surveyor::Response.new(email: "user2@user.com") }
  let(:response_3) { Surveyor::Response.new(email: "user3@user.com") }
  let(:response_4) { Surveyor::Response.new(email: "user4@user.com") }
  let(:response_5) { Surveyor::Response.new(email: "user5@user.com") }
  let(:response_6) { Surveyor::Response.new(email: "user6@user.com") }

  let(:question_1) { Surveyor::Question.new(title: "How much do you miss going out?") }
  let(:question_2) { Surveyor::Question.new(title: "What will you do first when the restrictions are over?") }

  let(:answer_1) { Surveyor::Answer.new(question: question_1, value: 2) }
  let(:answer_2) { Surveyor::Answer.new(question: question_1, value: 1) }
  let(:answer_3) { Surveyor::Answer.new(question: question_1, value: 1) }
  let(:answer_4) { Surveyor::Answer.new(question: question_1, value: 3) }
  let(:answer_5) { Surveyor::Answer.new(question: question_1, value: 5) }
  let(:answer_6) { Surveyor::Answer.new(question: question_1, value: 4) }
  let(:answer_7) { Surveyor::Answer.new(question: question_2, value: "Party") }
  let(:answer_8) { Surveyor::Answer.new(question: question_2, value: "Travel") }


  before(:each) do
    subject.add_response(response_1)
    subject.add_response(response_2)
    subject.add_response(response_3)
    subject.add_response(response_4)
    subject.add_response(response_5)
    subject.add_response(response_6)

    subject.add_question(question_1)
    subject.add_question(question_2)

    response_1.add_answer(answer_1)
    response_1.add_answer(answer_7)

    response_2.add_answer(answer_2)
    response_2.add_answer(answer_8)

    response_3.add_answer(answer_3)
    response_3.add_answer(answer_7)

    response_4.add_answer(answer_4)
    response_4.add_answer(answer_8)

    response_5.add_answer(answer_5)
    response_5.add_answer(answer_8)

    response_6.add_answer(answer_6)
    response_6.add_answer(answer_8)
  end

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

  context "find_response(email)" do
    it "returns the survey's response when the email matches" do
      response = double(:response, email: "user@user.com")
      subject.add_response(response)
      expect(subject.find_response("user@user.com")).to eq(response)
    end

    it "returns nil when the user didn't respond to the survey" do
      response = double(:response, email: "user@user.com")
      subject.add_response(response)
      expect(subject.find_response("admin@user.com")).to be_nil
    end
  end

  context "responded?(email)" do
    it "returns true if the user has responded to this survey yet" do
      response = double(:response, email: "user@user.com")
      subject.add_response(response)
      expect(subject.responded?("user@user.com")).to eq(true)
    end

    it "returns false if the user has not responded to this survey yet" do
      response = double(:response, email: "user@user.com")
      subject.add_response(response)
      expect(subject.responded?("admin@user.com")).to eq(false)
    end
  end

  context "should be able to tell us how many 'low', 'neutral' and 'high' answers there are for a particular rating question" do
    it "counts the low answers on a survey for a given question" do
      expect(subject.count_low_answers(question_1)).to eq(3)
    end

    it "counts the neutral answers on a survey for a given question" do
      expect(subject.count_neutral_answers(question_1)).to eq(1)
    end

    it "counts the high answers on a survey for a given question" do
      expect(subject.count_high_answers(question_1)).to eq(2)
    end
  end
end

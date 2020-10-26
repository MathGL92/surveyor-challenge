require 'spec_helper'

RSpec.describe Surveyor::Answer do
  let(:question_1) { Surveyor::RatingQuestion.new(title: "How much do you miss going out?") }
  subject { described_class.new(question_1, 2) }

  context "it answers to question" do
    it "has a question" do
      expect(subject).to respond_to :question
    end
    it "returns the good question" do
      expect(subject.question).to eq (question_1)
    end
  end

  context "it answers to value" do
    it "has a value" do
      expect(subject).to respond_to :value
    end
    it "returns the good value" do
      expect(subject.value).to eq (2)
    end
  end
end

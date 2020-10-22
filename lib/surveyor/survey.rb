require 'pry'

module Surveyor
  class Survey
    # TODO: change this code to make the test pass
    # TODO: Remove these comments ;)
    attr_reader :name, :questions, :responses

    def initialize(name:)
      @name = name
      @questions = []
      @responses = []
    end

    def add_question(question)
      @questions << question
    end

    def add_response(response)
      @responses << response
    end

    def find_response(email)
      @responses.find { |response| response.email == email }
    end

    def responded?(email)
      !find_response(email).nil?
    end

    def count_low_answers(question)
      # select if values of the question <= 2 and return size of array
      get_answers_to_question(question).select { |answer| answer.value <= 2 }.size
    end

    def count_neutral_answers(question)
      # select if values of the question == 3 and return size of array
      get_answers_to_question(question).select { |answer| answer.value == 3 }.size
    end

    def count_high_answers(question)
      # select if values of the question > 3 and return size of array
      get_answers_to_question(question).select { |answer| answer.value > 3 }.size
    end

    def answer_breakdown(question)
      # get the values of answer in array
      values_answers = get_answers_to_question(question).map { |answer| answer.value.to_s }.sort
      # count the number of times the value appears in hash
      values_answers.each_with_object(Hash.new(0)) { |value, new_hash| new_hash[value] += 1 }
    end

    private

    def get_answers_to_question(question)
      # return array of all answers from survey
      answers = @responses.map(&:answers).flatten
      # select only answers with answer.question == question
      answers.select { |answer| answer.question == question }
    end
  end
end

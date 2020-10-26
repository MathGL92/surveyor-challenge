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
      # count ratings of the question <= 2
      get_question_ratings(question).count { |rating| rating <= 2 }
    end

    def count_neutral_answers(question)
      # count ratings of the question == 3
      get_question_ratings(question).count { |rating| rating == 3 }
    end

    def count_high_answers(question)
      # count ratings of the question > 3
      get_question_ratings(question).count { |rating| rating > 3 }
    end

    def answer_breakdown(question)
      # count the number of times the value appears in hash
      get_question_ratings(question).map(&:to_s).each_with_object(Hash.new(0)) { |value, new_hash| new_hash[value] += 1 }
    end

    private

    def get_question_ratings(question)
      # return array of all answers from survey
      # answers = @responses.flat_map(&:answers)
      # select only answers with answer.question == question
      # answers_filtered = answers.select { |answer| answer.question == question }
      # get the values of answers
      # answers_filtered.map(&:value)
      @responses
        .flat_map { |response| response.answer_value_for(question) }
    end
  end
end

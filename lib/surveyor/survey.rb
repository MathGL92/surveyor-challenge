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
  end
end

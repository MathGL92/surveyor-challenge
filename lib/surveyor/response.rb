module Surveyor
  class Response
    attr_reader :email, :answers

    def initialize(email:)
      @email = email
      @answers = []
    end

    def add_answer(answer)
      @answers << answer
    end

    def answer_value_for(question)
      answers.detect { |answer| answer.question == question }&.value
    end
  end
end

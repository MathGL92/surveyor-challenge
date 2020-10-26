module Surveyor
  class Answer
    attr_reader :question, :value

    def initialize(question, *value)
      @question = valid_question?(question)
      @value = assign_value(value)
    end

    def valid_question?(question)
      return question if question.is_a?(Question)

      raise "Must specify the question you're answering"
    end

    def assign_value(value)
      @question.is_a?(RatingQuestion) ? value[0].to_i : value[0].to_s
    end
  end
end

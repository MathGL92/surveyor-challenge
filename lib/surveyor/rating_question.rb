module Surveyor
  class RatingQuestion < Question
    def valid_answer?(answer)
      answer.is_a?(Integer) && (1..5).cover?(answer)
    end
  end
end

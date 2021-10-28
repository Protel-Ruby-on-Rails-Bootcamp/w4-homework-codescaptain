class CommentJob < ApplicationJob
  queue_as :default

  def perform(comment)
    # Do something later
  end
end

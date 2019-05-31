class NewUserJob < ApplicationJob
  queue_as :user

  def perform(user)
    puts "Welcome #{user}"
  end
end

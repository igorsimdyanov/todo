class UsersUpdateImportDeleteJob < ApplicationJob
  queue_as :default

  def perform(file)
    Services::UsersUpdateImportDelete.call(file)
  end
end
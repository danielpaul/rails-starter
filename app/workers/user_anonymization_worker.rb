class UserAnonymizationWorker < ApplicationWorker
  sidekiq_options queue: "low_priority", retry: false

  def perform(user_id)
    AnonymizationService.anonymize_user(user_id)
  end
end

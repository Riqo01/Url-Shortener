class ShortUrlGeneratorJob < ApplicationJob
  queue_as :default

  def perform(args)
    # Do something later
    @shortLink = Shortlink.find(args)
    @shortLink.shorturl = @shortLink.generateString()
    @shortLink.is_processed = true
    @shortLink.is_successful = true
    @shortLink.visit_count = 0
    @shortLink.processing_notes = 'Successfully generated'
    @shortLink.save!
  end
end

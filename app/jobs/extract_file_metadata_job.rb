class ExtractFileMetadataJob < ActiveJob::Base
  queue_as :default

  def perform(part)
    tempfile = part.file.download
    begin
      rta = RubyTikaApp.new(tempfile.path)

      metadata = rta.to_metadata.split("\n").map { |x| x.split(/:\s+/, 2) }.to_h
      metadata[:text] = rta.to_text

      part.update_column(:metadata, metadata)
    ensure
      tempfile.close
      tempfile.unlink
    end
  end
end

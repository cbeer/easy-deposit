class UpdateFileHashJob < ActiveJob::Base
  queue_as :default

  def perform(part)
    part.update_column(:file_hash, calculate_io_digest(part.file.to_io))
  end

  def calculate_io_digest(io, digest_class = Digest::SHA1)
    sha1 = digest_class.new

    while (data = io.readpartial(4096))
      sha1.update data
      break if io.eof?
    end

    digest_class.to_s.underscore + ':' + sha1.hexdigest
  end
end

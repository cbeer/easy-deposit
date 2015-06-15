require 'digest'

class Part < ActiveRecord::Base
  attachment :file
  belongs_to :deposit
  belongs_to :user
  serialize :metadata

  after_save :update_file_hash, if: :file_changed?
  after_save :extract_file_metadata, if: :file_changed?

  def file_changed?
    file_id_changed?
  end

  def update_file_hash
    UpdateFileHashJob.perform_later self
  end

  def extract_file_metadata
    ExtractFileMetadataJob.perform_later self
  end
end

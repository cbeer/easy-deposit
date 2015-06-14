class Deposit < ActiveRecord::Base
  belongs_to :user
  has_many :parts, dependent: :destroy

  accepts_attachments_for :parts, attachment: :file

  store :metadata, accessors: ([:citation, :description, :resource_type] + Anystyle.parser.model.labels), coder: JSON

  before_save :extract_citation_to_metadata, if: :citation_changed?

  def extract_citation_to_metadata
    return unless citation.present?

    parsed_citation.each do |k, v|
      k = case k
          when :type
            :resource_type
          else
            k
          end

      next unless respond_to? k

      public_send("#{k}=", v) unless public_send(k).present?
    end
  end

  def citation_changed?
    metadata_changed?
  end

  def parsed_citation
    Anystyle.parse(citation).first || {}
  end
end

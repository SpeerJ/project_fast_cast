class Photo < ApplicationRecord
  belongs_to :user
  has_one :actor, through: :user
  has_one_attached :image
  has_neighbors :embedding

  def self.create_from_image!(image, **attributes)
    result = new(**attributes)
    result.image.attach(image)
    puts attributes
    result.save!
    summary = PhotoSummarizer.new(result.image).summarize
    embedding = EmbeddingsFetcher.new.generate_embedding(summary)
    result.summary = summary
    result.embedding = embedding
    result.save!
    result
  end
end

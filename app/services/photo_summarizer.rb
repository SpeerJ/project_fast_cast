class PhotoSummarizer
  DEFAULT_PROMPT = "You are the assistant to a casting director who needs to fill roles with people of various appearances. Please create a brief description of this person based on their physical appearance. It should include simple attributes such as hair and skin color and body shape, speculative adjectives such as ethnic background, and subjective adjectives describing their look, like serious or cheerful. Still, it should try to be more generic than the particular expression they have right now. Do not include information about their clothing."
  def initialize(photo)
    @photo = photo
  end

  def summarize
    result = AnthropicClient.new.describe_photo(DEFAULT_PROMPT, @photo)
    result[:content][0][:text]
  end

end
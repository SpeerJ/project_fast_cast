class EmbeddingsFetcher
  def generate_embedding(text)
    response = connection.post do |req|
      req.body = {
        model: "text-embedding-3-small",
        input: text
      }.to_json
    end

    JSON.parse(response.body)["data"][0]["embedding"]
  end

  private

  def connection
    Faraday.new(url: 'https://api.openai.com/v1/embeddings') do |f|
      f.headers['Content-Type'] = 'application/json'
      f.headers['Authorization'] = "Bearer #{Rails.application.credentials.openai_secret_key}"
    end
  end
end
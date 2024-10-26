# frozen_string_literal: true
require 'faraday'
require 'json'

class AnthropicClient

  def describe_photo(system_prompt, photo)
    response = faraday_client.post do |req|
      req.body = {
        model: "claude-3-5-sonnet-20241022",
        max_tokens: 1000,
        system: system_prompt,
        messages: [{
                     role: "user",
                     content: [{
                                 type: "image",
                                 source: {
                                   type: "base64",
                                   media_type: photo.content_type,
                                   data: Base64.strict_encode64(photo.open.read)
                                 }
                               }]}]
      }.to_json
    end

    JSON.parse(response.body, symbolize_names: true)
  end

  private

  def faraday_client
    @faraday_client ||= Faraday.new(url: 'https://api.anthropic.com/v1/messages') do |f|
      f.headers['Content-Type'] = 'application/json'
      f.headers['x-api-key'] = Rails.application.credentials.anthropic_secret_key
      f.headers['anthropic-version'] = '2023-06-01'
    end
  end
end

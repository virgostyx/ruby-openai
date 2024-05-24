# frozen_string_literal: true

module OpenAI
  class VectorStoreFiles
    def initialize(client:)
      @client = client.beta(assistants: OpenAI::Assistants::BETA_VERSION)
    end

    def create(vector_store_id:, parameters: {})
      @client.json_post(path: "/vector_stores/#{vector_store_id}/files", parameters:)
    end

    def list(vector_store_id:)
      @client.get(path: "/vector_stores/#{vector_store_id}/files")
    end

    def retrieve(vector_store_id:, file_id:)
      @client.get(path: "/vector_stores/#{vector_store_id}/files/#{file_id}")
    end

    def delete(vector_store_id:, file_id:)
      @client.delete(path: "/vector_stores/#{vector_store_id}/files/#{file_id}")
    end
  end
end


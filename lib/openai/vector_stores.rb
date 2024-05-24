# frozen_string_literal: true

module OpenAI
  class VectorStores
    def initialize(client:)
      @client = client.beta(assistants: OpenAI::Assistants::BETA_VERSION)
    end

    def create(parameters: {})
      @client.json_post(path: '/vector_stores', parameters:)
    end

    def list(parameters: {})
      @client.get(path: '/vector_stores', parameters:)
    end

    def retrieve(id:)
      @client.get(path: "/vector_stores/#{id}")
    end

    def modify(id:, parameters: {})
      @client.json_post(path: "/vector_stores/#{id}", parameters:)
    end

    def delete(id:)
      @client.delete(path: "/vector_stores/#{id}")
    end

    def files
      @files ||= OpenAI::VectorStoreFiles.new(client: @client)
    end
  end
end
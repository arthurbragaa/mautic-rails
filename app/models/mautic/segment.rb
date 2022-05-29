module Mautic
  class Segment < Model

    # TODO: Investigate why this is not working
    def self.in(connection)
      Proxy.new(connection, endpoint, klass: name, data_name: "list")
    end

    # @see https://developer.mautic.org/#add-contact-to-a-segment
    # @param [Integer] id of Mautic::Contact
    def add_contact!(id)
      json = @connection.request(:post, "api/segments/#{self.id}/contact/#{id}/add")
      json["success"]
    rescue RequestError => _e
      false
    end

    # @see https://developer.mautic.org/#remove-contact-from-a-segment
    # @param [Integer] id of Mautic::Contact
    def remove_contact!(id)
      json = @connection.request(:post, "api/segment/#{self.id}/contact/#{id}/remove")
      json["success"]
    rescue RequestError => _e
      false
    end
  end
end
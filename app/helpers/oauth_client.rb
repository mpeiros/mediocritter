class OAuthClient
  attr_reader :credentials

  def initialize(credentials)
    raise ArgumentError, "must provide consumer_key, consumer_secret, token, and token_secret" unless valid_credentials?(credentials)
    @credentials = credentials
  end

  def get(url)
    # create the HTTP get request
    uri = URI(url)
    request = Net::HTTP::Get.new(uri)

    # set the Authorization Header using the oauth helper
    request["Authorization"] = oauth_header(request)

    # connect to the server and send the request
    response = Net::HTTP.start(uri.hostname, uri.port, :use_ssl => uri.scheme == 'https') { |http| http.request(request) }

    return response
  end

  private

  # A helper method to generate the OAuth Authorization header given
  # an Net::HTTP::GenericRequest object and a Hash of params
  def oauth_header(request)
    SimpleOAuth::Header.new(request.method, request.uri, URI.decode_www_form(request.body.to_s), credentials).to_s
  end

  def valid_credentials?(credentials)
    [:consumer_key, :consumer_secret, :token, :token_secret].all? { |key| credentials[key] }
  end
end

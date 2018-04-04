require "net/http"

module HttpRequest

  def self.get_content(options={})
    options[:owner] ||= 'rails'
    options[:repo] ||= 'rails'

    url = "https://api.github.com/repos/#{options[:owner]}/#{options[:repo]}/contributors"
    response = Net::HTTP.get_response(URI(url))

    JSON.parse response.body

  end
end

# my_token 41cf77e23b5c16008e243354927e6e59510d6e88
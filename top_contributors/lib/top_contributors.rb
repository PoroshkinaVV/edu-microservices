require "top_contributors/http_request"
require "top_contributors/sender"
require "sinatra"
require "json"
# require "prawn"

module TopContributors
  class Router < Sinatra::Base

    get "/", :provides => 'html' do
      params = { repo: "rails", owner: "rails" }
      @top_contributors = HttpRequest.get_content(params).first(3)
      Sender.publish(@top_contributors)

      # Prawn::Document.generate("hello.pdf") do
      #   text "sdfsd"
      # end

      slim :index # , :layout => false
    end

    def contributor_info(contributor)
      "#{contributor["contributions"]} #{contributor["login"]}"
    end

  end

end

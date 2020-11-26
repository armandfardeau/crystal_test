require "http/server"
require "crystal_test/language_inflector"

module CrystalTest
  VERSION = "0.1.0"

   server = HTTP::Server.new do |context|
    params = context.request.query_params

    if params["lang"]?
      context.response.respond_with_status(200, LanguageInflector.new(params["lang"]).find_questions)
    end
   end

  address = server.bind_tcp 3000
  puts "Listening on http://#{address}"
  server.listen
end

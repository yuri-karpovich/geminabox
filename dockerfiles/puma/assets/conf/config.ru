require "geminabox"

Geminabox.allow_replace = !!ENV['ALLOW_REPLACE']
Geminabox.data          = '/webapps/geminabox/data'
Geminabox.build_legacy  = false

$username = ENV['USERNAME']
$password = ENV['PASSWORD']

if $username && $password

  if ENV['PRIVATE'].to_s == 'true'
    use Rack::Auth::Basic, "GemInAbox" do |username, password|
      username == $username && $password == password
    end
  end

  Geminabox::Server.helpers do
    def protected!
      unless authorized?
        response['WWW-Authenticate'] = %(Basic realm="Geminabox")
        halt 401, "You have no access to this resource.\n"
      end
    end

    def authorized?
      @auth ||= Rack::Auth::Basic::Request.new(request.env)
      @auth.provided? && @auth.basic? && @auth.credentials && @auth.credentials == [$username, $password]
    end
  end

  Geminabox::Server.before('/upload') { protected! }
  Geminabox::Server.before { protected! if request.delete? }

  Geminabox::Server.before '/api/v1/gems' do
    if ENV['API_KEY'].to_s.empty? || env['HTTP_AUTHORIZATION'] != ENV['API_KEY']
      halt 401, "Access Denied. Api_key invalid or missing.\n"
    end
  end

end

run Geminabox::Server
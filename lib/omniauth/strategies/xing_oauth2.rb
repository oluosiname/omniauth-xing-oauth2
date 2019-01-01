require 'omniauth-oauth2'
module OmniAuth
  module Strategies
    # Main class for Xing OAuth2 strategy.
    class XingOauth2 < OmniAuth::Strategies::OAuth2
      option :name, :xing

      option :client_options,
             token_url: '/auth/oauth2/token',
             authorize_url: '/auth/oauth2/authorize',
             site: 'https://api.xing.com'

      uid { raw_info['id'] }

      info do
        {
          first_name: raw_info['first_name'],
          last_name: raw_info['last_name'],
          email: raw_info['active_email'],
          image: raw_info.dig('photo_urls', 'size_original')
        }
      end

      extra do
        { raw_info: raw_info }
      end

      def raw_info
        response = access_token.get('/v1/users/me')

        @raw_info ||= JSON.parse(response.body)['users'].first
      end

      def callback_url
        full_host + script_name + callback_path
      end
    end
  end
end
OmniAuth.config.add_camelization 'xing', 'Xing'

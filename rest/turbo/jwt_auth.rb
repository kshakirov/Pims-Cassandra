class JwtAuth

  def initialize app
    @app = app
    @jwt_issuer = 'zoral.com'
    @jwt_secret = 'keepitsecret'
  end

  def call env
    begin
      options = {algorithm: 'HS256', iss: @jwt_issuer}
      bearer = env.fetch('HTTP_AUTHORIZATION', '').slice(7..-1)
      payload, header = JWT.decode bearer, @jwt_secret, true, options

      env[:scopes] = payload['scopes']
      env[:customer] = payload['customer']
      if payload.key? 'admin'
        if payload['admin'].key? 'group'
          env[:group] = payload['admin']['group']
        end
      end


      @app.call env
    rescue JWT::DecodeError
      [401, {'Content-Type' => 'text/plain'}, ['A token must be passed.']]
    rescue JWT::ExpiredSignature
      [403, {'Content-Type' => 'text/plain'}, ['The token has expired.']]
    rescue JWT::InvalidIssuerError
      [403, {'Content-Type' => 'text/plain'}, ['The token does not have a valid issuer.']]
    rescue JWT::InvalidIatError
      [403, {'Content-Type' => 'text/plain'}, ['The token does not have a valid "issued at" time.']]
    end
  end

end
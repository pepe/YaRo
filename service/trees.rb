# Tree service route

module Service
  # Trees routes of the service
  class Trees < Roda
    plugin :default_headers,
        'Content-Type'=>'application/vnd.api+json'#,
        #'Content-Security-Policy'=>"default-src 'self'",
        #'Strict-Transport-Security'=>'max-age=16070400;',
        #'X-Frame-Options'=>'deny',
        #'X-Content-Type-Options'=>'nosniff',
        #'X-XSS-Protection'=>'1; mode=block'

    plugin Yaksi

    route do |r|
      domain Domain::Tree

      r.is do
        yaksi(:all)
      end

      r.is ':id' do |id|
        yaksi(:one, id)
      end
    end
  end
end

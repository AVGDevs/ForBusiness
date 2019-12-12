class Rack::Attack
  #Protegendo o site Rails de ataques DDoS
  throttle('req/ip', limit: 300, period: 5.minutes) do |req|
    req.ip # unless req.path.start_with?('/assets')
  end

  # Protegendo seu site Rails de brute force
  # Para proteger usando o email
  throttle("logins/email", limit: 5, period: 20.seconds) do |req|
    if req.path == '/login' && req.post?
      req.params['email'].presence
    end
  end
  # Para proteger usando o ip
  throttle('logins/ip', limit: 5, period: 20.seconds) do |req|
    if req.path == '/login' && req.post?
      req.ip
    end
  end  

  #Libera o localhost para tentar quantas vezes for necessário
  Rack::Attack.safelist('allow from localhost') do |req|
    req.ip == '127.0.0.1'
  end

  #Bloqueia um IP malícioso conhecido
  Rack::Attack.blocklist_ip("1.2.3.4")

end
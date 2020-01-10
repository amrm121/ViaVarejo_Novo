# Class responsavel por habilitar e desabilitar a request Configuration
# que o site faz para subir o captcha quando automacao estiver sendo executada
class ChromeSessionConfiguration
  include Utils

  def initialize(driver)
    @urls = []
    @driver = driver
  end

  def prevent_request    
    url = get_url_from_dominio_bandeira('url_padrao')    
    #@urls << "#{to_msite_this(url)}/Modules/Configuration/"
    #@urls2 << "#{url}/Modules/Configuration/"
    #@urls3 << "#{(url)}/Modules/Configuration/"
    @urls << "www.casasbahia.com.br/Modules/Configuration/"
    set_blocked_urls    
  end

  def allow_requests
    @urls.clear
    set_blocked_urls
  end

  def set_blocked_urls
    send_command_to_chromedriver('Network.setBlockedURLs', urls: @urls)
    send_command_to_chromedriver('Network.enable')
    @driver.browser.navigate.refresh
  end

  def send_command_to_chromedriver(command, urls = {})
    bridge = @driver.send(:bridge)
    resource = "session/#{bridge.session_id}/chromium/send_command_and_get_result"
    response = bridge.http.call(:post, resource, { 'cmd': command, 'params': urls })
    raise response[:value] if response[:status]
    response[:value]
  end
end

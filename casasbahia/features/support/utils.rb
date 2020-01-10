module Utils
    def get_url_from_dominio_bandeira(key)
      #DOMINIO[ENV['BANDEIRA']][ENV['AMBIENTE']][key]
      CONFIG['url_padrao'][key]      
      @page = CONFIG['url_padrao'][key]
    end

    def to_msite_this(url)
      url.gsub('https://www', 'https://m')
    end
  end

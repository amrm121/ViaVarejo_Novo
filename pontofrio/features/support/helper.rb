module Helper
  def tirar_foto(nome_arquivo, resultado)
    timer_path = Time.now.strftime('%Y%m%d_%Hh%Mmin%Ss').to_s
    caminho_arquivo = "report/screenshots/test_#{resultado}"
    foto = "#{caminho_arquivo}/#{nome_arquivo}/#{timer_path}.png"
    page.save_screenshot(foto)
    embed(foto, 'image/png', 'Clique aqui')
  end
end

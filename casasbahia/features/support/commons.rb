module Commons
  def cria_cookie(cookie, value)
    $cookie_name = cookie
    Capybara.current_session.driver.browser.manage.add_cookie(name: $cookie_name, value: value)
    retorna_valor_cookie($cookie_name)
  end

  def retorna_valor_cookie(cookie_name)
    $cookie_value = Capybara.current_session.driver.browser.manage.cookie_named(cookie_name)[:value]
  end

  def wait_until_el_displayed(finder, elmt, seconds = 2)
    options = {}
    options[:timeout] ||= seconds
    wait = Selenium::WebDriver::Wait.new(options)
    element = wait.until { element = page.find(finder, elmt) }
    element if element.visible?
  end
end

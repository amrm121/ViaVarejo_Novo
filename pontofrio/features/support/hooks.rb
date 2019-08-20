SitePrism::Page.class_eval do
  include Commons
end

SitePrism::Section.class_eval do
  include Commons
end

World(Pages, Helper, Commons)

Before do
  Capybara.current_session.driver.browser.manage.delete_all_cookies
  Capybara.current_session.current_window.resize_to(1380, 720)
end

After do |scenario|
  scenario_name = scenario.name.gsub(/\s+/,'_').tr('/, #', '_')
  if scenario.failed?
      tirar_foto(scenario_name.downcase!, 'falhou')
  else 
      tirar_foto(scenario_name.downcase!, 'passou')
  end
end

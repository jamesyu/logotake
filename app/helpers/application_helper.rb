# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper
  #outputs a single script block in the footer for all jsblock calls
  def jsblock(&block)
    if request.xhr?
      #output in place to allow for evalScripts
      javascript_tag &block
    else
      content_for :jsblock, &block
    end
  end
  
  def top_menu_item(name, url, match_options)
    matched = true
    match_options.keys.each do |k|
      matched = matched && params[k] == match_options[k]
    end
    k = matched ? 'active' : ''
    
    content_tag :li, :class => k do
      link_to name, url_for(url)
    end
  end
end

module ApplicationHelper
   
    def logos

        html = "\t<li>" + link_to(image_tag('outcyclinglogo.png'), 'http://www.outcycling.org/', target:"_blank") + "</li>\n"
        
        html += "\t<li>" + link_to(image_tag('center_logo.png'), 'https://gaycenter.org/' , target:"_blank")  + "</li>\n"
        
        
#        html += "<li>" + link_to(image_tag('bike_ny.png'), 'http://www.bike.nyc/', target:"_blank") + "\n"
        
      
        html.html_safe 
        
    end 
    
end

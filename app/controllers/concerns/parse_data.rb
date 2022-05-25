module ParseData
  def parse_data(html, data, new_line = true)

    klass = data.class
  
    # Use the class to know if we need to create TH or TD
    case
    when klass == Hash
      data.each do |key, value|
  
        # Start a new row
        if new_line
          html << '<tr>'
          new_line = false
        end
  
        # Check if we need to use a rowspan
        if value.class == Array || value.count == 1
          html << "<th>#{key}</th>"
        else
          html << "<th rowspan=\"#{value.count}\">#{key}</th>"
        end
  
        # Parse the content of the hash (recursive)
        html, new_line = parse_data(html, value, new_line)
      end
    when klass = Array
      data.each do |item|
        html << "<td>#{item}</td>"
      end
  
      # We end the row and flag that we need to start a new one
      # if there is anymore data
      html << '</tr>'
      new_line = true
    end
    return html, new_line
  end
end
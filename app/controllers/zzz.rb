resp.each_pair do |key, value|
  puts "#{key}: #{value.class}" unless value.is_a?(Hash)
end

def hash_recursive hash
  k = 1
  hash.each_pair do |key, value|
    if value.is_a? Hash
      k =+ 1
      hash_recursive value
    elsif value.is_a? Array and value.first.is_a? Hash
      value.each do |v|
        k =+ 1
        hash_recursive v
        # k =- 1
      end
    elsif value.is_a? Array
      puts "#{TAB*k}#{key}: #{value}"
    elsif value.is_a? String or value.is_a? Integer or value.is_a? Float or value.is_a? TrueClass or value.is_a? FalseClass
      puts "#{TAB*k}#{key}: #{value}"
    else
      puts "===== Undefined! #{key}: #{value}"
    end 
  end
end
def response_tree response_hash
  tab = '    '
  response_hash.eacb_pair do |key, value|
    if value.is_a? String or value.is_a? Integer or value.is_a? Float or value.is_a? TrueClass or value.is_a? FalseClass
      content_tag
    end
  end
end

def time_helper time

end
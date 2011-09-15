require 'csv'

class Cleaner
  def self.ig2csv(path)
    file    = File.new(path, 'r')
    buffer  = nil
    counter = 0
    regex   = /(\A[^\[\n]+)\[([^\]]+)\](.*\z)/m
    
    CSV.open('lib/cleanup/out.csv', 'w') do |csv|
    while (line = file.gets)
      if buffer.nil?
        buffer = line
      elsif line.first.blank? || !regex.match(line)
        buffer = buffer + line
      else
        matches     = regex.match(buffer)
        
        if matches
          pretones    = matches[1]
          tones       = matches[2]
          definition  = matches[3]
          split_pretones = pretones.split
          
          if split_pretones.length > 1
            term_class = split_pretones.last
            term = split_pretones[0..-2].join(" ")
          end
          
          puts term
          puts term_class
          puts tones
          puts definition
          csv << [term, term_class, tones, definition]
        else
        
          puts buffer
          csv << buffer
        end
        puts "---------------------------------------------------------"
        counter = counter + 1
        buffer = line
      end
    end
    end
    
    puts counter
    file.close
  end
end
require 'csv'

class Cleaner
  LANGUAGE, TERM, TERM_CLASS, TONES, DEFINITION, SOURCE  = 0, 1, 2, 3, 4, 5
  
  def self.csv2db(path)     
    CSV.foreach(path) do |row|
      if row[LANGUAGE] == 'ig'
        IgboEntry.create(:term => row[TERM], :term_class => row[TERM_CLASS], :tones => row[TONES], :definition => row[DEFINITION])
       else
         EnglishEntry.create(:term => row[TERM], :term_class => row[TERM_CLASS], :definition => row[DEFINITION])
       end
       
       puts "#{row[LANGUAGE]} #{row[TERM]}"
    end
  end
  
  def self.en2csv(path)
    file    = File.new(path, 'r')
    content = file.read
    counter = 0
    regex   = /[^\.]+\./
    
    CSV.open('public/dict2.csv', 'w') do |csv|
      while match = regex.match(content)
        entry = match[0]
        
        buffer = nil
        entry.lines.each do |line|
          if buffer.nil?
            buffer = line
          elsif /[^\[\]\s]+\[.+\]\s*/.match line
            csv << write_en(buffer)
            counter = counter + 1
            buffer = line
          else
            buffer = buffer + line
          end
        end
        
        unless buffer.nil?
          content = content.sub(entry, '')
          csv << write_en(buffer)
          counter = counter + 1
        end
      end
    end
    
    puts counter
    file.close
  end
  
  def self.write_en(buffer)
    splitted = if /\s+n\s+/.match buffer
      term_class = 'n'
      buffer.split(/\s+n\s+/)
    elsif /\s+v\s+/.match buffer
      term_class = 'v'
      buffer.split(/\s+v\s+/)
    elsif /\s+adj\s+/.match buffer
      term_class = 'adj'
      buffer.split(/\s+adj\s+/)
    elsif /\s+adv\s+/.match buffer
      term_class = 'adv'
      buffer.split(/\s+adv\s+/)
    else
      term_class = ""
      [buffer]
    end  
    
    term = splitted.first.sub(/^\s+/, '')
    definition =  splitted[1..-1].join
    definition = definition ? definition : ""
    puts '------------------------------------------'
    puts term
    return ['en', term, term_class, nil, definition, 'echeruo']
  end
  
  def self.ig2csv(path)
    file    = File.new(path, 'r')
    buffer  = nil
    counter = 0
    regex   = /(\A[^\[\n]+)\[([^\]]+)\](.*\z)/m
    
    CSV.open('public/dict.csv', 'w') do |csv|
      while (line = file.gets)
        if buffer.nil?
          buffer = line
        elsif line.first.blank? || !regex.match(line)
          buffer = buffer + line
        else
          matches     = regex.match(buffer)
          
          if matches
            pretones        = matches[1]
            tones           = matches[2]
            definition      = matches[3]
            split_pretones  = pretones.split
            
            if split_pretones.length > 1
              term_class = split_pretones.last
              term = split_pretones[0..-2].join(" ")
            end
            
            puts term
            puts term_class
            puts tones
            puts definition
            csv << ["ig", term, term_class, tones, definition, "echeruo"]
          else
          
            puts buffer
            csv << ["ig", buffer, "echeruo"]
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
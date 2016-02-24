require_relative 'manager'

file = File.readlines(File.expand_path('contacts.csv', __dir__));
@manager = Manager.new(file)

puts
puts 'FIND BY LAST NAME'
puts
puts 'Where last name starts with <S>'
puts '--------------------------------'
puts @manager.find_by_last_name('S')
puts 
puts 'Where last name starts with <Sa>'
puts '--------------------------------'
puts @manager.find_by_last_name('Sa')
puts 
puts 'FIND BY EMAIL'
puts 
puts 'Where email starts with <L>'
puts '--------------------------------'
puts @manager.find_by_email('L')
puts 
puts 'Where email starts with <La>'
puts '--------------------------------'
puts @manager.find_by_email('La')
puts 

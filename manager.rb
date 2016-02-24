class Manager 

  Contact = Struct.new(:ln, :fn, :e, :p) do
    def sorter; ln end
    def print; "Last: #{ln}, First: #{fn}, Phone: #{p}, E-mail: #{e}" end
  end

  def initialize(file) 
    @indexes, @contacts = {}, []
    add_contacts(file)
  end

  def find_by_email(email)
    find(:email, email)
  end

  def find_by_last_name(lname)
    find(:last_name, lname)
  end

  private

  def add_contacts(file)
    @contacts = file.map.with_index do |line, i|
      next if i.zero?
      fn, ln, e, p = line.split(',').map(&:strip)
      [[:last_name, ln, i], [:email, e, i]].each { |a| add_indexes(*a) }
      Contact.new(ln, fn, e, p)
    end
  end

  def add_indexes(bucket, s, i)
    s = s.downcase
    while !s.empty? do
      @indexes[bucket] ||= {}
      (@indexes[bucket][s] ||= []).push(i)
      s = s.slice(0, s.length-1)
    end
  end

  def find(bucket, s)
    (@indexes[bucket][s.downcase] || []).map(&at).sort_by(&:sorter).map(&:print)
  end

  def at 
    Proc.new { |i| @contacts[i] }
  end

end

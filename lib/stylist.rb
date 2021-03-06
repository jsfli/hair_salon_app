class Stylist

  define_method(:initialize) do |attributes|
    @id = attributes.fetch(:id)
    @name = attributes.fetch(:name)
  end

  attr_reader(:id, :name)

  define_singleton_method(:all) do
    returned_stylists = DB.exec("SELECT * FROM stylists;")
    stylists=[]
    returned_stylists.each() do |stylist|
      name = stylist.fetch("name")
      id = stylist.fetch("id").to_i()
      stylists.push(Stylist.new({:id=>id, :name=>name}))
    end
    stylists
  end

  define_method(:==) do |another_stylist|
    self.id().==(another_stylist.id()) &&
    self.name().==(another_stylist.name())
  end

  define_method(:save) do
    result = DB.exec("INSERT INTO stylists (name) VALUES ('#{@name}') RETURNING id;")
    @id = result.first().fetch("id").to_i()
  end

  define_singleton_method(:find) do |id|
    found_stylist = nil
    Stylist.all().each() do |stylist|
      if stylist.id().==(id)
        found_stylist = stylist
      end
    end
    found_stylist
  end

  define_method(:update) do |attributes|
    @name = attributes.fetch(:name, @name)
    @id = self.id()
    DB.exec("UPDATE stylists SET name = '#{@name}' WHERE id = #{@id};")
  end

  define_method(:delete) do
    DB.exec("DELETE FROM stylists WHERE id=#{self.id()};")
    DB.exec("DELETE FROM clients WHERE stylist_id = #{self.id()};")
  end

  #one stylist to many clients relationship

  define_method(:clients) do
    stylist_clients = []
    clients = DB.exec("SELECT * FROM clients where stylist_id = #{self.id()};")
    clients.each() do |client|
      id = client.fetch("id").to_i()
      name = client.fetch("name")
      stylist_id = client.fetch("stylist_id").to_i()
      stylist_clients.push(Client.new({:id=>id, :name=>name,:stylist_id=>stylist_id}))
    end
    stylist_clients
  end

end

def what_we_should_start_doing
  week = 9
    until week == 16 do
      puts "please refer to my previous feedback comments"
      week += 1
    end
end

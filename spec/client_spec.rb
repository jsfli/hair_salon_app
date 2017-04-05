require('spec_helper')

describe(Client) do

  before() do
    @test_client = Client.new({:id=>nil, :name=>"Client 1", :stylist_id=>1})
  end

  describe("#initialize") do
    it('initialize a client with all the parameters') do
      expect(@test_client.id()).to(eq(nil))
      expect(@test_client.name()).to(eq('Client 1'))
      expect(@test_client.stylist_id()).to(eq(1))
    end
  end

  describe('.all') do
    it('list of clients should be empty initially') do
      expect(Client.all()).to(eq([]))
    end
  end

  describe('#==') do
    it("is the same client if it has the same parameters") do
      test_client2 = Client.new({:id=>nil, :name=>"Client 1", :stylist_id=>1})
      expect(@test_client).to(eq(test_client2))
    end
  end

  describe('#save') do
    it('lets you save a client to the database') do
      @test_client.save()
      expect(Client.all()).to(eq([@test_client]))
    end
  end

  describe('.find') do
    it('returns a client by its id') do
      @test_client.save()
      test_client2 = Client.new({:id=>nil, :name=>"Client 2", :stylist_id=>2})
      test_client2.save()
      expect(Client.find(test_client2.id())).to(eq(test_client2))
    end
  end

  describe("#update") do
    it("lets you update the client attributes in the database") do
      @test_client.save()
      @test_client.update({:name => "Client 2"})
      @test_client.update({:stylist_id => 2})
      expect(@test_client.name()).to(eq("Client 2"))
      expect(@test_client.stylist_id()).to(eq(2))
    end
  end

  describe("#delete") do
    it("delete a client from the database") do
      @test_client.save()
      @test_client.delete()
      expect(Client.all()).to(eq([]))
    end
  end

  #CRUDL functionalities done

end #end of Client test

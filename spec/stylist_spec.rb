require('spec_helper')

describe(Stylist) do

  before() do
    @test_stylist = Stylist.new({:id => nil, :name=>"Stylist 1"})
  end

  describe('#initialize') do
    it('initialize a stylist with all the parameters') do
      expect(@test_stylist.id()).to(eq(nil))
      expect(@test_stylist.name()).to(eq("Stylist 1"))
    end
  end

  describe('.all') do
    it('list of stylists should be empty initially') do
      expect(Stylist.all()).to(eq([]))
    end
  end

  describe('#==') do
    it("is the same stylist if it has the same parameters") do
      test_stylist2 = Stylist.new({:id => nil, :name=>"Stylist 1"})
      expect(@test_stylist).to(eq(test_stylist2))
    end
  end

  describe('#save') do
    it('lets you save a stylist to the database') do
      @test_stylist.save()
      expect(Stylist.all()).to(eq([@test_stylist]))
    end
  end

  describe('.find') do
    it('returns a stylist by its id') do
      @test_stylist.save()
      test_stylist2 = Stylist.new({:id => nil, :name=>"Stylist 2"})
      test_stylist2.save()
      expect(Stylist.find(test_stylist2.id())).to(eq(test_stylist2))
    end
  end

  describe("#update") do
    it("lets you udpate the name of the stylist in the database") do
      @test_stylist.save()
      @test_stylist.update({:name=>"Stylist 2"})
      expect(@test_stylist.name()).to(eq("Stylist 2"))
    end
  end

  describe("#delete") do
    it("delete a stylist from the database") do
      @test_stylist.save()
      @test_stylist.delete()
      expect(Stylist.all()).to(eq([]))
    end
  end

  #CRUDL functionalities done

  #linkage

  describe('#clients') do
    it('returns an array of clients for that stylist') do
      @test_stylist.save()
      test_client = Client.new({:id=>nil, :name=>"Client 1", :stylist_id=>@test_stylist.id()})
      test_client.save()
      test_client2 = Client.new({:id=>nil, :name=>"Client 1", :stylist_id=>@test_stylist.id()})
      test_client2.save()
      expect(@test_stylist.clients()).to(eq([test_client, test_client2]))
    end
  end

end #end of Stylist describe

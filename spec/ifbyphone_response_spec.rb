# encoding: utf-8

require File.join(File.dirname(__FILE__), '..', 'lib', 'ifbyphone_response')

describe Route do 

  before(:each) do 
    @route = Route.new
  end  

  describe "#hangup" do
    it 'Should respond with valid xml' do 
      result = @route.hangup
      result.should eql '<action><app>hangup</app></action>'
    end
  end
  
  describe "#transfer" do 
    it 'should respond with valid xml' do 
      result = @route.voicemail(1234)
      result.should == '<action><app>voicemail</app><parameter><id>1234</id></parameter></action>'
    end
  end
  
  describe "#trasnfer" do 
    it 'should respond with valid xml' do 
      result = @route.transfer(1112223333)
      result.should == '<action><app>transfer</app><parameter><destination>1112223333</destination></parameter></action>'
    end
  end
  
  describe "#survo" do 
    it 'should respond with valid xml' do 
      result = @route.survo(1234, {'foo' => 'bar'}, 'passthrough')
      result.should == '<action><app>survo</app><parameter><id>1234</id><user_params><foo>bar</foo></user_params><pt>passthrough</pt></parameter></action>'
    end
  end
  
  describe "#findme" do 
    it 'should respond with valid xml' do 
      result = @route.findme(1234)
      result.should == '<action><app>findme</app><parameter><id>1234</id></parameter></action>'
    end
  end
  
  describe "#findme_list" do 
    it 'should respond with valid xml' do 
      result = @route.findme_list([1112223333, 2223334444], {'nextactionitem' =>  7})
      result.should == '<action><app>findme</app><parameter><phone_list>1112223333|2223334444</phone_list><nextactionitem>7</nextactionitem></parameter></action>'
    end
  end
  
  describe "#virtual_receptionist" do 
    it 'should resond with valid xml' do 
      result = @route.virtual_receptionist(1234)
      result.should == '<action><app>vr</app><parameter><id>1234</id></parameter></action>'
    end
  end
  
  describe "#voicemail" do 
    it 'should respond wiht valid xml' do 
      result = @route.voicemail(1234)
      result.should == '<action><app>voicemail</app><parameter><id>1234</id></parameter></action>'
    end
  end
end

require 'rexml/document'

class Route
  include REXML
  
  # Initialize new dom doc and global elements
  def initialize 
    @doc    = Document.new 
    @action = @doc.add_element('action')
    @param  = Element.new('parameter')
  end
  
  # Performa a blind transfer
  #
  # @param [int] num | transfer number
  # @return [string]
  def transfer(num)
    @action.add_element('app').text = 'transfer'
    @action.add_element(@param)
    @param.add_element('destination').text = num
    return @doc.to_s
  end
  
  # Route a caller to an IVR app
  #
  # @param [int] id | IVR ID
  # @param [hash] usr_param | customer user parameters
  # @pt [string] | user defined string
  # @return [string]
  def survo(id, usr_param={}, pt='') 
    self.helper('survo', id)
    
    if usr_param.any?
      params = @param.add_element('user_params')
      usr_param.each do |k,v|
        params.add_element(k).text = v
      end  
    end
    
    unless pt.nil?
      @param.add_element('pt').text = pt
    end
    return @doc.to_s
  end
  
  # Route caller to a findme (hunt group) app
  #
  # @param [int] id | findme ID
  # @return [string]
  def findme(id)
    self.helper('findme',id)
    return @doc.to_s
  end
  
  # Dynamically create a hunt group
  #
  # @param [array] list | list of transfer numbers
  # @param [hash] config | additional options
  # @return [string]
  def findme_list(list, config={})
    @action.add_element('app').text = 'findme'
    @action.add_element(@param)
    @param.add_element('phone_list').text = list.join('|')
    
    if config.any?
      config.each do |k,v|
        @param.add_element(k).text = v
      end
    end
    return @doc.to_s
  end
  
  # Route caller to a virtual receptionist
  #
  # @param [int] id | VR ID
  # @return [string]
  def virtual_receptionist(id)
    self.helper('vr',id)
    return @doc.to_s
  end
  
  # Route caller to a voicemail app
  #
  # @param [int] int | VM ID
  # @return [string]
  def voicemail(id)
    self.helper('voicemail',id)
    return @doc.to_s
  end
  
  # Gracefully hangu up a call
  # 
  # @return [string]
  def hangup
    @action.add_element('app').text = 'hangup'
    return @doc.to_s
  end
  
  # Convenience method
  #
  # @param [string] app
  # @param [int] id
  def helper(app, id) 
    @action.add_element('app').text = app
    @action.add_element(@param)
    @param.add_element('id').text = id
  end
end
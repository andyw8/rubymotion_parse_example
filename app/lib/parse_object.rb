class ParseObject
  attr_accessor :object # is this bad?

  def initialize(params={})
    @object = PFObject.objectWithClassName(self.class.name)
    params.map { |key, value| object[key] = value }
  end

  def []=(key, value)
    @object[key] = value
  end

  def save
    block = lambda do |succeeded, error_pointer|
      puts "succeeded: #{succeeded}"
      if error_pointer
        puts "error_pointer: #{error_pointer[0].inspect}"
      end
    end
    @object.saveInBackgroundWithBlock(block)
  end

  def object_id
    @object.objectId
  end

  def name
    if @object['name'] && @object['name'] != ''
      @object['name']
    elsif @object['title'] && @object['title'] != ''
      @object['title']
    else
      'Untitled'
    end
  end

  def created_at
    @object.createdAt
  end

  def updated_at
    @object.updatedAt
  end

  def to_s
    "#<#{self.class.name} object_id:#{object_id}>"
  end

  # TODO where does this belong?
  def self.instantiate(object)
    parse_object = new
    parse_object.object = object
    parse_object
  end

  def self.expire_cache
    store.expire_cache
  end

  def self.create(params)
    # TODO move into WidgetStore?
    new_object = PFObject.objectWithClassName(self.to_s)
    params.each { |key, val| new_object[key] = val }
    new_object.ACL = PFACL.ACLWithUser(PFUser.currentUser)
    new_object.saveInBackground
  end

  private

  def store
    raise "Abstract method called"
  end
end

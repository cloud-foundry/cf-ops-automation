class ResourceTypes
  attr_reader :resource_types

  def initialize(resource_types = [])
    @resource_types = resource_types
  end

  def self.load(yaml_data)
    loaded_resource_types = []
    yaml_data.each do |resource_type_yaml|
      loaded_resource_types << ResourceType.load(resource_type_yaml)
    end
    ResourceTypes.new(loaded_resource_types)
  end

  def to_a
    @resource_types
  end

  def ==(other)
    return false unless other.is_a?(ResourceTypes)
    @resource_types == other.resource_types
  end

  alias eql? ==

  def empty?
    @resource_types.empty?
  end
end
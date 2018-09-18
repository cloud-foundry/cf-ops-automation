class ResourceType
  attr_reader :name, :type, :source

  def initialize(name, type, source)
    @name = name
    @type = type
    @source = source
  end

  class << self
    def load(yaml_data)
      ResourceType.new(yaml_data['name'], yaml_data['type'], ResourceTypeSource.load(yaml_data['source']))
    end
  end

  def ==(other)
    return false unless other.is_a?(ResourceType)
    @name == other.name && @type == other.type && @source == other.source
  end
end

class ResourceTypeSource
  attr_reader :repository, :tag

  def initialize(repository, tag)
    @repository = repository
    @tag = tag
  end

  def ==(other)
    return false unless other.is_a?(ResourceTypeSource)
    @repository == other.repository && @tag == other.tag
  end

  alias eql? ==

  class << self
    def load(yaml_data)
      ResourceTypeSource.new(DockerRepository.load(yaml_data['repository']), DockerTag.load(yaml_data['tag']))
    end
  end
end

class DockerRepository
  attr_reader :name

  def initialize(name)
    @name = name.to_s
  end

  def ==(other)
    return false unless other.is_a?(DockerRepository)
    @name == other.name
  end

  alias eql? ==

  class << self
    def load(yaml_data)
      DockerRepository.new(yaml_data)
    end
  end
end

class DockerTag
  attr_reader :name

  def initialize(name)
    @name = name.to_s
  end

  def interpolated_name
    if @name.to_s.empty?
     'latest'
    else
      name.to_s
    end
  end

  def ==(other)
    return false unless other.is_a?(DockerTag)
    @name == other.name
  end

  alias eql? ==

  class << self
    def load(yaml_data)
      DockerTag.new(yaml_data)
    end
  end
end
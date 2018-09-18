require 'yaml'

class ConcoursePipeline
  attr_reader :name, :resource_types

  def initialize(name = 'undefined', yaml = {})
    @name = name
    @pipeline_yaml = yaml
    @pipeline = {}
    @resource_types = []
  end

  def self.load_file(pipeline_name, filename)
    ConcoursePipeline.new(pipeline_name, YAML.load_file(filename))
  end

  def load
    @resource_types = ResourceTypes.load(@pipeline_yaml['resource_types'] || {})
    self
  end
end
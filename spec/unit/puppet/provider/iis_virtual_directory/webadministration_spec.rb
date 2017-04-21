require 'spec_helper'

provider_class = Puppet::Type.type(:iis_virtual_directory).provider(:webadministration)

describe provider_class do
  let(:facts) {{
    iis_version: '8.0',
    operatingsystem: 'Windows'
  }}

  let(:resource) {
    result = Puppet::Type.type(:iis_virtual_directory).new(:name => "iis_virtual_directory")
    result.provider = subject
    result
  }

  it 'should be an instance of the correct provider' do
    expect(resource.provider).to be_an_instance_of Puppet::Type::Iis_virtual_directory::ProviderWebadministration
  end

  [:name].each do |method|
    it "should respond to the class method #{method}" do
      expect(provider_class).to respond_to(method)
    end
  end

  [:exists?, :create, :destroy, :update].each do |method|
    it "should respond to the instance method #{method}" do
      expect(provider_class.new).to respond_to(method)
    end
  end
end

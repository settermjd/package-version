require './package_version.rb'

RSpec.describe PackageVersion do

  describe 'can find the current version from a valid semver string' do

    it 'Can validate a valid semantic version string' do
      package_version = PackageVersion.new
      current_version = '2.2.0'
      required_version = 2
      satisfies = package_version.satisfies(
        required_version,
        current_version
      )
      expect(satisfies).to eq(true)
    end

    it 'Can validate a valid semantic version string' do
      package_version = PackageVersion.new
      current_version = '2.2.0.0-1ppa~trusty'
      required_version = 2
      satisfies = package_version.satisfies(
        required_version,
        current_version
      )
      expect(satisfies).to eq(true)
    end

    it 'Can validate a valid semantic version string' do
      package_version = PackageVersion.new
      current_version = 'ppa~trusty'
      required_version = 2
      satisfies = package_version.satisfies(
        required_version,
        current_version
      )
      expect(satisfies).to eq(false)

    end
    
  end

end

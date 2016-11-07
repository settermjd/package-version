require 'sem_version'

class PackageVersion

  # Check if a package matches a required version
  def satisfies(required_version, current_version)

    satisfies_version = false

    if SemVersion.valid?(current_version)
      satisfies_version = SemVersion.new(current_version).satisfies?(">= #{required_version}")
    else
      ver = /(\d\.\d*\.\d*)/.match(current_version)

      if ver != nil
        satisfies_version = SemVersion.new(ver[0]).satisfies?(">= #{required_version}")
      end
    end

    satisfies_version

  end

end

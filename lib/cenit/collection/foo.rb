require "cenit/collection/foo/version"

module Cenit
  module Collection
    require "cenit/collection/foo/build"
    require "cenit/client"

    # bundle exec irb -I lib -r 'cenit/collection/foo'
    # config = {:push_url => "https://www.cenithub.com/api/v1/push", :connection_token => "My Conn Token", :connection_key => "My Conn Key"}
    # config = {:push_url => "https://www.cenithub.com/api/v1/push", :user_token => "My User Token", :user_key => "My User Key"}
    # Cenit::Collection::Foo.push_collection config
    # Cenit::Collection::Foo.shared_collection

    @foo = Cenit::Collection::Foo::Build.new

    # Include Collection Gem dependency
    # require "cenit/collection/[My Dependency Collection]/build"
    # Collection dependency
    # @foo.register_dep(Cenit::Collection::[My Dependency Collection]::Build.new)

    def self.push_collection (config)
      Cenit::Client.push(@foo.shared_collection.to_json, config)
    end

    def self.show_collection
      @foo.shared_collection
    end

    def self.pull_collection (parameters,config)
      @foo.shared_collection
    end

    def self.push_sample(model, config)
      Cenit::Client.push(@foo.sample_data(model).to_json, config)
    end
  end
end
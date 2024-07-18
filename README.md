# private-ruby-gem-server

## Step 1: Create a Simple Gem

- Create a Directory for Your Gem:

```
mkdir ghost_mode
cd ghost_mode
```

- Create the Gem Specification File (ghost_mode.gemspec):

```
Gem::Specification.new do |spec|
  spec.name          = "ghost_mode"
  spec.version       = "0.1.0"
  spec.authors       = ["Your Name"]
  spec.email         = ["your.email@example.com"]

  spec.summary       = %q{A spooky example gem}
  spec.description   = %q{This gem is created for demonstration purposes and adds a ghostly touch to your code.}
  spec.homepage      = "http://example.com"
  spec.license       = "MIT"

  spec.files         = Dir["lib/**/*.rb"]
  spec.require_paths = ["lib"]
end
```

- Create the Gem Code:
Create a lib directory and add a Ruby file, for example, lib/ghost_mode.rb:

```
module GhostMode
  def self.hello
    "Hello, spooky world!"
  end
end
```

- Build the Gem:

```
gem build ghost_mode.gemspec
```

This will create a file named ghost_mode-0.1.0.gem.

## Step 2: Set Up the Private Gem Server

- Create a Directory for the Server:

```
mkdir ghost_mode_server
cd ghost_mode_server
```

- Create the Configuration File (config.ru):

```
require 'rubygems'
require 'geminabox'

Geminabox.data = File.join(File.dirname(__FILE__), 'data')
run Geminabox::Server
```

- Start the Server:
```
rackup
```

This will start the server on http://localhost:9292.

## Step 3: Publish Your Gem to the Private Server

- Install geminabox (if not already installed):

```
gem install geminabox
```

- Push Your Gem to the Server:

```
gem inabox ghost_mode-0.1.0.gem --host http://localhost:9292
```

## Step 4: Use the Private Gem Server

- Configure RubyGems to Use Your Private Server:

```
gem sources --add http://localhost:9292
gem sources --remove https://rubygems.org/
```

- Install Your Gem:

```
gem install ghost_mode
```

- or in a Gemfile

```
source 'http://localhost:9292' do
  gem 'ghost_mode'
end

```
Use Your Gem:
In a Ruby script or IRB, you can now use your gem:

```
require 'ghost_mode'
puts GhostMode.hello
```

This should output:

```
Hello, spooky world!
```

By following these steps, you have created the ghost_mode gem, hosted it on a private gem server using geminabox, and installed it from your private server.

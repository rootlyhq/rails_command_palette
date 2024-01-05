# rails_command_palette

A command palette for Rails using Stimulus and [Ninja Keys](https://github.com/ssleptsov/ninja-keys).

## Install

Install the gem:

    bundle add rails_command_palette --github=rootlyhq/rails_command_palette

Install Ninja Keys:

    yarn add --dev ninja-keys

Install the Stimulus controller:

    rails g command_palette:install

## Usage

### Controller

`add_command(id:, title:, href: nil, frame: nil, hotkey: nil, icon: nil, section: nil, parent: nil, children: nil, **options)`

`frame` is used when calling `Turbo.visit` for commands with `href`. `icon` accepts HTML.

### View

`<%= command_palette %>`

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

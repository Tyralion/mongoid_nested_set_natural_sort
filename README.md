# MongoidNestedSetNaturalSort

Natural sorting for mongoid nested set

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'mongoid_nested_set_natural_sort'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install mongoid_nested_set_natural_sort

## Usage

Add in your model, after `acts_as_nested_set`

```ruby

  class Catalog

    include Mongoid::Document

    acts_as_nested_set

    nested_set_natural_sort

    ...

```

By default, gem sort by field `name`. You cat change it

```ruby

  class Catalog

    include Mongoid::Document

    acts_as_nested_set

    nested_set_natural_sort by_field: :title

    ...

```

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/Tyralion/mongoid_nested_set_natural_sort

### License

Author: Tyralion (piliaiev@gmail.com)

Copyright (c) 2016 Tyralion, released under the BSD license


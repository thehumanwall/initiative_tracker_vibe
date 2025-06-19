# README

This README would normally document whatever steps are necessary to get the
application up and running.

* Install

`brew install ruby@3.3`
`gem install rails:8.0.2`

* Ruby version
3.3.6 
[install docs](https://www.ruby-lang.org/en/documentation/installation/)

* Rails version
8.0.2

* Open a Rails Console

If you have a running container: 
- you can run this to open a rails console in that container: `podman exec -it core_organizational_roadmap_experience bin/rails c`
- you can also open a terminal directly in the container in podman desktop, by default it is a bash terminal, but you can run `bin/rails c` to get a rails console.

If you're running the app locally:
- it should be smart enough to know how to get to your application by just opening a `bin/rails c` in your normal terminal

* Database initialization
migrate and seed: `bin/rails db:prepare` # do this anytime you alter the database, or the first time you run the app
restart fresh: `bin/rails db:drop:_unsafe db:prepare` # reset the data in your database file

* Database interaction
Open a rails terminal:
- you can just open a rails termnial and start calling methods.
  - All the models should be accessible to you and you can call the active_record methods on them.
  - example: `User.first`
  - The models do not typically show you what is available. By default, rails just gives you everything as specified in their docs, and if you want to customize it you just have to override the default behavior. 
  - If you are looking for what columns are available to set or filter by on the model, you can call `User.column_names` to get a list back. 

Using a visualizer tool
- you can download something like [Db Browser](https://sqlitebrowser.org/dl/). This is a dedicated tool for this, but I am sure most visualization tools have a way to connect to a SQLite instance.
- Just point your tool at your database file which should be here: `./storage/development.sqlite3`

* Run the App
`bin/bundle install`
`bin/dev`

* Run the App in a container without compose
`podman build -t core_organizational_roadmap_experience -f ./Dockerfile`
`podman run -dt --name core_organizational_roadmap_experience -p 3000:3000 -v $(pwd):/rails core_organizational_roadmap_experience`
`podman exec -it core_organizational_roadmap_experience bin/rails db:prepare`

* Run the App in a container with compose
database up, application up: `podman compose up -d`
Only migrate: `podman compose run --rm db_setup`

* How to run the test suite
`bin/rails test`

* How to run linter
`bin/rubocop`

* General patterns that might help

- an `!` means that it will throw an exception if it does not succeed. An example is `save` which will return false if it cannot save the model you're interacting with -vs- `save!` which will throw an exception.
- a `?` means that a method returns a boolean true or false, an example is `exists?`
- the last object in a method will always return. An example is `def new_user; @user = User.create end` will always return `@user`
- `self` refers to the current object
- `||=` means to assign to the variable only if the variable is nil or false. A usage would be `option ||= "some default"` meaning if option is not already set, set it to `"some default"`.
- This is generally a good style guide, but I just wanted to call out some things that might be a little different than what you're used to.
  - [if-vs-unless](https://github.com/rubocop/ruby-style-guide?tab=readme-ov-file#if-vs-unless). It favors human-readability, so you would generally see a lot of one-liner 


* vscode extentions

https://marketplace.visualstudio.com/items?itemName=aliariff.vscode-erb-beautify
https://marketplace.visualstudio.com/items?itemName=aki77.rails-db-schema
https://marketplace.visualstudio.com/items?itemName=Shopify.ruby-extensions-pack
https://marketplace.visualstudio.com/items?itemName=Shopify.ruby-lsp
https://marketplace.visualstudio.com/items?itemName=hridoy.rails-snippets
https://marketplace.visualstudio.com/items?itemName=sorbet.sorbet-vscode-extension
https://marketplace.visualstudio.com/items?itemName=misogi.ruby-rubocop
https://marketplace.visualstudio.com/items?itemName=mbessey.vscode-rufo

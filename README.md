# Ruby Thread Demo

Demo to illustrate Ruby threads when calling external APIs. Ruby threads are governed by the Global Interpreter Lock( GIL), which ensures only Ruby operation is executed by the interpreter each time. More info on Ruby threads:
- https://buildingvts.com/threading-in-mri-ruby-for-fun-and-performance-34a0e1bc6c70

`bundle install` to install dependencies

start 2 separate server processes:
- `ruby api/server.rb -p 4567`
- `ruby api/server.rb -p 4568`

execute client:
- `ruby client/app.rb`

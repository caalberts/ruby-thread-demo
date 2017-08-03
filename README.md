# Ruby Thread Demo

Demo to illustrate Ruby threads when calling external APIs. Ruby threads are governed by the Global Interpreter Lock( GIL), which ensures only Ruby operation is executed by the interpreter each time. More info on Ruby threads:
- https://buildingvts.com/threading-in-mri-ruby-for-fun-and-performance-34a0e1bc6c70

## How to run?

`bundle install` to install dependencies

start 2 separate server processes:
- `ruby api/server.rb -p 4567`
- `ruby api/server.rb -p 4568`

execute client:
- `ruby client/app.rb`

## Results

The code will execute 2 sets of tasks, each with and without threads. It then prints out the total time in seconds taken to complete each task.

```
"REMOTE CALL WITHOUT THREADS"
200
200
Total time: 10.064001

"REMOTE CALL WITH THREADS"
200
200
Total time: 5.009129
```

```
"CODE EXECUTION WITHOUT THREADS"
100000000
100000000
Total time: 9.074766

"CODE EXECUTION WITH THREADS"
100000000
100000000
Total time: 9.069736
```

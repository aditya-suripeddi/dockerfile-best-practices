# A simple rest application using Flask 

The application allows you to:

       1. Add new task 
       2. View all existing tasks
       3. Update / Delete a task 


## Setting up and running the application 

```

# clone / download the repo 
$ cd dockerfile-best-practices/flask-rest 

$ docker build -t task-master .

$ docker run -p5001:5000 task-master 
```


Go to https://localhost:5001 in your browser


## References 

  1. [Learning Flask for python](https://www.youtube.com/watch?v=Z1RJmh_OqeA&list=PLzk3fF6cDjlS90xhsBlH8SIN7uwpUca5x&index=45)

  2. [github link for above video](https://github.com/jakerieger/FlaskIntroduction)
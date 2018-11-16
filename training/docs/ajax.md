# AJAX
- Asynchronous JavaScript And XML
- Not a programming language.
- It uses a combination of
    - Browser built-in XMLHttpRequest object - To request data from server.
    - JS and HTML DOM - To display or use the data.
- ## Working

![](ajax.gif)


- ## The XMLHttpRequest Object
    - Creating Request
        ```
        variable = new XMLHttpRequest();
        ```
    - For more request object methods
        - [XMLHttpRequest Object Methods](https://www.w3schools.com/xml/ajax_xmlhttprequest_create.asp)
- ## Send a Request To a Server
     ```
        xhttp.open("GET", "ajax_info.txt", true);
        xhttp.send();
    ```
    - open(method, url, async)
    ```
    - method is two type 
        - GET
        - POST
    - url - specifies the server location.
    - async - if true request is asynchronous otherwise synchronous.
    ```

    - send() - Send the request to the server by GET method.
    - send(string) - Send the request to server by POST method.
- ## GET and POST
    - GET is simpler and faster than POST
    - POST is more secure and robust than GET
    - POST uses 
        -  Sending large amount of data
        -  Sending user input
    - POST example :-
        ```
        xhttp.open("POST", "demo_post2.asp", true);
        xhttp.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
        xhttp.send("fname=Henry&lname=Ford");
       ```


### Passing the parameter in ajax get
```
var request = $.ajax({
    url: 'url',
    type: 'GET',
    data: { field1: "hello", field2 : "hello2"} ,
    contentType: 'application/json; charset=utf-8'
});

request.done(function(data) {
      // your success code here
});

request.fail(function(jqXHR, textStatus) {
      // your failure code here
});
```


### Passing the parameter in ajax post
```
$.ajax({
        url: 'superman',
        type: 'POST',
        data: { field1: "hello", field2 : "hello2"} ,
        contentType: 'application/json; charset=utf-8',
        success: function (response) {
            alert(response.status);
        },
        error: function () {
            alert("error");
        }
    }); 

```
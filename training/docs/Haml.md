# Haml

- HTML Abstraction Markup Language.
- It is white space active, Well formatted markup language, and Integrates Ruby code.
- Indentation is important.
  
### Installing
- Install the Haml gem.
  ```
  gem install haml
  ```
- Run Haml code in comman line.
  ```
  haml input.haml output.html
  ```
- To use Haml in Rails
  ```
  gem 'haml'
  ```
### Convert erb to haml
In Haml, write the tags using the percent sign and then the name of the tag.

> Eg: %strong, %div, %body, %html ...

- 1
  - ERB
    ```
    <strong><%= item.title %></strong>
    ```
  - Haml
    ```
    %strong= item.title
    ```
- 2
  - HTML 
    ```
    <strong class="code" id="message">Hello, World!</strong>
    ```
  - Haml
    ```
    %strong{:class => "code", :id => "message"} Hello, World!
    ```
- div tags are so common, Then no need to use the tag definition.
- Example :-
- 3
  - HTML
    ```
    <div class='content'>Hello, World!</div>
    ```
  - Haml
    ```
    .content Hello, World!
    ```
  
- 4
  - ERB
    ```
    <div class='item' id='item<%= item.id %>'>
    <%= item.body %>
    </div>
    ```
  - Haml
    ```
    .item{:id => "item#{item.id}"}= item.body
    ```



## Lessons learned & hints


Most of you got the  `Table 'users' already exists error` after cloning the crowdfunder-in-class and running a rake command.
This is because you cannot have two databases with the same name in postgres. When you clone a rails application twice you have to update the database name in database.yml

---

```
  rake db:test:prepare
```
Rebuilds your test database.
Whenever your run rake db:SOMETHING commands (ex. rake db:migrate) the commands run in the development environment. To run a rake command in the test environment (say you want to migrate your test database) you can run 

```
    rake db:migrate RAILS_ENV=test
```
The rake db:test:prepare command runs a series of rake commands to rebuild your test database from scratch.

---

Sometimes you want to pass data from a form to the controller implicitly (without the user having to input the data). For example in the crowdfunder app we have a form on the project#show page that allows the user to create a new pledge.

```
  <%= form_for @pledge do |f| %>
    <p>
        Amount <br>
        <%= f.text_field :amount %>
    </p>
    <%= f.submit "Pledge Now" %>
  <% end %>

```

We ask the user to enter the `amount` for the plege and click the 'Pledge Now' button. However in our database we have to store a `user_id` and a `project_id` along with the amount.

When we render the projects#show page we know which project the plege is for. We need to pass the `project_id` to the PledgesController. To do this we use the [`hidden_field`](http://api.rubyonrails.org/classes/ActionView/Helpers/FormHelper.html#method-i-hidden_field).

```
  <%= form_for @pledge do |f| %>
    <%= f.hidden_field :project_id, @project.id %>
    <p>
        Amount <br>
        <%= f.text_field :amount %>
    </p>
    <%= f.submit "Pledge Now" %>
  <% end %>

```
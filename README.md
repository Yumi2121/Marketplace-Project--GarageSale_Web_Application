# Marketplace Project - Online Garage Sale Web Application

### by Zumin Yu  

**Website:** 

**GitHub Repo:** https://github.com/Yumi2121/CA-T2A2-Marketplace-Project (private to public)





## Table of Contents















## Application Purpose

Garage sale, always been a very popular event in Australia with a long history. However, it is always comes with few problems:

- Hard to know where garage sales events near me
- Hard to know the garage sale time
- Hard to know if the garage sale got the items I want
- Not practical if the location is too far from me
- For a garage sale host, the unpredictable weather is a risk

The above problem needs to be solved because garage sale not only brings us a sustainable environment, but also brings the communities together and fostered neighborhood relationships. On top of that, selling an unwanted item and getting back extra money are always a fun deal.

This online garage sale application was inspired by the traditional garage sale, and aiming to help on the problem was mentioned above.



## Target audience

The target audience for this application are those who want to sell their unwanted items, and those who want to buy second-hand items with reasonable prices, especially the people who support sustainable lifestyles. 



## User stories 

- As a new app user, I want to be able to sign up, so that I can buy and sell items. 
- As an existing app user, I want to be able to sign in, so that I can buy and sell items. 
- As a signed in user, I want to be able to sign out, so I feel safe when I close the website. 
- As a buyer Amy, I want to be able to find them by category, so I can easily find the item I want to buy. 
- As a buyer, Bobbi, I want to be able to search for the item I want to buy, so that I don't need to look through all the items which I think is wasting my time.
- As a seller of Cici, I want to be able to sell my items in this app, so that I can get extra money.
- As a buyer of Didi, I want to be able to see more details of the items I want to buy, for example a bigger image of the item and the location of the seller, so that I can consider all the situations to help me make a decision of purchase.
- As a buyer Fang, I want to be able to make payments online by using a credit card, so that I don't need to use cash.
- As a user Lucy, I want to have a separate page of my profile, so that I can view my profile details and update them if necessary.
- As a user of Zizi, I am a seller and a buyer. I want to be able to view my selling items, so I have better control of it.
- As a user of Zizi, I am a seller and a buyer. I want to be able to view my bought items, so I have better control of it.
- As a user of Zizi, I am a seller and a buyer. I want to be able to view my sold items, so I have better control of it.



## Functionality and Features

- sign in, sign up, sign out

- Filter sale items by catagory

- Search items

- become a seller

- view item details

- puchase item

- view sellers location

- my profile, be able to view, update

- view all my sale item

- view all bought item

- view all sold items

  



## Screenshots







## Sitemap





## Wireframes







## Application components and their associations (high-level) -R15

1.Explain the different high-level components (abstractions) in your *app*(mvc)

2.Describe your projects *models* in terms of the relationships (active record associations) they have with each other

3.Explain how the MVC architecture and concept of inheritance impact the structure of your application and the entities within it (Precisely explains and shows understanding of how the MVC architecture and concept of inheritance impact the structure of your application and the entities within it)



As a typical Rails application, this online garage sale app uses Model View Controller (MVC) architecture pattern. 

- **Model**

  Models represent the data in the application. When a database is being used, each model will represent each table in the database. It also performs data validation to make sure the integrity of the data before they are saved into the database. 

  The following models are used in garage sale applications:

  - `Item`, which inherits from ApplicationRecord. `Item` model has many `orders` and belongs to `User`.
  - `Order`, which inherits from ApplicationRecord. `Order` model belongs to `item` and `user` (buyer and seller).
  - `User`, which inherits from ApplicationRecord. `User` model has many `items`, also has many `sold_orders` and `bought_orders`. 
  - ApplicationRecord inherit from `ActiveRecord::Base`, which defines some helpful method that will apply to all models belonging to ApplicationRecord. in this app, define `self.abstract_class= true` . 

- **Controller**

  It acted as an interface between the view and the model. It also consists of actions, which map to specific routes. The following controller are used in garage sale applications:

  - `Items` Controller, which inherits from ApplicationController. It defines methods such as index, show, new, edit, create, update and destroy. Each of the method has its corresponding view page and mapped to specific routes in `routes.rb`. 
  - `Orders` Controller, which inherits from ApplicationController. It defines `bought` and `sold` action.
  - `Payment` Controller, which inherits from ApplicationController, method `success` was defined and linked to the success  page after the payment. 
  - `User` Controller, which inherits from ApplicationController. `Show` action was defined in this controller to  link to my profile page. 
  - Only ApplicationController inherits from `ActionController::Base`, all other controllers inherit from ApplicationController. This offers special configure requests, for example request forgery protection or give permit to specific parameters in this case. 

- **View**

  It represents the user interface of an application through the HTML file that is embedded in Ruby code in the form of `html.erb` file. View serves two purposes, first it provides controls which allow users to provide the inputs to the application. Second, to display the output of an operation.

  In this app, each controller method has their own corresponding view such as the `user` related view in the 'devise' folder,and it includes sign in, sign up, password change view etc.  `items` related view are in 'items' folder named index, new, show, update etc. `Orders` folder includes 'bought' and 'sold' list page. And the success page in the 'payment' folder. 

  





## ERD





## Database

1.Discuss the database relations to be implemented in your application

2.Provide your database schema design



A relational database model represents the database as a collection of tables, all the relations are saved as table format. And foreign keys are structured into a relational database to link together two or more tables.

This application implimented relational database model and includes 3 tables:

- **Users table**

  User has `user_id` as primary key, and it `has_many` orders. Each user can have 0 to many orders, this includes buying and selling order. User also `has_many` Items, each user can create 0 to many items for sale.

- **Items table**

  Item `belongs_to` Users, it has `item_id` as primary key and a `user_id (seller_id`) as foreign key. Each item has one and only one user, it means an new item will and have to associate with one user. Item also can have 0 or one orders only, it means one item can have no orders, or only one orders associate with it. 

- **Orders table**

  Orders  `belongs_to` Users (seller and buyer) and `belongs_to` Items. It has `order_id` as primary key and three foreign keys: `item_id`, `buyer_id` and `seller_id`. Orders have one-to-one relationship with both Users table and Items table. Each order will link to to one and only one item, same as user. 

  



**Database schema design**:









## Tech stack (e.g. html, css, deployment platform, etc)

### Ruby on Rails

### PostgreSQL

### HTML

### SCSS

### Heroku

### Ruby Gems

- Bootstrap
- **FontAwesome**



## Third party services

- AWS S3 
- Heroku
- Google map





## Project plan and Task Management

















<details><summary>Click me</summary>
 <p>
   #### This is the dropdown content!
  </p>
</details>

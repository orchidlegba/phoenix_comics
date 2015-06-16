# Comics

# prerequisites in postgres 
# create database comics_dev; 
# create user postgres password 'postgres';

To start your new Phoenix application:

1. Install dependencies with `mix deps.get`
2. Start Phoenix endpoint with `iex -S mix phoenix.server`

# Add Comics models wih scaffolding for REST Json API
3. mix phoenix.gen.json Comic comics title:string 
4. mix phoenix.gen.json Author authors firstname:string lastname:string comic_fk:integer 
5. mix phoenix.gen.json Illustrator illustrators firstname:string lastname:string comic_fk:integer
6. mix phoenix.gen.json Currency currencies price:float type:string comic_fk:integer
7. mix ecto.migrate

# Add resource functions in router.ex to handle HTTP REST requests
# resources "/comics", ComicController
# resources "/authors", AuthorController
# resources "/illustrators", IllustratorController
# resources "/currencies", CurrencyController

# TroubleShooting
# if Brunch was not installed then perform `npm install` 

Now you can visit `localhost:4000` from your browser.

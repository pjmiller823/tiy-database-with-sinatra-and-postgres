require 'sinatra'
require 'pg'
require 'sinatra/reloader' if development?

get '/' do
  erb :home
end

get '/employees' do
  database = PG.connect(dbname: "tiy-database")
  @employees = database.exec ("select * from employees")

  erb :employees
end

get '/employee_show' do

  name = params["name"]
  database = PG.connect(dbname: "tiy-database")
  @employees = database.exec("select * from employees where name =$1", [name])

  erb :employee_show
end

get '/new' do
  erb :employees_new
end

get '/employees_new' do
  name = params["name"]
  phone = params["phone"]
  address = params["address"]
  position = params["position"]
  salary = params["salary"]
  github = params["github"]
  slack = params["slack"]
  database = PG.connect(dbname: "tiy-database")
  database.exec("insert into employees (name, phone, address, position, salary, github, slack) values($1, $2, $3, $4, $5, $6, $7)", [name, phone, address, position, salary, github, slack])

  redirect('/')
end
get '/searched' do
  name = params["search"]
  github = params["search"]
  slack = params["search"]
  database = PG.connect(dbname: "tiy-database")
  @employees = database.exec("select * from employees where name like '%#{name}%' or github=$1 or slack=$2", [github, slack])

  erb :searched
end

get '/edit' do
  id = params["id"]
  name = params["name"]
  phone = params["phone"]
  address = params["address"]
  position = params["position"]
  salary = params["salary"]
  github = params["github"]
  slack = params["slack"]
  database = PG.connect(dbname: "tiy-database")
  @employees = database.exec("update employees set name =$1, phone =$2, address =$3, position =$4, salary =$5, github =$6, slack =$7 where id = id", [name, phone, address, position, salary, github, slack])

  erb :edit
end
# employees links to NEW EMPLOYEE page and SEARCH
# nice format for stuff
# Show page must be editable

# ***Make and populate database. (made, add some inputs to see in EMPLOYEES)
# Create a home page and make it look nice
# ***Make pages for home, employee index, employee show, employee new.

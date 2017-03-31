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
  name = params["name"]
  phone = params["phone"]
  address = params["address"]
  position = params["position"]
  salary = params["salary"]
  github = params["github"]
  slack = params["slack"]

  redirect('/')

  erb :employees_new
end

# employees links to NEW EMPLOYEE page and SEARCH
# nice format for stuff
# Show page must be editable

# ***Make and populate database. (made, add some inputs to see in EMPLOYEES)
# Create a home page and make it look nice
# ***Make pages for home, employee index, employee show, employee new.

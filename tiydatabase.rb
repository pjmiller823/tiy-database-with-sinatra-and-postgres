require 'sinatra'
require 'pg'
require 'sinatra/reloader' if development?

get '/' do
  erb :home
end

# Disign webpage with: HOME PAGE, Nav bar showing EMPLOYEES (clickable),
# employees links to NEW EMPLOYEE page and SEARCH
# nice format for stuff
# Show page must be editable

# Make and populate database. (made, add some inputs to see in EMPLOYEES)
# Create a home page and make it look nice
# Make pages for home, employee index, employee show, employee new.

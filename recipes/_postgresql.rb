#
# Install PostgreSQL and creates database
#
db = node["zibbet"]["database"]

include_recipe "postgresql::server" if db["host"] == "localhost"

include_recipe "postgresql::client"

include_recipe "database::postgresql"

postgresql_database db["name"] do
  connection(
    :host => db["host"],
    :port => node["postgresql"]["config"]["port"],
    :username => db["username"],
    :password => db["password"]
  )
end

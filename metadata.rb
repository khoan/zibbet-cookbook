            name "zibbet"
      maintainer "Khoa Nguyen"
     description "Setup DB server"
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
         version "0.0.1"

supports "ubuntu", ">= 12.04"

depends "apt"
depends "database"
depends "postgresql"

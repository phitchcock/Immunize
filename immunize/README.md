## Developer Documentation

#### Requirements
* chruby
* Ruby Version 2.3.0
* Rails 4.2.5

#### Setup
1. Download the repo
2. Run `bundle install` or `bundle update`
3. Start the rails server `rails s`
4. Jump on `localhost:3000` with your browser

#### Rpush Setup
1. Generate SSL Certificates https://github.com/rpush/rpush/wiki/Generating-Certificates
2. Create Rpush App ```
app = Rpush::Apns::App.new
app.name = "iOSApp"
app.certificate = File.read("/lib/certs/sandbox.pem")
app.environment = "sandbox" # APNs environment.
app.password = "certificate password"
app.connections = 1
app.save!
```
3. Running Rpush `rpush start`
4. Rpush documents: https://github.com/rpush/rpush/wiki

#### Info
Landing Page: http://www.sacramentocounty.tech/
Clinic Locations: http://www.sacramentocounty.tech/locations
Admin: http://www.sacramentocounty.tech/admin
API Endpoint Locations: http://www.sacramentocounty.tech/api/v1/locations

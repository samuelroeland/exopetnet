# Installation
Before running the application
add a .env file with a cloudinary API key and
add the mapbox API key as well.

<br>

Example:
Go to project, enter in terminal:
> touch .env

> echo '.env*' >> .gitignore

<br>


# Configuration
### First start with packages:
> bundle install

> yarn install

<br>

### Install Active Storage (Cloudinary)
> rails active_storage:install

<br>

### Initiate database
> rails db:drop

> rails db:create

<br>

### Run migration
> rails db:migrate

<br>


### Start servers
> rails s

> yarn build --watch

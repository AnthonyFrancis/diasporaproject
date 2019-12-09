== README

* run `git clone git@github.com:AnthonyFrancis/diasporaproject.git`

* set ruby version to 2.6.5

* run `bundle`

* run `rails db:create db:schema:load db:seed`

* run `rm -rf config/credentials.yml.enc` if you run into any issues when attempting to set up

* run `EDITOR=vi rails credentials:edit` and edit your secrets if need be

* run `rails s`

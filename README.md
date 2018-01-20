<img src="https://scontent.cdninstagram.com/t51.2885-15/e35/11934886_1743596452540354_2127773869_n.jpg" width="400">

## About this Project

"Orchard" is a one-stop social networking platform for alumni counselors, staff, campers, and volunteers to engage with camp -- and each other!

## Setup

- Install Ruby 2.4.1 (chruby, rbenv, rvm, etc)
- `bin/setup` initially, then `bin/update` thereafter
- Additionally, for AWS and Paperclip to work locally, be sure to update your own `.env` file with relevant AWS credentials, per the `config/environments/development.rb`

## What This App Does

* Admins import user data for alumni staff, counselors, campers, & volunteers into the system
* Admins trigger an email for individuals to: verify their info and account settings, create a login, and adjust their privacy
  settings
* Users are taken to a hub that aggregates social media data and links to:
  * events calendar
  * donor system
  * volunteer system
  * photo sharing / tagging /commenting
  * chat
  * facebook feed
  * twitter feed
* Admin dashboard provides user data (number of invites sent,
  active users, etc)

## Architecture

The app is built using Rails 5 with Postgres and AWS S3 for storing data.

A visual representation of the database schema is shown below to give users and contributors a better sense of the overall application structure included within this project:

<img src="http://imgur.com/ZsWeAdU.png" width="600">

## Heroku

Paperclip requires an additional buildpack for imagemagick

```
heroku buildpacks:add --index 1 https://github.com/ello/heroku-buildpack-imagemagick -a doublehranch
```

## Adding users via rails console

```
$ rails console
r> u = User.new(last_name: "Last", first_name: "First", email: "email@example.com", salutation: "Mrs.", password: "asdflkjasd;flkjasf;", privacy_settings: "")
r> u.save
# Pretend to have received the confirmation email
r> u.confirm

```

If you need to do this on the production app

```
heroku run -a doublehranch -- rails console
# Follow instructions above
```

## Contributing
Our process is very similar to the [guide](https://guides.github.com/introduction/flow/) created by Gitub:
* Please [fork the app](https://help.github.com/articles/fork-a-repo/) and create a feature branch.
* Work on the issue.
* Please make sure tests continue to pass and if applicable that you also add tests to the feature you have implemented.
* Open a pull request (PR) for it when you feel it's ready to merge.
* At least one other person on the team needs to approve the  PR before merging. The purpose of this review requirement is to ensure shared knowledge of the app and its changes and to take advantage of the benefits of working together.

Please let us know if you have any question. Thanks again for your interest in contributing.

## About Double H Ranch

Double H Ranch is a nonprofit that provides specialized programs and year-round
support for children and their families dealing with life-threatening illnesses.
All programs are free of charge and capture the magic of the Adirondacks of
upstate New York, and is one of the most uplifting places you could every visit.

Double H has limited engagement with former volunteers, campers, and summer
staff, so would like to a system through which it can engage and build community
with people who are no longer at camp. We'll build a greenfield product for them
that will interface with a few of their existing systems (Facebook, Google
calendar, Raiser's Edge), link to others, and provide a centralized location
with some special features to allow everyone to interact.

Visit [the Double H Homepage](https://www.doublehranch.org/) for more information.

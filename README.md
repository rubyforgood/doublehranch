## About this Project

We are building a one-stop social networking platform for members and their
families.

## Setup
==
- Install Ruby 2.4.1 (chruby, rbenv, rvm, etc)
- `bundle install`

## What This App Does

* Admins import user data for alumni staff, counselors, campers, & volunteers into the system, which triggers an email for
  individuals to verify their account, create a login, and adjust their privacy
  settings
* Users are taken to a hub that aggregates social media data and links to:
  * events calendar
  * donor system
  * volunteer system
  * photo sharing / tagging /commenting
  * chat
  * newsletter sign-up
  * HH Website
* Admin dashboard is provided to provide user data (number of invites sent,
  active users, etc)

## Architecture

The app is built using Rails 5 with Postgres and AWS S3 for storing data.

## About Double H Ranch

The Double H Ranch provides specialized programs and year-round support for
children and their families dealing with life-threatening illnesses. All
programs are FREE of charge and capture the magic of the Adirondacks. Visit [the
homepage](https://www.doublehranch.org/) for more information.


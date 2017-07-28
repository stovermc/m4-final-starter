# URLockBox

This application allows a user to create an account and start tracking url's they wish to read. It tracks the read status of each link giving the user the option to check each link as read. A user is also able to search their links by title or URL

It was built using:
`Ruby 2.3.0`
`Rails 5.0.0.1`

Production site: https://stover-m4-final.herokuapp.com/

### Setup
1. clone this repo
2. bundle
3. From the command line run:
  * `rake db:setup`
  * `rspec`

### API
This application has one api endpoint:

PUT `/api/v1/links` this endpoint takes two parameters; a valid url including http/https, and a title for the new link.

### HOT Reads connection

This application works in tandem with the Hot Reads application. Hot Reads are identified but the links marded read by users of this application.

Hot Reads repo: https://github.com/stovermc/hot-reads
Hot Reads Production Site: https://stover-hotreads.herokuapp.com/


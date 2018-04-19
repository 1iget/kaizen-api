![F7 Logo](http://frinkiac-7.net/images/f7-pos.png "F7 logo")

# KaizenApi - A back-end API for the Kaizen restaurant menu and ordering app

Kaizen is designed to help small restaurants with limited budgets add online ordering services to their customers.  This repo contains the back-end API code used by the Kaizen client front-end app.
This repo contains the back-end API that will be used by the Kaizen front-end application.

## Deployment/repository links and installation instructions
`Client`
- Deployed link:  https://frinkiac-7.github.io/kaizen/
- Repository link:https://github.com/Frinkiac-7/kaizen/

`API`
- Deployed link:  https://kaizenapi.herokuapp.com/
- Repository link: https://frinkiac-7.github.io/kaizen-api/

`Note`
- Please visit https://github.com/Frinkiac-7/kaizen-client/ for details on the Ember version of the front-end client currently still in development

`Installation `
- Fork and clone this repository
- Check directory to the project directory
- run `bundle install`

# Kaizen API Overview

## Current capabilities
Kaizen API currently allows the following actions via the front-end application:
- Create and manage a restaurant menu which can be viewed by registered users of the application
- Have two classes of users: admin and non-admin users
  - Admin users can:
    - Create menu items visible by all admins and users
    - Update and delete menu items they've created but not those created by other admins
    - Change a user's email address and admin status
  - Users can:
    - View menu items created by admins

## App components

- API built using Ruby on Rails
- PostgreSQL database for data storage
- Platform hosting via Heroku

## API Routes and Info
```
Prefix Verb   URI Pattern                        Controller#Action
 users GET    /users(.:format)                   users#index
  user GET    /users/:id(.:format)               users#show
       PATCH  /users/:id(.:format)               users#update
       PUT    /users/:id(.:format)               users#update
 items GET    /items(.:format)                   items#index
       POST   /items(.:format)                   items#create
  item GET    /items/:id(.:format)               items#show
       PATCH  /items/:id(.:format)               items#update
       PUT    /items/:id(.:format)               items#update
       DELETE /items/:id(.:format)               items#destroy
sign_up POST   /sign-up(.:format)                 users#signup
sign_in POST   /sign-in(.:format)                 users#signin
sign_out DELETE /sign-out(.:format)                users#signout
change_password PATCH  /change-password(.:format)         users#changepw
clients_sign_up POST   /clients/sign-up(.:format)         clients#signup
clients_sign_in POST   /clients/sign-in(.:format)         clients#signin
clients_sign_out DELETE /clients/sign-out(.:format)        clients#signout
clients_change_password PATCH  /clients/change-password(.:format) clients#changepw
```
### Issues and Planned Features

- `Issue - Obsolete item cleanup`: Some resources and routes were created early on in the project as part of an approach that was later revised.  These items should be reviewed and addressed accordingly.
- `Feature- `

## API components

- Ruby on Rails

## Project Documentation & Development Process

The development process to date is detailed below

1) `Planning`
  - Baseline project wireframes, ERDs, and timeline were created.
    - `ERD`: https://i.imgur.com/e1cOxvx.png

2) `Problem solving strategy`
  - During the project I would use the following approach to diagnosing/resolving issues:
    - Copy/paste the code in question to a plain text editor.  This helped me catch simple typos without the linter formatting
    - Review similar working code from other projects for potential issues like `GET` instead of `POST` or code statements added out of sequence
    - Confer with classmates for guidance or fresh look at the code
    - Check online resources for suggestions or how-to information
    - Open an issue on the project issues queue for assistance from the instructors
3) `Development process`
  - Initial back-end API was completed on time per the schedule though subsequent modifications were necessary as the admin vs. user functionality was adjusted to meet capstone project requirements.
  - As indicated above, the client was originally going to be based on the Ember.js front-end framework.  However, the learning curve proved challenging given the project timelines.  As a result, development efforts on that version were temporarily shelved and this version was initiated.  Future versions of the client will use a front-end framework.  Currently, this is intended to be Ember.js but other frameworks will be explored as determined by future revision requirements.
  - Minimum viable product was met slightly behind schedule due to the shift from Ember.  However, development of this version was completed one day ahead of revised schedule.
4) `Project lessons learned`
  - The main lesson from this project was the importance of defining stringent MVPs.  My previous MVPs had been based solely on meeting project technical requirements.  This worked though projects were very limited in functionality.  For this project, however, I expanded the initial MVP definition slightly to include things such as different user classes, etc.  This wasn't a problem per se but it did create additional decision forks when trying to decide on next steps during development.  However, as my projects get more complex this could become more of an issue.

## [License](LICENSE)

1.  All content is licensed under a CC­BY­NC­SA 4.0 license.
1.  All software code is licensed under GNU GPLv3. For commercial use or
    alternative licensing, please contact legal@ga.co.

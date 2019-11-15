# Unicorn Tracker - API
This is the backend for the [Unicorn Tracker frontend](https://github.com/emilyaviva/unicorn-tracker-frontend).

## Initial setup
You'll need to add some unicorns to start with. Run `rails db:seed` to seed a few into your database.

## Instructions
Run with `rails server --port=3001` (the frontend is hard-coded to expect that port). Then start the frontend and go to [http://localhost:3000](http://localhost:3000) in your browser.

### Not seeing any unicorns?
- Did you add unicorns by seeding the data or adding them from the console?
- Are your servers started on the correct ports?

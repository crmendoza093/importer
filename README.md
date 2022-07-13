# README

This service is responsible for import the mexican postal codes.
## Main branch

```bash
  git checkout master
```

## Setup

To configure the connection with the database you must modify the environment variables in the file `.env`

```bash
  bin/setup
```

Run the the app:

```bash
  bin/rails server
```

## How it works

1. Remind put the excel file in `lib/task/data`

2. Run `rails db:seed`

3. Exist two endpoints:

    3.1. GET for import data `localhost:3000/v1/importer`

    3.2. GET for list address from postal code `localhost:3000/v1/list/:postal_code`

## Feedback

I had problems with district entity, I dont understand the reason of table. I saw some repeated columns.
I think that excel file can confused a candidate and lost focus the challenge, I understand that you are looking for analysis skills but could be focus in how handle data for ex.

So, from view point me, I guess that if challengue seek watch how a candidate solve the import data could improve the readme focus.

For example, Give the main entities and that porpuse create a API for load data and make another operations or handle the info.

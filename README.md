# brainstorm-api

This is a small project for looking for the possibility to save artist time or increasing conversion rate, in different way.

Current scenario is the tool will help artist to generate a better product intro.

### Technical feature

- Using `jwt` to do authorization
- Using `chatgpt-ruby` to generate product intro
- Using `rack-cors` to allow cross origin access

### Dev Environment Setup

#### Prerequisite

- ruby
- rails
- postgresql
- docker

#### Steps

- Clone back this repository
  - `git clone https://github.com/dychendavid/brainstorm-api`
- Go to the directory
  - `cd brainstorm-api`
- Optional, using docker to setup Postgresql or you can setup it locally
  - `docker-compose up -d`
- Install Gems
  - `bundle install`
- DB initialize
  - `rails db:create`
  - `rails db:migrate`
- DB seeding
  - `rails db:seed`
- Create .env and setup OPENAI_KEY, replace XXX to your open ai key
  - `echo "OPENAI_KEY=xxx" >> .env`
- Launch web server, in case you'll use port 3000 for frontend part
  - `rails s-p 3001`

# API Document

### Authorization API

#### **POST** `#{domain}/api/v1/authorize`

- For get `Bearer Token`, it's valid for 24H

---

### Product APIs

#### **GET** `#{domain}/api/v1/products/available`

- Get available product to edit, in current scenario, it just the last created

#### **GET** `#{domain}/api/v1/products/:id`

- Get specific product info

#### **POST** `#{domain}/api/v1/products/intro_gpt/:id`

- For asking OpenAI to generate intro with prepared info, need to pass `Bearer Token`
- Params:
  | Name | Explain | Type |
  | ------ | ------- | ------|
  | name | What is the name of your product| string |
  | usage | What is this product used for| string |
  | target_audience | Who is your target audience| string |
  | difference | What unique features or advantages does this product have | string |
  | highlight | What key points do you want to emphasize in the copy| string |
  | style | Do you have any specific tone or style requirements| string |
  | guidance | Are there any special usage instructions or guidance for this product| string |
  | competitor | Ｗ hat are the strength and weakness of your competitors product| string |
  | length | What is the desired length of the copy| string |
  | extra | Are there any other details or messages you want to include| string |

#### **PUT** `#{domain}/api/v1/products/:id`

- For saving the result of product name and intro, need to pass `Bearer Token`
- Params:
  | Param | Explain | Type |
  | ------ | ------- | ------|
  | name | Product name| string |
  | intro | Product intro| string |

[![Build Status](https://travis-ci.org/sandrineay/battle_game.svg?branch=master)](https://travis-ci.org/sandrineay/battle_game)

- Rails app generated with [lewagon/rails-templates](https://github.com/lewagon/rails-templates).

- Tests are run with [Minitest](https://github.com/blowmage/minitest-rails).

- Use of overcommit and Rubocop: `$ overcommit --install` and `overcommit --sign`

- Continuous integration with [Travis CI](https://travis-ci.org).

- To launch app locally:
1. Create .env file at the root of the project
2. Run `echo '.env*' >> .gitignore` so the file is not pushed to Github
3. Add your Cloudinary API Key, which will look like: `CLOUDINARY_URL=cloudinary://298522699261255:Qa1ZfO4syfbOC-***********************8`
4. Run `rails db:migrate db:seed`
5. Run `rails s`



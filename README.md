# pressy

<p align="center">
    <a href="https://www.ruby-lang.org/en/">
    <img src="https://img.shields.io/badge/Ruby-v2.6.3-green.svg" alt="ruby version">
  </a>
  <a href="http://rubyonrails.org/">
    <img src="https://img.shields.io/badge/Rails-v6.0.1-brightgreen.svg" alt="rails version">
  </a>
  <a href="">
    <img src="https://app.codeship.com/projects/a34eb3f0-eac2-0137-833d-22ee8611456c/status?branch=master" alt="Codeship Status">
  </a>
</p>

*pressy* is a web based app for creating interactive presentations from *boring* PDF files.

## Features

*pressy* main features are:

- [x] Simpe user sign up with email
- [x] Support for creating presentations from PDF files
- [x] Presentations management (create, update, delete)
- [x] Preview presentations
- [ ] Support for adding audio to slides with drag & drop
- [ ] Slides sorting
- [ ] Interactive elements (polls, free text question, embed YouTube videos)
- [ ] Presentation statistics (answers, views, etc)
- [ ] Answers report dashboard
- [ ] Presentation exporter (zip)

## Codebase

### The Stack

We run on a Ruby on Rails 6 backend with sprinkles of Vue.js and vanilla JavaScript on the frontend.

## Getting Started

This section provides a high-level requirement & quick start guide.

### Prerequisites

- [Ruby](https://www.ruby-lang.org/en/): we recommend using [rbenv](https://github.com/rbenv/rbenv) to install the Ruby version listed on the badge.
- [Yarn](https://yarnpkg.com/): please refer to their [installation guide](https://yarnpkg.com/en/docs/install).
- [PostgreSQL](https://www.postgresql.org/) 9.4 or higher.
- [ImageMagick](https://imagemagick.org/): please refer to ImageMagick's [installation instructions](https://imagemagick.org/script/download.php). Alternatively, macOS users can install ImageMagick with `brew install imagemagick`
- A process manager: we recommend using [hivemind](https://github.com/DarthSim/hivemind)
- [Docksplit](http://documentcloud.github.io/docsplit/): please refer to their [Installation & Dependencies](http://documentcloud.github.io/docsplit#installation)

### Standard Installation

1. Make sure all the prerequisites are installed.
1. Fork or clone *pressy* repository.
1. Clone the repository, ie. `git clone git@github.com:<your-username>/pressy.git`
1. Run `bin/setup`
1. Set up your environment variables/secrets

    - Take a look at `.env`. This file lists all the `ENV` variables we use and provides fake default for any missing keys.
    - Change values at `.env` to meet your local setup

1. That's it! Use `foreman` or `hivemind` to start the server
```
$ hivemind Procfile.dev
```

### Docker Installation

[TODO]

### Workflow

We use [Spring](https://github.com/rails/spring), and it is already included in the project.

1. Use the provided bin stubs to start Spring automatically, i.e. `bin/rails server`, `bin/rspec spec/models/`, `bin/rails db:migrate`.
1. If Spring isn't picking up on new changes, use `spring stop`.

## Deployment

[coming soon!]

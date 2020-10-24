# TBagcem

[TBagcem](http://www.tbagcem.com) is a commercial website for customers who can buy favorite bag on it. The website is used responsive web design, so it's easily to operate from mobile device, tablet and computer. And we use the third party of [line pay API v2](https://pay.line.me/tw/developers/main/main?locale=en_US) to deal with the payment(We only use sandbox in this website, so you can test it at ease). The customer can use their google account to log in our website, but it needs confirmation by email, if you don't want to register, you can use our test account:

website: [TBagcem](http://www.tbagcem.com)  

account: tbagtest@hot.tw  

password: 123456  


## User Stories

See [user_stories.md](/user_stories.md)

## Model

![image](https://github.com/kaycheng/tbag/blob/main/RWD.png)

## Tech/framework used

**Built with**

* [Ruby 2.6.5](https://www.ruby-lang.org/en/) - The back-end framework used
* [Ruby on Rails 6.0.3](http://rubyonrails.org/) - The back-end framework used
* [RSpec](https://rspec.info) - The cart and cart_item used
* [Bootstrap 4.5](https://getbootstrap.com/) - The front-end framework used
* [StimulusJS](https://stimulusjs.org) - The front-end framework used

## Features

Line Pay API  
Google login
Mailgun
GoDaddy
Heroku
CloudFlare


### Clone this repository
```
$ git clone https://github.com/kaycheng/tbag.git
```
### Go into the repository
```
$ cd tbag
```
### Install dependencies
```
$ bundle install
```
### Generate model
```
$ rails db:migrate
```
### Add foreman gem
```
$ gem install foreman
```
### Run the app
```
$ foreman start -f Procfile.dev
```
 

## License

MIT License. Copyright © 2020 Tbagcem

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

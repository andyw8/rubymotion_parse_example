# RubyMotion Parse Example

I've created this project to refamiliarise myself with iOS, to learn RubyMotion and to understand Parse.

## Setup

* [Download the Parse SDK](https://parse.com/downloads/ios/parse-library/latest) and extract `Parse.framework` to `vendor`
* Copy `app/config.rb.example` to `app/config.rb` and fill in your Parse credentials

## Design

* I'm using the MVCS pattern described in the [iOS Programming: The Big Nerd Ranch Guide]
* I'm aiming for a good balance of Ruby/Cocoa idioms (no metaprogramming or DSLs yet)

## TODO

* Handle network errors
* Using asynchronus calls
* Implement updating and deleting items

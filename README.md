# Tembeza

Is a application for parser for HTML sites that returns links and images from the site.

## Installation

First get all the dependenices needed for running application: `mix deps.get`. To make a release use `mix release`.

## Usage

Start the console for development use: `iex -S mix`.

Then use example below:

```
iex> Tembeza.fetch("https://www.tembeza.com")
```

# churn vs complexity

Generate [churn](https://github.com/danmayer/churn) vs. [complexity](https://github.com/seattlerb/flog). 
Data presented using [plotly](https://github.com/plotly/plotly.js).

It won't work on Windows and possibly other platforms, sorry.  It was interesting to try.

```
gem install bundler
bundle
```

Skip the next step if you want to use the CSVs already in this repo.

To regenerate the CSVs with newer code or a different git repo, run the bin with ruby:

```
# Takes about 1-2 minutes against a very large Rails app
bin/churn_vs_complexity ~/path/to/my/git/repo
```

To see the charts, run:

```
bundle exec rackup

# Then open a browser:
http://localhost:9292/
```

Here's a [quick video](https://youtu.be/d5V3_HLXCW4) of how it looks.

Caveats:

* Currently, the test rails app I'm using is the [ManageIQ](https://github.com/ManageIQ/manageiq) 
repo (which is enormous), so the code splits the front-end (presenters/controllers/helpers) files from the
backend to avoid having charts that are difficult to read.

* Churn is measured for about one year so any files that haven't been changed in the 
past year won't be included in the chart.

* Complexity is measured using flog for files as they exist **currently** on your git
repo.  Old renamed or deleted files will not show up at all.  We don't track
renames so renamed files have their churn reset.

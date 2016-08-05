# churn vs complexity

Generate [churn](https://github.com/danmayer/churn) vs. [complexity](https://github.com/seattlerb/flog) data and present them using [plotly](https://github.com/plotly/plotly.js).

This will certainly not work as you want.  It won't work on Windows and possibly other
platforms, sorry.  It was interesting to try.

YOLO.

```
gem install bundler
bundle
```

Skip the next step if you want to use the CSVs already in this repo.

To regenerate the CSVs with newer code or a different git repo, run the bin with ruby:

```
bundle exec ruby bin/churn_vs_complexity.rb ~/path/to/my/git/repo
```

To see the charts, run:

```
bundle exec rackup

# Then open a browser:
open http://localhost:9292/
```

Here's a [quick video](https://youtu.be/d5V3_HLXCW4) of how it looks.

Caveats:

* Currently, the test rails app I'm using is the [ManageIQ](https://github.com/ManageIQ/manageiq) repo which is enormous,
so the code splits the front-end (presenters/controllers/helpers) files from the
backend to avoid having charts you can't easily read.

* We look for churn for about 1 year so any files that haven't been changed in the
past year won't be in the chart.

* We measure complexity using flog for files as they exist **currently** on your git
repo.  Old renamed or deleted files will not show up at all.  We don't track
renames so renamed files have their churn reset.

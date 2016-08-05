# churn_vs_complexity
Generate churn vs. complexity data and present them using plotly

This will certainly not work as you want.  It's disgusting and I might throw it
away but it was interesting to try.

YOLO.

```
gem install bundler
bundle
```

To generate the csvs, run the bin with ruby:

```
bundle exec ruby bin/churn_vs_complexity.rb ~/path/to/my/git/repo
```

To see the charts, run:

```
bundle exec rackup

# Then open a browser:
open http://localhost:9292/
```

Currently, the test rails app I'm using is the ManageIQ repo which is enormous,
so it splits the front-end (presenters/controllers/helpers) files from the
backend to avoid having enormous charts you can't easily read.

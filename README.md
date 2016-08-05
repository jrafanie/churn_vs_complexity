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

Here's a [quick video](https://youtu.be/d5V3_HLXCW4) of how it looks.

Caveats:

* Currently, the test rails app I'm using is the ManageIQ repo which is enormous,
so the code splits the front-end (presenters/controllers/helpers) files from the
backend to avoid having charts you can't easily read.

* We look for churn for about 1 year so any files that haven't been changed in the
past year won't be in the chart.  This is because we want to refactor code we're
actually changing.  Complicate code that changes is more important to find. This
1 year period is random, varying this value might be helpful for a different repo.

* We measure complexity using flog for files as they exist **currently** on your git
repo.  Old renamed or deleted files will not show up at all.  We don't track
renames so if you have 10 churn on file "a.rb" and rename it to "b.rb", "a.rb"
won't show up in the charts and "b.rb" will have a reset churn value less than 10.

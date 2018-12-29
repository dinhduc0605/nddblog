#!/bin/bash
if [ "${CIRCLE_BRANCH}" != "master" ]; then
    git diff -z --name-only origin/master \
     | xargs -0 bundle exec rubocop-select \
     | xargs bundle exec rubocop \
         --require rubocop/formatter/checkstyle_formatter \
         --format RuboCop::Formatter::CheckstyleFormatter \
     | bundle exec checkstyle_filter-git diff origin/master \
     | bundle exec saddler report \
        --require saddler/reporter/github \
        --reporter Saddler::Reporter::Github::PullRequestReviewComment
fi

exit 0
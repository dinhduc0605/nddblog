#!/bin/bash
if [ "${CIRCLE_BRANCH}" != "develop" ] && [ "${CIRCLE_BRANCH}" != "master" ]; then
    warn=$(git diff -z --name-only origin/master \
           | xargs -0 bundle exec rubocop-select \
           | xargs bundle exec rubocop \
              --require rubocop/formatter/checkstyle_formatter \
              --format RuboCop::Formatter::CheckstyleFormatter \
           | bundle exec checkstyle_filter-git diff origin/master)
    detected=$(echo "$warn" | grep "<error")
    if [ -n "$detected" ]; then
        echo "$warn" \
        | bundle exec saddler report \
            --reporter Saddler::Reporter::Text
        exit 1
    fi
fi
exit 0

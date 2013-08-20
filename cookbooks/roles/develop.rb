name 'develop'
description 'Rails 4 app development box'

override_attributes(
  # empty
)

run_list(
  'role[utils]',
  'role[app-deploy]'
)

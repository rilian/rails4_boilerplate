name 'utils'
description 'Helper recipes'

override_attributes(
  # empty
)

run_list(
  'role[general-backend]',
  'role[general-frontend]'
)

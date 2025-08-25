$10 ~ ENVIRONMENT {
  count[$10" "$13" "$5]++
}
END {
  for (key in count) {
      stack_type = $4
      gsub(/"/, "", stack_type)
      (stack_type == "tibcobwAdministrator" || stack_type == "tibcobwRuntime") ? stack_type = "5_14" : stack_type = "5_15"

      key_formatted = key
      gsub(/"/, "", key_formatted)

      match(key_formatted, /[Dd]evelopment|[Tt]est|[Aa]cceptance|[Pp]roduction/)
      stage = substr(key_formatted, RSTART, RLENGTH)

      match(key_formatted, /T[0-9]{5}.*srv/)
      purpose_code = substr(key_formatted, RSTART, RLENGTH)
      gsub(/ srv/, "", purpose_code)

      match(key_formatted, /srv.*/)
      srv_number = substr(key_formatted, RSTART, RLENGTH)

      size = count[key]

      runtime_pairs = (size - 1) / 2

      printf "%s,%s,%s,%s,%s,%s\n", stack_type, stage, purpose_code, srv_number, runtime_pairs, size, " "

  }
}
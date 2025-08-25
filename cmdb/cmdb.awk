$10 ~ ENVIRONMENT {
  count[$13" "$5]++
}
END {
  for (key in count) {
      key_formatted = key
      gsub(/"/, "", key_formatted)

      match(key_formatted, /T[0-9]{5}.*srv/)
      purpose_code = substr(key_formatted, RSTART, RLENGTH)
      gsub(/ srv/, "", purpose_code)

      match(key_formatted, /srv.*/)
      srv_number = substr(key_formatted, RSTART, RLENGTH)

      size = count[key]

      runtime_pairs = (size - 1) / 2

      printf "%-40s%-20s%-16s%-8s%-10s\n", purpose_code, srv_number, runtime_pairs, size, " "

  }
}
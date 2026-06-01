metadata-timestamp() {
  zmodload zsh/datetime

  local now sec frac us formatted

  now=$EPOCHREALTIME
  sec=${now%.*}
  frac=${now#*.}

  # Ensure exactly 6 fractional digits
  us=${frac[1,6]}
  us=${(r:6::0:)us}

  strftime -s formatted '%Y-%m-%dT%H:%M:%S' "$sec"

  print -r -- "${formatted}.${us}"
}

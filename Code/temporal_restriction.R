temporal <- masterDF |>
  mutate(date=as.Date(date)) |>
  filter(between(doy, 152, 258))

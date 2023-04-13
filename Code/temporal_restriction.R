temporal <- masterDF |>
  mutate(date=as.Date(date)) |>
  filter(between(doy, 152, 258)) |>
  group_by(lagoslakeid, year) |>
  add_count() |>
  filter(n >= 3) |>
  ungroup()


temporal_med <- temporal |>
  group_by(lagoslakeid, year) |>
  summarise(ann_dWL = median(dWL)) |>
  ungroup()

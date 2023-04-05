tt <- tt_load(2023, 14)

soccer <- tt$`soccer21-22`

soccer <- soccer |>
	janitor::clean_names() |>
	mutate(
		across(where(is.numeric), as.integer),
		date = dmy(date),
		year = year(date),
		month = month(date),
		day = day(date),
		.before = 1
	)

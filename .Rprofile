suppressWarnings({
	library(tidytuesdayR)
	library(tidyverse)
	library(tidymodels)
	library(DataExplorer)
	tidymodels_prefer()
	conflicted::conflicts_prefer(dplyr::filter)
	theme_set(theme_bw())
}) |> suppressMessages() |> suppressPackageStartupMessages()

box::use(glue[glue])
# start up utilities
(function() {
	last_tt_week <- last_tuesday() |> week()
	list(
		tt = function(week = last_tt_week) {
			year <- year(today())
				dir <- glue("{week}-{year}")
				if (!dir.exists(dir)) {
					dir.create(dir)
					path <- glue("{dir}/main.R")
					file.create(path)
					writeLines(
# keep formatting for proper insertion into file
"tt <- tt_load({year}, {week})
" |> glue(), 
						path
					)
					file.edit(path)
					setwd(dir)
				}
		},
		week = last_tt_week,
		eda = function(data, ...) {
			config <- configure_report(
				global_ggtheme = quote(theme_bw()),
				add_plot_prcomp = FALSE,
				...
			)
			create_report(
				data, 
				output_file = "eda.html", 
				report_title = "Exploratory Analysis", 
				config = config
			)
		}
	) |>
		list2env() |>
		attach(name = "tt")
	invisible()
})()

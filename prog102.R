library(marinecs100b)

# Writing a utility function ----------------------------------------------

# P1: How did you extract the temperature and exposure from the hottest day?
# Copy-paste the code here.
hottest_idx <- which.max(kefj_temperature)
# finding max temp
hottest_time <- kefj_datetime[hottest_idx]
# finding date/time of the hottest temp
hottest_site <- kefj_site[hottest_idx]
# site where hottest temp was measured
hotday_start <- as.POSIXct("2018-07-03 00:00:00", tz = "Etc/GMT+8")
hotday_end <- as.POSIXct("2018-07-03 23:59:59", tz = "Etc/GMT+8")
# defining the boundaries of the day
hotday_idx <- kefj_site == hottest_site &
  kefj_datetime >= hotday_start &
  kefj_datetime <= hotday_end
hotday_datetime <- kefj_datetime[hotday_idx]
hotday_temperature <- kefj_temperature[hotday_idx]
hotday_exposure <- kefj_exposure[hotday_idx]
plot_kefj(hotday_datetime, hotday_temperature, hotday_exposure)

# P2: Fill in the blanks below to write the Alaskan datetime utility function.
Alaskan_datetime <- function(date_string) {
  time_output_value <- as.POSIXct(date_string, tz = "Etc/GMT+8")
    return(time_output_value)
}

Alaskan_datetime("2018-07-01 23:59")

# Alaskan_datetime = convert_to_alaska (which is how it is defined in the key)

# Extracting data ---------------------------------------------------------

# P3: Make a copy of your code from P1 and edit it to plot the temperature and
# exposure for "Aialik" on 2012-06-01
site <- "Aialik"
Aialik_day_start <- as.POSIXct("2012-06-01 00:00:00", tz = "Etc/GMT+8")
Aialik_day_end <- as.POSIXct("2012-06-01 23:59:59", tz = "Etc/GMT+8")
Aialik_day_idx <- kefj_site == "Aialik" &
  kefj_datetime >= Aialik_day_start &
  kefj_datetime <= Aialik_day_end
Aialik_day_datetime <- kefj_datetime[Aialik_day_idx]
Aialik_day_temperature <- kefj_temperature[Aialik_day_idx]
Aialik_day_exposure <- kefj_exposure[Aialik_day_idx]
plot_kefj(Aialik_day_datetime, Aialik_day_temperature, Aialik_day_exposure)

# P4: Make a copy of your code from P3 and edit it to plot the temperature and
# exposure for "Harris" on 2016-04-05.
site <- "Harris"
Harris_day_start <- as.POSIXct("2012-06-01 00:00:00", tz = "Etc/GMT+8")
Harris_day_end <- as.POSIXct("2012-06-01 23:59:59", tz = "Etc/GMT+8")
Harris_day_idx <- kefj_site == "Harris" &
  kefj_datetime >= Harris_day_start &
  kefj_datetime <= Harris_day_end
Harris_day_datetime <- kefj_datetime[Harris_day_idx]
Harris_day_temperature <- kefj_temperature[Harris_day_idx]
Harris_day_exposure <- kefj_exposure[Harris_day_idx]
plot_kefj(Harris_day_datetime, Harris_day_temperature, Harris_day_exposure)

# P5: Compare your solutions for P3 and P4 - what variables changed?
# site, day_start, day_end

# P6: What you would pick for the temperature extraction function and
# parameters' names?

#extract_temperature, site, start, end

# Writing extraction functions --------------------------------------------

# P7: Fill in the blanks in the code below to write your temperature extraction
# function.

extract_temperature <- function(site, start, end) {
  day_start <- Alaskan_datetime(start)
  day_end <- Alaskan_datetime(end)
  extract_idx <- kefj_site == site &
    kefj_datetime >= day_start &
    kefj_datetime <= day_end
  result <- kefj_temperature[extract_idx]
    return(result)
}

# P8: Make a copy of your solution to P7, and edit it to create exposure and
# datetime extraction functions.
extract_exposure <- function(site, start, end) {
  day_start <- Alaskan_datetime(start)
  day_end <- Alaskan_datetime(end)
  extract_idx <- kefj_site == site &
    kefj_datetime >= day_start &
    kefj_datetime <= day_end
  result <- kefj_exposure[extract_idx]
  return(result)
}

extract_datetime <- function(site, start, end) {
  day_start <- Alaskan_datetime(start)
  day_end <- Alaskan_datetime(end)
  extract_idx <- kefj_site == site &
    kefj_datetime >= day_start &
    kefj_datetime <= day_end
  result <- kefj_datetime[extract_idx]
  return(result)
}

extract_datetime("Harris", "2020-05-01 00:00", "2020-05-01 23:59")

# P9: Export your annotated screenshot as a JPEG called "annotated_function.jpg"
# and add it to your copy of the module repository. (It should be in the same
# folder as this file.)

# added to prog102 repository in github :)

# P10: Visualize Nuka Pass on July 1, 2018.
plot_kefj(extract_datetime("Nuka_Pass", "2018-07-01 00:00", "2018-07-01 23:59"),
          extract_temperature("Nuka_Pass", "2018-07-01 00:00", "2018-07-01 23:59"),
          extract_exposure("Nuka_Pass", "2018-07-01 00:00", "2018-07-01 23:59"))

# P11: Save a copy of the Nuka Pass plot as "nuka_pass_2018-07-01.png" in this
# repo

# it is done :)

# P12: Compare the code you wrote to create the plot in this module to the code
# you wrote in PROG101. Qualitatively, how do they compare? Which one is easier
# to read and why?
# This is so much better, I much prefer using functions to the
# copy-paste method. Qualitatively, prog102 is much easier to read because the
# functions are helpfully named and labeled so you can follow the information
# flow a lot better.

dt = DateAdd("d", -1, Date)
yesterday = Right("0" & Month(dt),2) & Right("0" & Day(dt), 2) & Right(Year(dt),4)
wscript.echo yesterday
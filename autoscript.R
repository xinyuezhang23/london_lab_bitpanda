require("cronR")
cron_ls
path = "/Users/hanyuwang/Desktop/london_lab_bitpanda/bp.R"
cmd = cron_rscript(path)
cron_add(command= cmd, frequency = 'daily', at="00:05", days_of_week = c(1:7),
         id = 'bp', description = 'bp')

cron_rm(id = 'bp')

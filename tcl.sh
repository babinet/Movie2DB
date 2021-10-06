# Quick hack to stretch the .srt subtitles to match the one of your video.
# Check the time of the first and last sentence in your video file, then
# use this tool to convert the .srt file into one matching your video with:
#
# tclsh srt.tcl file.srt <your start time> <your end time> > output.srt
#tclsh tcl.sh Burn_1969_VO1.srt 00:03:14,000 02:08:49,000 > Burn_1969_VO.srt
# Example:
#tclsh tcl.sh 'Q_&_A_1990_VO1.srt' 0:01:10,000 2:09:50,000 > 'Q_&_A_1990_VO.srt'
# tclsh tcl.sh Wonderwall_1968_VO1.srt 0:03:13,000 01:30:14,000 > Wonderwall_1968_VO.srt
# tclsh tcl.sh The_Scalphunters_1968_VO1.srt 0:03:12,000 01:41:26,000 > The_Scalphunters_1968_VO.srt
# tclsh tcl.sh In_Old_Chicago_1938_VO1.srt 0:01:10,000 1:49:55,000 > In_Old_Chicago_1938_VO.srt
# tclsh tcl.sh Mimic_Sentinel_2003_VO1.srt 0:01:10,000 1:49:55,000 > Mimic_Sentinel_2003_VO.srt
# tclsh tcl.sh tt0508232_Source.srt 0:00:24,000 0:25:21,000 > tt0508232.srt


# tclsh tcl.sh Death_Laid_an_Egg_1968_VO00.srt 0:02:37,000 01:27:53,000 > Death_Laid_an_Egg_1968_VO.srt

# Warning: the code is not clean at all, the goal was getting it working ASAP.
#
# Note: this program does not just change the sync of the .srt file, but
# also will stretch the time as needed to perfectly fit the one of your video
# so it is not equivalent to pressing h or l key on VLC.
#tclsh tcl.sh Wonderwall_1968_VO1.srt 0:03:13,000 01:30:14,000 > Wonderwall_1968_VO.srt
# Strip "0" chars at the left of string, otherwise expr handles it as octal.
proc deoctalize var {
upvar $var num
regsub -all {^0+} $num {} num
if {$num eq {}} {set num 0}
}

# From 00:00:00,000 form into milliseconds
proc srt2milliseconds t {
if {![regexp {([0-9]+):([0-9]+):([0-9]+),([0-9]+)} $t - hours minutes seconds ms]} {
return {}
}
while {[string length $ms] < 3} {
append ms 0
}
deoctalize ms
deoctalize hours
deoctalize minutes
deoctalize seconds
expr {$ms+($hours*60*60*1000)+($minutes*60*1000)+($seconds*1000)}
}

# From milliseconds into 00:00:00,000 form
proc milliseconds2srt t {
set ms [expr {$t%1000}]
set t [expr {$t/1000}]
set seconds [expr {$t%60}]
set t [expr {$t/60}]
set minutes [expr {$t%60}]
set t [expr {$t/60}]
set hours $t
while {[string length $ms] < 3} {
set ms "0${ms}"
}
format "%02d:%02d:%02d,%s" $hours $minutes $seconds $ms
}

# Given an .srt line returns start / end timestamp if matches.
proc get-start-end {line startvar endvar} {
upvar $startvar start
upvar $endvar end
regexp {(.*) --> (.*)} $line - start end
}

# Convert the old timestamp into a new one, as we calculate the ratio
# between the old and new duration we need to pass the base times to this
# funciton. So the new time is:
#
# newtime = ((oldtime-old_basetime)*ratio)+new_basetime
proc convert-time {oldbase newbase t ratio} {
set ms [srt2milliseconds $t]
set ms [expr {$ms-$oldbase}]
set ms [expr {int($ms*$ratio)}]
set ms [expr {$ms+$newbase}]
milliseconds2srt $ms
}

# Convert the srt file into a good one.
proc convert {file ex_first ex_last} {
# Step 1: search the first and last subtitle, in order to
# calculate the time delta in the original file.
set fd [open $file r]
set first {}
set last {}
while {[gets $fd line] != -1} {
if {[get-start-end $line start end]} {
if {$first eq {}} {
set first $start
}
set last $start
}
}
puts "First in file  : $first"
puts "Last in file   : $last"
set firstms [srt2milliseconds $first]
set lastms  [srt2milliseconds $last]
set filediff [expr {$lastms-$firstms}]
puts "Total time diff: [milliseconds2srt $filediff]"
puts "Expected first : $ex_first"
puts "Expected last  : $ex_last"
set ex_firstms [srt2milliseconds $ex_first]
set ex_lastms [srt2milliseconds $ex_last]
set ex_diff [expr {$ex_lastms-$ex_firstms}]
puts "Expected diff  : [milliseconds2srt $ex_diff]"
set ratio [expr {double($ex_diff)/$filediff}]
puts "Stretching ratio is $ratio"

# Step 2: convert all the file using an adjusting ratio.
seek $fd 0
set oldbase $firstms
set newbase $ex_firstms
while {[gets $fd line] != -1} {
if {[get-start-end $line start end]} {
puts "[convert-time $oldbase $newbase $start $ratio] --> [convert-time $oldbase $newbase $end $ratio]"
} else {
puts $line
}
}
}

convert [lindex $argv 0] [lindex $argv 1] [lindex $argv 2]

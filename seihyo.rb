a = "/tmp_motion/lastsnap.jpg"
b = "/tmp_motion/01-20160529154640-snapshot.jpg"
c = "."
d = ".."

master = Regexp.new("/tmp_motion/+[0-9]")

p master =~ a
p master =~ b
p master =~ c
p master =~ d


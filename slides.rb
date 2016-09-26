require 'io/console'

def show_slide(slides, index)
  y, x = $stdout.winsize
  first, *rest = slides[index].lines.map(&:chomp)
  first = "  \e[92m#{first.capitalize}\e[0m"
  rest.each do |line|
    line.gsub! /^/, "    \e[33m"
    line << "\e[0m"
  end
  slide      = [first, *rest].join("\r\n")
  clear      = "\e[H\e[2J"
  bottom_row = "\e[#{y};1H"
  progress   = "#{index+1}/#{slides.length}"
  "#{clear}\r\n#{slide}#{bottom_row}#{progress}"
end

print "\e[?25l"
at_exit { print "\e[?25h" }

slides = DATA.read.split "\n---\n"

$stdin.raw do
  i = ARGV[0].to_i
  loop do
    print show_slide(slides, i)
    case $stdin.getc
    when 'h'               then i -= 1
    when 'l'               then i += 1
    when 'q', 3.chr, 4.chr then break
    end
    i = 0 if i < 0
    break if i >= slides.length
  end
end

__END__
friends > networking
---
Imposter syndrome < "fuck it"
---
No one is rational, attend to aesthetics
---
Fuck your pride

(put everything on git)
---
Get over your pride, you're right for th job.

(If you were going to be qualfied,
you wouldn't be programming.)
---
half > half assed
---
practice katas
---
deliberately practice your tools
---
empower and appreciate youru team
---
build mini versions of the tools youuse
---
less is more

(eg shorter blogs)
---
visual > verbal
---
be interested and curious

* about jobs you apply to
* people you meet
* libs you try
* code you write
* ...
---
everything is an investment

so invest wisely
---
Breadth first > depth first
---
You will fail n times before you succeed

Assume n is 10
---
Sans Serif fonts > Serif fonts
---
Steal a colour scheme

(or generate one)
---
Increase line spacing
---
Increase font size
---
Increase whitespace
---
Manipulate your environment
---
Learn to say "I'm wrong"

(without saying "sorry")
---
Start with an MVP
---
Cost is exponential

So abandon things that
have already taken too long
---
Do something nice for someone

Without anyone knowing it was you
(aka: how to make yourself appreciative)
---
Quickly address issues

Otherwise they become the norm
and you become persistently frustrated
---
Say "no"
---
Say "yes"
---
Turn off notifications
---
When you're too miserable to feel

behave as if you weren't
because your behaviour still matters
and this way you can do the effective
thing, even though you don't feel it
---
Share ute cat and dog pics

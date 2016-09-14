require 'io/console'

slides = DATA.read.split "---\n"

define_method :show_slide do |index|
  y, x = $stdout.winsize
  slide      = slides[index].gsub(/^/, '    ')
  clear      = "\e[H\e[2J"
  bottom_row = "\e[#{y};1H"
  progress   = "#{index+1}/#{slides.length}"
  "#{clear}\r\n#{slide}#{bottom_row}#{progress}"
end

print "\e[?25l"
at_exit { print "\e[?25h" }

$stdin.raw do
  i = ARGV[0].to_i
  loop do
    print show_slide(i)
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
abc def
---
ghi jkl

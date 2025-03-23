
with ada.strings.unbounded;
use ada.strings.unbounded;

with ada.strings.unbounded.text_io;
use ada.strings.unbounded.text_io;

procedure ustr is 

s : unbounded_string;

begin
	s:=get_line;
	put_line(to_unbounded_string("str = ") & s);

end ustr;

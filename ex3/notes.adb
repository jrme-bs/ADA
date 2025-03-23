with text_io; use text_io;
with calc; use calc;

procedure notes is
    N : note;
    package note_io is new Float_IO(note);

begin
   calc.get_notes(N);
   note_io.Put(N);
end notes;
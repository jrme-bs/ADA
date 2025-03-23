with text_io; use text_io;

package body calc is
    procedure get_notes(A : out note) is
        package note_io is new Float_IO(note);
        begin
            declare
                N : note;
                i : Float := 1.0;
                s : Float := 0.0;
                val : Float;
            begin
                note_io.Get(N);
                while N /= 0.0 loop
                    s := s + float(N);
                    note_io.Get(N);
                    i := i + 1.0;
                end loop;
                val := s / i;
                A := Note(val);
        end;
    end get_notes;
end calc;

package calc is
    type note is new Float range 0.0 .. 20.0;
    procedure get_notes(A : out note);
end calc;

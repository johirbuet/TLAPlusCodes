------------------------- MODULE OneBitClockSafety -------------------------
EXTENDS Integers, Sequences
Put(s) == Append(s, "widget")
Get(s) == Tail(s)
(*****************************************************************
--algorithm Alternate {
variable b = 0 , box = << >> ;
process (Producer = 0)
{ p1: while (TRUE)
{ await b = 0 ;
box := Put(box) ;
b := 1
}
}
process (Consumer = 1)
{ c1: while (TRUE)
{ await b = 1 ;
box := Get(box) ;
b := 0
}
}
}
*****************************************************************)
\* BEGIN TRANSLATION
VARIABLES b, box

vars == << b, box >>

ProcSet == {0} \cup {1}

Init == (* Global variables *)
        /\ b = 0
        /\ box = << >>

Producer == /\ b = 0
            /\ box' = Put(box)
            /\ b' = 1

Consumer == /\ b = 1
            /\ box' = Get(box)
            /\ b' = 0

Next == Producer \/ Consumer

Spec == Init /\ [][Next]_vars

\* END TRANSLATION

=============================================================================
\* Modification History
\* Last modified Tue Dec 06 14:06:05 CST 2016 by johir
\* Created Tue Dec 06 14:05:31 CST 2016 by johir

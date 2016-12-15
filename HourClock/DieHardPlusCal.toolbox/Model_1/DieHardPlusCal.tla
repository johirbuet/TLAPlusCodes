--------------------------- MODULE DieHardPlusCal ---------------------------
EXTENDS Integers

Min(m,n) == IF m < n THEN m ELSE n


(***************************************************************************
--algorithm DieHard{
variables big = 0; small = 0 ;
{
while(TRUE)
{
    either big := 5 \* fill the big jug
    or small := 3 \* fill the small jug
    or big := 0 \* empty the big jug
    or small := 0 \* empty the small jug
    or with( poured = Min (big + small,5) - big) \* pour from small to big
    {
    big := big +poured;
    small := small - poured
    }
    or with (poured = Min (big + small,3) - small) \* pour from big to small
    {
    big := big - poured;
    small := small + poured
    }
}
}
}
 ***************************************************************************)
\* BEGIN TRANSLATION
VARIABLES big, small

vars == << big, small >>

Init == (* Global variables *)
        /\ big = 0
        /\ small = 0

Next == \/ /\ big' = 5
           /\ small' = small
        \/ /\ small' = 3
           /\ big' = big
        \/ /\ big' = 0
           /\ small' = small
        \/ /\ small' = 0
           /\ big' = big
        \/ /\ LET poured == Min (big + small,5) - big IN
                /\ big' = big +poured
                /\ small' = small - poured
        \/ /\ LET poured == Min (big + small,3) - small IN
                /\ big' = big - poured
                /\ small' = small + poured

Spec == Init /\ [][Next]_vars

\* END TRANSLATION

=============================================================================
\* Modification History
\* Last modified Tue Dec 06 17:23:08 CST 2016 by johir
\* Created Tue Dec 06 11:42:23 CST 2016 by johir

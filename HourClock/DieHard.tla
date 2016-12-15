------------------------------ MODULE DieHard ------------------------------

EXTENDS Integers
VARIABLES big,small

TypeOK == /\ big \in 0..5
          /\ small \in 0..3

Min(m,n) == IF m < n THEN m ELSE n
Init == /\ big =0
        /\ small=0
FillSmall == /\ small' = 3
             /\ big' = big
FillBig == /\ big' = 5
           /\ small' = small
EmptySmall == /\ small' = 0
              /\ big' = big
EmptyBig == /\ big' = 0
            /\ small' = small
SmallToBig ==
LET poured == Min(big + small, 5) - big
IN /\ big' = big + poured
   /\ small' = small - poured

BigToSmall ==
LET poured == Min(big + small, 3) - small
IN /\ big' = big - poured
/\ small' = small + poured

          
Next == \/ FillSmall
        \/ FillBig
        \/ EmptySmall
        \/ EmptyBig
        \/ SmallToBig
        \/ BigToSmall
        
=============================================================================
\* Modification History
\* Last modified Tue Dec 06 11:30:30 CST 2016 by johir
\* Created Tue Dec 06 10:41:51 CST 2016 by johir

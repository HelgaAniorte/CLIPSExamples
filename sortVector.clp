(defrule sort
    ?f <- (lista $?inicio ?a ?b $?fin)
    (test (> ?a ?b))
    =>
    (retract ?f)
    (assert (lista $?inicio ?b ?a $?fin))
    )
    
(defrule print
    (lista $?l)
    =>
     (printout t $?l crlf)
)
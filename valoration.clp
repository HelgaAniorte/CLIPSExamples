(deftemplate persona
    (slot nombre)
    (slot ingresos
        (type INTEGER))
    (slot familia
        (type SYMBOL)
        (allowed-values si no))
)



(deftemplate nivel_economico
    (slot nombre)
    (slot nivel
        (allowed-values bajo medio alto))
)

(defrule inicio
    (declare (salience 10000))
    =>
    (assert (fase abstraer))
)

(defrule nivel_alto
    (fase abstraer)
    ( persona (nombre ?n) (ingresos ?i&:(> ?i 30000)))
    =>
    (assert (nivel_economico (nombre ?n) (nivel alto)))
)


(defrule nivel_medio
    (fase abstraer)
    ( persona (nombre ?n) (ingresos ?i&:(and (> ?i 20000) (<= ?i 30000))))
    =>
    (assert (nivel_economico (nombre ?n) (nivel medio)))
)


(defrule nivel_bajo
    (fase abstraer)
    (persona (nombre ?n) (ingresos ?i&:(<= ?i 20000)))
    =>
    (assert (nivel_economico (nombre ?n) (nivel bajo)))
)

(defrule evaluate
    ?f <-(fase abstraer)
    (declare (salience -1))
    =>
    (retract ?f)
    (assert (fase evaluar))
)

(defrule conceder
    (fase evaluar)
    (nivel_economico (nombre ?n) (nivel medio|alto)))
    =>
    (printout t  "concedido a " ?n crll)
)

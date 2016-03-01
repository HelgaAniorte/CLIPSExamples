(deftemplate paciente
    (slot nombre)
    (slot temperatura)
    (multislot sintomas (type SYMBOL) (allowed-values tos dolor congestion nauseas))
    (slot sexo  (allowed-values mujer hombre))
    (slot color_pelo (type SYMBOL) )
)

(deffacts pacientes
    (paciente
        (nombre juan)
        (sexo hombre)
        (color_pelo marron)
        (temperatura 36.5)
        (sintomas congestion)
    )
    
    (paciente 
        (nombre ana)
        (sexo mujer)
        (color_pelo marron)
        (temperatura 39)
        (sintomas tos congestion)
    )
    (paciente
        (nombre ana)
        (sexo mujer)
        (color_pelo rubio)
        (temperatura 37.2)
        (sintomas tos dolor)
    )
    (paciente
        (nombre jose)
        (sexo hombre)
        (color_pelo rubio)
        (temperatura 38.8)
        (sintomas dolor)
    )
    (paciente
        (nombre isabel)
        (sexo mujer)
        (color_pelo negro)
        (temperatura 37)
        (sintomas dolor)
    )
)

; cold 37 < temperatura < 38 y tos

(defrule restfriado
    (paciente (nombre ?n) (temperatura ?t) (sintomas $? tos $?))
    (test (and (> ?t 37) (<= ?t 38)))
    =>
    (printout t ?n "tiene sintomas de refriado" crlf)
)

; flu temp > 38 tos & congestion
;(defrule gripe
;    (paciente (nombre ?n) (temperatura ?t) (sintomas $?s))
;    (test  (> ?t 38) )
;    (test (member$ tos $?s))
;    (test (member$ congestion $?s))
;    =>
;    (printout t ?n "tiene sintomas de gripe" crlf)
;)

;only women
(defrule paciente_mujer
    (paciente (nombre ?n) (sexo ~hombre))
    =>
    (printout t ?n "es mujer" crlf)
)

;strong gens
(defrule paciente_pelo_oscuro
    (paciente (nombre ?n) (color_pelo negro|marron))
    =>
    (printout t ?n "tiene pelo oscuro" crlf)
)

;blond people
(defrule paciente_pelo_rubio
    (paciente (nombre ?n) (color_pelo ~negro|~marron))
    =>
    (printout t ?n "tiene pelo oscuro" crlf)
)

(defrule gripe
    (paciente 
        (nombre ?n) 
        (temperatura ?t&:(> ?t 38))
        (sintomas $?s&:(and (member$ tos $?s) (member$ congestion $?s))))
    =>
    (printout t ?n "tiene sintomas de gripe" crlf)
)

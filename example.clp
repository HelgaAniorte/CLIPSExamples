(deftemplate paciente
    (slot nombre)
    (slot temperatura)
    (multislot sintomas)
)

(deffacts pacientes
    (paciente
        (nombre juan)
        (temperatura 36.5)
        (sintomas congestion)
    )
    
    (paciente 
        (nombre ana)
        (temperatura 39)
        (sintomas tos)
    )
    (paciente
        (nombre ana)
        (temperatura 37.2)
        (sintomas tos dolor)
    )
    (paciente
        (nombre jose)
        (temperatura 38.8)
        (sintomas dolor)
    )
    (paciente
        (nombre isabel)
        (temperatura 37)
        (sintomas dolor)
    )
)
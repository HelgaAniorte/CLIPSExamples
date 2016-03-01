(deftemplate paciente
    (slot nombre)
    (slot temperatura)
    (slot sintomas)
)

(deffacts pacientes
    (paciente
        (nombre juan)
        (temperatura 36.5)
        (sintomas congestion)
    )
    
    (paciente 
        (nombre ana)
        (temperaura 39)
        (sintomas tos)
    )
    (paciente
        (nombre ana)
        (temperatura 37.2)
        (sintomas tos)
    )
)
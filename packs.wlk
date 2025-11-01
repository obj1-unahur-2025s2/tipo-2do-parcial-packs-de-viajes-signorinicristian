class Pack {
    const duracionEnDias

    const precioBase

    const beneficios = #{}

    const coordinador = #{}

    method valorFinal() {
        const costoBeneficios = beneficios.filter({b => b.estaVigente()}).sum({b => b.costo()})
        return precioBase + costoBeneficios
    }

    method duracionEnDias() = duracionEnDias

    method precioBase() = precioBase

    method beneficios() = beneficios

    method coordinador() = coordinador

    method esPremium()
}

class PackNacional inherits Pack {
    const provinciaDestino

    const actividades = #{}

    method provinciaDestino() = provinciaDestino

    method actividades() = actividades

    method agregarActividad(actividad) {
        actividades.add(actividad)
    }
    
    override method esPremium() {
        return duracionEnDias > 10 && coordinador.esAltamenteCalificado()
    }
}

class PackInternacional inherits Pack {
    const paisDestino

    const cantidadEscalas

    const esLugarDeInteres

    method paisDestino() = paisDestino

    method cantidadEscalas() = cantidadEscalas

    method esLugarDeInteres() = esLugarDeInteres

    override method valorFinal() {
        return super() + super() * 0.2 
    }

    override method esPremium() {
        return esLugarDeInteres && duracionEnDias > 20 && cantidadEscalas == 0
    }
}

class PackProvincial inherits PackNacional {
    const cantidadCiudades

    override method esPremium() {
        return actividades.size() >= 4 && cantidadCiudades > 5 && beneficios.size() >= 3
    }

    override method valorFinal() {
        return super() + super() * 0.05
    }
}

class Beneficio {
    const tipo

    const costo

    const estaVigente

    method tipo() = tipo

    method costo() = costo

    method estaVigente() = estaVigente 
}
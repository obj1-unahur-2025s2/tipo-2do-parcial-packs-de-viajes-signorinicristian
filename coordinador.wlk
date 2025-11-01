class Coordinador {
    const cantViajesRealizados

    const estaMotivado

    const añosDeExperiencia

    var rol
    
    const rolesValidos = #{guia, asistenteLogistico, acompañante}

    method rol() = rol

    method estaMotivado() = estaMotivado

    method cantViajesRealizados() = cantViajesRealizados

    method añosDeExperiencia() = añosDeExperiencia

    method cambiarRol(nuevoRol) {
        if(rolesValidos.contains(nuevoRol)) {
            rol = nuevoRol
        } else {
            self.error("Rol inválido")
        }
    }

    method esAltamenteCalificado() {
        return cantViajesRealizados > 20 && guia.condicion(self)
    }
}

// ROLES

object guia {
    method condicion(coordinador) {
        return coordinador.estaMotivado()
    }
}

object asistenteLogistico {
    method condicion(coordinador) {
        return coordinador.añosDeExperiencia() >= 3
    }
}

object acompañante {
    method condicion(coordinador) {
        return true
    }
}
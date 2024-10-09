class Universidad {
  const property provincia
  var property honorarios 
  var donaciones = 0
  method recibirDonaciones(unImporte){
    donaciones += unImporte
  }
}

class AsociadoAUnaUniversidad {
  const property universidad 
  method honorarios() = universidad.honorarios()
  method puedeTrabajar() = [universidad.provincia()] 
  method cobrarUnImporte(unImporte) {
    universidad.recibirDonaciones(unImporte*0.5)
  } 
}

class AsociadosDelLitoral {
  const property universidad  
  method honorarios() = 3000
  method puedeTrabajar() = ["Entre rios","Santa Fe","Corrientes"]  
  method cobrarUnImporte(unImporte) {
    asociacionProfesionalesDelLitoral.recaudar(unImporte)
  }
}

class Libres {
  var recaudado = 0
  var property puedeTrabajar = []
  var property honorarios 
  const property universidad
  method cobrarUnImporte(unImporte) {
    recaudado += unImporte
  }
}

class Empresa {
  const property profesionales = []
  var property honorariosReferencia
  method agregarProfesional(unProfesional) {
    profesionales.add(unProfesional)
  }
  method cuantos(universidad){
    return
    profesionales.count({p => p.universidad() == universidad})
  }
  method caros() {
    return
    profesionales.filter({p => p.honorarios() > honorariosReferencia})
  }
  method universidadesFormadoras() {
    return
    profesionales.map({p => p.universidad()}).asSet()
  }
  method barato() {
    return
    profesionales.min({p => p.honorarios()})
  }
  method genteAcotada() {
    return
    !profesionales.any({p => p.puedeTrabajar().size() > 3})
  }
  method puedeSatisfacer(unSolicitante){
    return
    profesionales.any({p => unSolicitante.puedeSerAtendido(p)})
  }
}

class SolicitantePersona {
  var property provincia 
  method puedeSerAtendido(unProfesional){
    return
    unProfesional.puedeTrabajar().contains(provincia)
  } 
}

class SolicitanteInstitucion {
  var property universidades 
  method puedeSerAtendido(unProfesional){
    return
    universidades.contains(unProfesional.universidad())
  }
}

class SolicitanteClub {
  var property provincias 
  method puedeSerAtendido(unProfesional){
    return
    not provincias.asSet().intersection(unProfesional.puedeTrabajar().asSet()).isEmpty()
    //otra forma:
    //provincias.any({pClub => unProfesional.puedeTrabajar().cointains(pClub)})
  }
}

object asociacionProfesionalesDelLitoral {
  var recaudado = 0
  method recaudar(unImporte){
    recaudado += unImporte
  }
}
/* Parcial Minions */
class Laboratorio {
	var empleados
	constructor(_empleados) {
		empleados = _empleados
	}
	method arreglarMaquina(maquina,empleado) {
		if(maquina.complejidad() >= empleado.estamina() && empleado.herramientas().contains(maquina.herramientasNecesarias()) )
		{
		empleado.agregarExperiencia(maquina.complejidad() * 2)
		empleado.perderEstamina(maquina.complejidad())
		return true
		}
			return false		
	}
	method defenderSector(gradoAmenaza, empleado) {
		if(empleado.puedeDefenderse(gradoAmenaza))
		{
			if(empleado.noEstaEntrenado())
			{
				empleado.perderEstamina(empleado.estamina() / 2)
			}
		empleado.modificarExperiencia()
		return true
		}
		return empleado.puedeDefenderse(gradoAmenaza)

		
	}
	method limpiarSector(sector) {
		
	}
}
/*
object complejidad {
	var laboratorio 
	method nuevoLaboratorio(nuevoLab) {laboratorio = nuevoLab}
	method dificultad() {
		
	}
}
 */
class Empleado {
	var rolEmpleado
	var estamina
	var herramientas = []
	var experiencia
	var dificultad
	constructor(_rolEmpleado,_estamina,_experiencia) {
		rolEmpleado = _rolEmpleado
		estamina = _estamina
		experiencia = _experiencia
	}
	method recuperarEstamina(fruta) {estamina += fruta.poder()}
	method cambiarRol(nuevoRol) {rolEmpleado = nuevoRol}
	method estamina() = estamina
	method perderEstamina(puntos) {estamina -= puntos}
	method fuerza() = (estamina/2) + rolEmpleado.agregadoFuerza() 
	method defender(gradoAmenaza) = self.fuerza() >= gradoAmenaza && rolEmpleado.puedeDefenderse()
	method agregarExperiencia(cantidad) {experiencia += 1 dificultad += cantidad}
	method experiencia() = experiencia * dificultad
	method noEstaEntrenado() = rolEmpleado.entrenado()
 
}
// Razas(diversidad cultural) de empleados
class Biclope inherits Empleado {
	override method estamina() = estamina.min(10)
	method modificarExperiencia(amenaza) {experiencia += amenaza} 
}
class Ciclope inherits Empleado {
	override method fuerza() {
		return super() / 2
	}
	method modificarExperiencia(amenaza) {experiencia += (amenaza*2)} 
}
// Roles
class Soldado {
	var arma
	var practica
	method nuevaArma(_arma) {arma = _arma}
	method defender(sector) {
		practica += 1
	}
	method practica() = practica
	method agregadoFuerza() = 2 + practica
	method puedeDefenderse() = true
	method entrenado() = true
}
class Obrero {
	var herramientas = [] 
	method agregarHerramientas(_herramientas) {herramientas.addAll(_herramientas)}
	method agregadoFuerza() = 2
	method puedeDefenderse() = true
	method entrenado() = false
}
object mucama  {
	method agregadoFuerza() = 2
	method puedeDefenderse() = false
	method entrenado() = false
}

object banana {
	method poder() = 10
}
object manzana {
	method poder() = 5
}
object uva {
	method poder() = 1
}

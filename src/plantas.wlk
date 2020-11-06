import wollok.game.*
import toni.*
import mercados.*
import pachamama.*

class Plantas{
	var property image = null
	var property position
	method monedasQueVale()
	method regada()
	method esCosechable()	
	method esLibreDeGluten(){return true}	
}

class Maiz inherits Plantas{
	const property imagenes = ["maiz_bebe.png", "maiz_adulto.png"] 
	var property etapaEvolucion = 0
	var property imagen = imagenes.get(etapaEvolucion)
	
	override method monedasQueVale(){return 150}
	override method regada() { 
		etapaEvolucion = 1
		imagen = imagenes.get(etapaEvolucion)
	}
	override method esCosechable() { return etapaEvolucion == 1 }	
}


class Trigo inherits Plantas{
	const property imagenes = ["trigo_0.png", "trigo_1.png", "trigo_2.png", "trigo_3.png"]
	var property etapaEvolucion = 0
	var property imagen = imagenes.get(etapaEvolucion)
	
	method valoracionMoneda(){
		return if (etapaEvolucion == 2) 100 
		else if (etapaEvolucion == 3) 200 
		else 0
	}
	
	override method monedasQueVale(){
		return if(pachamama.estaAgradecida()) 180 else self.valoracionMoneda()
	}
	
	method nroEvolucion(){
		return if (pachamama.estaAgradecida()) 2 else 1
	}
	
	override method regada() {
		if (etapaEvolucion == 3) { etapaEvolucion = 0} 
		else { etapaEvolucion += self.nroEvolucion() }
		imagen = imagenes.get(etapaEvolucion)
	}
	
	override method esCosechable() { return etapaEvolucion >= 2 }
	override method esLibreDeGluten(){ return false }
}


class Tomaco inherits Plantas {
	
	const property imagenes = ["tomaco_podrido.png", "tomaco_ok.png"]
	var property etapaEvolucion = 1
	var property imagen = imagenes.get(etapaEvolucion) 

	override method monedasQueVale(){return if (self.tomacoEstaPodrido()) 0 else 80 }	
	override method regada() {}
	override method esCosechable() { return not self.tomacoEstaPodrido() }
	
	method tomacoEstaPodrido(){ 
		const agradecida = pachamama.estaAgradecida()
		if (not agradecida) etapaEvolucion = 1 else etapaEvolucion = 0
		return agradecida
	}
}

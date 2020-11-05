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
	//var property imagen = imagenes.get(etapaEvolucion)
	override method image() = imagenes.get(etapaEvolucion)
	
	override method monedasQueVale(){return 150}
	override method regada() { 
		etapaEvolucion = 1
		image = imagenes.get(etapaEvolucion)
	}
	override method esCosechable() { return etapaEvolucion == 1}
}

class Trigo inherits Plantas{
	const property imagenes = ["trigo_0.png", "trigo_1.png", "trigo_2.png", "trigo_3.png"]
	var property etapaEvolucion = 0
	override method image() = imagenes.get(etapaEvolucion)
	
	override method monedasQueVale(){
		return if (etapaEvolucion == 2) 100 
		else if (etapaEvolucion == 3) 200 
		else 0
	}
	
	override method regada() {
		if (etapaEvolucion == 3) { etapaEvolucion = 0} else {etapaEvolucion += 1}
		image = imagenes.get(etapaEvolucion)
	}	
	
	override method esCosechable() { return etapaEvolucion >= 2 }
	override method esLibreDeGluten(){return false}
}

class Tomaco inherits Plantas {
	override method image() = "tomaco_ok.png"
	override method monedasQueVale(){return 80}
	override method regada() {}
	override method esCosechable() { return true }
	method tomacoEstaPodrido(){ image = "tomaco_podrido.png" }
	
}


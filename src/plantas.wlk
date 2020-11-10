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
	method pudrir()
}
class Maiz inherits Plantas{
	const property imagenes = ["maiz_bebe.png", "maiz_adulto.png"] 
	var property etapaEvolucion = 0
	override method image() = imagenes.get(etapaEvolucion)
	
	override method monedasQueVale(){ return if(pachamama.estaAgradecida()) 180 else 150 }
	override method regada() { 
		etapaEvolucion = 1 
		image = imagenes.get(etapaEvolucion)
	}
	override method esCosechable() { return etapaEvolucion == 1}
	override method pudrir(){}
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
	
	method nroEvolucion(){
		return if (pachamama.estaAgradecida()) 2 else 1
	}
	method valorN(){
		//Con pacha agradecida da 1, sino da 0
		return self.nroEvolucion()-1
	}
	override method regada() {
		if (etapaEvolucion == 3) { etapaEvolucion = self.valorN()} 
		else if(etapaEvolucion == 2){etapaEvolucion = etapaEvolucion+1-self.valorN()*3}
		else { etapaEvolucion += self.nroEvolucion()}
		image = imagenes.get(etapaEvolucion)
	}
	override method esCosechable() { return etapaEvolucion >= 2 }
	override method esLibreDeGluten(){return false}
	override method pudrir(){}
}

class Tomaco inherits Plantas {
	const property imagenes = ["tomaco_podrido.png", "tomaco_ok.png"]
	var property etapaEvolucion = 1
	override method image() = imagenes.get(etapaEvolucion)

	override method monedasQueVale(){return if (self.tomacoEstaPodrido()) 0 else 80 }	
	override method regada() {}
	override method esCosechable() { return not self.tomacoEstaPodrido() }
	override method pudrir(){  
		etapaEvolucion=0	
		image= imagenes.get(etapaEvolucion)
	}
	method tomacoEstaPodrido(){ 
		return etapaEvolucion==0
	}
}

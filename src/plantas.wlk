class Plantas{
	var property image = null
	var property position
	method monedasQueVale()
	method regada()
	method esCosechable()	
	
}

class Maiz inherits Plantas{
	const property imagenes = ["maiz_bebe.png", "maiz_adulto.png"] 
	var property etapaEvolucion = 0
	var property imagen = imagenes.get(etapaEvolucion)
	
	override method monedasQueVale(){return 50}
	override method regada() { 
		etapaEvolucion = 1
		imagen = imagenes.get(etapaEvolucion)
	}
	override method esCosechable() { return etapaEvolucion == 1}
}

class Trigo inherits Plantas{
	const property imagenes = ["trigo_0.png", "trigo_1.png", "trigo_2.png", "trigo_3.png"]
	var property etapaEvolucion = 0
	var property imagen = imagenes.get(etapaEvolucion)

	override method monedasQueVale(){return 30}
	override method regada() {
		if (etapaEvolucion == 3) { etapaEvolucion = 0} else {etapaEvolucion += 1}
		imagen = imagenes.get(etapaEvolucion)
	}	
		override method esCosechable() { return etapaEvolucion >= 2 }
}

class Tomaco inherits Plantas {
	var property imagen = "tomaco_ok.png"
	override method monedasQueVale(){return 100}
	override method regada() {}
	override method esCosechable() { return true }
	method tomacoEstaPodrido(){ imagen = "tomaco_podrido.png" }
	
}


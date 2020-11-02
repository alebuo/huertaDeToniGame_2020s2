class Plantas{
	var property imagen = null
	var property position
	method monedasQueVale()
}

class Maiz inherits Plantas{
	// Modificar esto para que la imagen dependa del estado.
	override method imagen(){ imagen = "maiz_bebe.png" }
	override method monedasQueVale(){return 50}
}

class Trigo inherits Plantas{
	// Modificar esto para que la imagen dependa del estado.
	override method imagen(){ imagen = "trigo_0.png"}
	override method monedasQueVale(){return 30}
}


class Tomaco inherits Plantas {
	// Modificar esto para que la imagen dependa del estado.
	override method imagen(){ imagen = "tomaco_ok.png"}
	
	method tomacoEstaPodrido(){ imagen = "tomaco_podrido.png" }
	override method monedasQueVale(){return 100}
}

// Agregar las demás plantas y completar el Maiz.
import wollok.game.*
import toni.*
import plantas.*
import pachamama.*

class Mercado {
	var property image = "mercado.png"
	var property cantMonedas = 10000
	var property mercaderia =[]
	
	method comprarCosechas(){
		//Toni parado en el mercado (error si no toni no esta parado en el mercado
		// descontar monedas
		// agregar mercaderia al mercado
	 if ( toni.dineroAVender() < cantMonedas ){
	  	cantMonedas - toni.dineroAVender()
	  	mercaderia.addAll(toni.plantasCosechadas())}
		else { self.error("EL MERCADO NO PUEDE COMPRAR LA COSECHA ") }
	}
}

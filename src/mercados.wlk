import wollok.game.*
import toni.*
import plantas.*
import pachamama.*

class Mercado {
	var property image = "mercado.png"
	const property position
	var property cantMonedas = 10000
	var property mercaderia =[]
	
	method comprar(planta) {
		const monedasAPagar = planta.monedasQueVale()
		mercaderia.add(planta)
		cantMonedas -= monedasAPagar
		return monedasAPagar
	}
}

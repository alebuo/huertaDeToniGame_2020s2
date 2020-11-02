import wollok.game.*
import plantas.*

object toni {
	const property image = "toni.png"
	var property position = game.at(3, 3)
	const property plantasSembradas = []
	var property monedasDeOro = 0
	
	method moverNorte(){ self.position(self.position().up(1)) }
	method moverSur(){ self.position(self.position().down(1)) }
	method moverEste(){ self.position(self.position().right(1))}
	method moverOeste(){ self.position(self.position().left(1))}
	
		// SEMBRAR MAIZ
	method sembrarMaiz(maiz){ plantasSembradas.add(maiz) }
	method sembrarTrigo(trigo){ plantasSembradas.add(trigo) }
	method sembrarTomaco(tomaco){ plantasSembradas.add(tomaco) }
	
	// METHODS REGAR
	/* hay que corregir que pasa con cada planta  */
	method regarPlanta(maiz){ maiz.imagen("maiz_adulto.png") }
	
	
	// METHODS COSECHAR
	method cosecharPlanta(planta){ 
		plantasSembradas.remove(planta)
	}
	
	
	
	
	method paraCuantosDiasLeAlcanza() {}
	method cuantoHayParaCeliacos() {}
	method convieneRegar() {}
}
import wollok.game.*
import plantas.*

object toni {
	const property image = "toni.png"
	var property position = game.at(3, 3)
	const property maizSembrado = []
	var property monedasDeOro = 0
	
	method moverNorte(){ self.position(self.position().up(1)) }
	method moverSur(){ self.position(self.position().down(1)) }
	method moverEste(){ self.position(self.position().right(1))}
	method moverOeste(){ self.position(self.position().left(1))}
	
		// SEMBRAR MAIZ
	method sembrarMaiz(maiz){ maizSembrado.add(maiz) }
	method sembrarTrigo(trigo){ maizSembrado.add(trigo) }
	method sembrarTomaco(tomaco){ maizSembrado.add(tomaco) }
	
	// METHODS REGAR
	/* hay que corregir que pasa con cada planta  */
	method regarPlanta(maiz){ maiz.imagen("maiz_adulto.png") }
	
	
	// METHODS COSECHAR
	method cosecharPlanta(maiz){ maizSembrado.remove(maiz)  }
	
	
	
	
	method paraCuantosDiasLeAlcanza() {}
	method cuantoHayParaCeliacos() {}
	method convieneRegar() {}
}
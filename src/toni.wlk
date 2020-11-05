import wollok.game.*
import plantas.*
import mercados.*
import pachamama.*


object toni {
	const property image = "toni.png"
	var property position = game.at(3, 3)
	const property plantasSembradas = []
	var property monedasDeOro = 0
	const property plantasCosechadas = []
	
	method moverNorte(){ self.position(self.position().up(1)) }
	method moverSur(){ self.position(self.position().down(1)) }
	method moverEste(){ self.position(self.position().right(1))}
	method moverOeste(){ self.position(self.position().left(1))}
	
	// SEMBRAR MAIZ
	method sembrar(planta){
		// position.clone().drawElement(planta)
		plantasSembradas.add(planta)
		//posicionPlantas.add(position)
		game.addVisual(planta)		
	}
	method posicionSiembra() { return position.clone() }
	
	method sembrarMaiz(){ self.sembrar(new Maiz(position=self.posicionSiembra())) }
	method sembrarTrigo(){ self.sembrar(new Trigo(position=self.posicionSiembra())) }
	method sembrarTomaco(){ self.sembrar(new Tomaco(position=self.posicionSiembra())) }
	
	
	
	// METHODS REGAR

	method regarLasPlantas(){
		plantasSembradas.forEach( {planta => planta.regada()} )
	}
	
	// METHODS COSECHAR
	method cosecharPlanta(planta){ 
		plantasSembradas.remove(planta)
		game.removeVisual(planta)	
	}
	
	method plantasListasParaCosechar() {
		return plantasSembradas.filter( {planta => planta.esCosechable()} )
	}
	
	method agregarACosecha(lista){ plantasCosechadas.addAll(lista) }
	
	method cosecharTodo() { 
		self.agregarACosecha(self.plantasListasParaCosechar())
		self.plantasListasParaCosechar().forEach( {planta => self.cosecharPlanta(planta)} )	
	}
	
	// VENDER
	// ========
	method venderPlanta(planta){
		monedasDeOro += planta.monedasQueVale()
		plantasCosechadas.remove(planta)
	}
	
	method venderCosecha(){
		plantasCosechadas.forEach({planta => self.venderPlanta(planta)})
	}
	
	method paraCuantosDiasLeAlcanza() {}
	method cuantoHayParaCeliacos() {}
	method convieneRegar() {}
}

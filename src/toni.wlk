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
	
	// Movimientos de Toni al estilo PacMan
	method posicionNorte() {return if (self.position().y() < 14) { self.position().up(1)} else { self.position().down(14) } }
	method moverNorte(){ self.position(self.posicionNorte()) }
	method posicionSur() {return if (self.position().y() > 0) { self.position().down(1)} else { self.position().up(14) } }
	method moverSur(){ self.position(self.posicionSur()) }
	method posicionEste() {return if (self.position().x() < 14) { self.position().right(1)} else { self.position().left(14) } }
	method moverEste(){ self.position(self.posicionEste()) }
	method posicionOeste() {return if (self.position().x() > 0) { self.position().left(1)} else { self.position().right(14) } }
	method moverOeste(){ self.position(self.posicionOeste())}
	
	// SEMBRAR MAIZ
	method sembrar(planta){
		plantasSembradas.add(planta)
		game.addVisual(planta)		
	}
	method existeAlgoEnEstaPosicion() = game.colliders(self).size()>0
	method posicionSiembra() { return position.clone() }
	
	method sembrarMaiz(){ if(not self.existeAlgoEnEstaPosicion()) self.sembrar(new Maiz(position=self.posicionSiembra())) else self.error("Ya existe una planta en este lugar")}
	method sembrarTrigo(){ if(not self.existeAlgoEnEstaPosicion()) self.sembrar(new Trigo(position=self.posicionSiembra())) else self.error("Ya existe una planta en este lugar")}
	method sembrarTomaco(){ if(not self.existeAlgoEnEstaPosicion()) self.sembrar(new Tomaco(position=self.posicionSiembra())) else self.error("Ya existe una planta en este lugar")}
		
	// METHODS REGAR

	method regarLasPlantas(){
		plantasSembradas.forEach( {planta => planta.regada()} )
	}
	
	method regarActual(plantaIndividual){
			plantaIndividual.forEach( {planta => planta.regada()} )	
	}
	
	// METHODS COSECHAR
	method cosecharPlanta(planta){ 
		plantasSembradas.remove(planta)
		
	}
	
	method plantasListasParaCosechar() {
		return plantasSembradas.filter( {planta => planta.esCosechable()} )
	}
	
	method agregarACosecha(lista){ plantasCosechadas.addAll(lista) }
	
	method cosecharTodo() { 
		self.agregarACosecha(self.plantasListasParaCosechar())
		self.plantasListasParaCosechar().forEach( {planta => self.cosecharPlanta(planta) game.removeVisual(planta)} )
	}
	
	method cosecharActual(planta) { 
		if(planta.any({p => p.esCosechable()}))	{
		self.agregarACosecha(planta) 
		planta.forEach( {p => self.cosecharPlanta(p)}) 
		game.colliders(self).forEach({pl => game.removeVisual(pl)})
		}
		}
		
	// VENDER
	// ========
	method venderPlanta(planta){
		plantasCosechadas.remove(planta)
		const monedasRecibidasPorVenta = game.colliders(self).get(0).comprar(planta)
		monedasDeOro += monedasRecibidasPorVenta
	}
	
	method hayMercado(){ return game.colliders(self).get(0).toString() == 'un/a  Mercado' }
	method tieneMonedasMercado() = game.colliders(self).get(0).cantMonedas()
	method tieneSuficientesMonedasMercado(){
		return self.tieneMonedasMercado()>= self.dineroAVender()
	}
		method venderCosecha(){
		if (self.hayMercado() and self.tieneSuficientesMonedasMercado()) {
			plantasCosechadas.forEach({planta => self.venderPlanta(planta)})
		} else {
			game.say(self, "No se puede vender la cosecha")
			}
		}
	
	method dineroAVender() {
		return plantasCosechadas.sum({d => d.monedasQueVale()})
	}
	method paraCuantosDiasLeAlcanza() {
		return ( monedasDeOro + self.dineroAVender() ) / 200
	}
	method cuantoHayParaCeliacos(){
		return plantasSembradas.count({p => p.esLibreDeGluten()})
	}
	
	method convieneRegar(){
		return not plantasSembradas.all({p => p.esCosechable()})
	}
	
	method ofrendaALaPachamama(){
		const unaPlantaAlAzar=plantasSembradas.anyOne()
		plantasSembradas.remove(unaPlantaAlAzar)
		game.removeVisual(unaPlantaAlAzar)
		if (not pachamama.estaAgradecida()) pachamama.nivelDeAgradecimiento(10) else pachamama.llover()}
		
	method bajar(){	position = position.down(1)	}
}

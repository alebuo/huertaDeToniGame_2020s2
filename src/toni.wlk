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
	method posicionNorte() {return if (self.position().y() < 15) { self.position().up(1)} else { self.position().down(15) } }
	method moverNorte(){ self.position(self.posicionNorte()) }
	method posicionSur() {return if (self.position().y() > 0) { self.position().down(1)} else { self.position().up(15) } }
	method moverSur(){ self.position(self.posicionSur()) }
	method posicionEste() {return if (self.position().x() < 15) { self.position().right(1)} else { self.position().left(15) } }
	method moverEste(){ self.position(self.posicionEste()) }
	method posicionOeste() {return if (self.position().x() > 0) { self.position().left(1)} else { self.position().right(15) } }
	method moverOeste(){ self.position(self.position().posicionOeste())}
	
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
		monedasDeOro += planta.monedasQueVale()
		plantasCosechadas.remove(planta)
	}
	
	method venderCosecha(){
		plantasCosechadas.forEach({planta => self.venderPlanta(planta)})
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
		
		plantasSembradas.anyOne({p => p.remove()})
		
		if ( not pachamama.estaAgradecida() ) {
			pachamama.nivelDeAgradecimiento(10)}
		
		pachamama.llover()
	}
	
}

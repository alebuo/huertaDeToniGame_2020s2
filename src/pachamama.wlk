import wollok.game.*
import plantas.*
import mercados.*
import toni.*

object pachamama {
	var property nivelDeAgradecimiento = 10
	var property image = "pachamama-agradecida.png"
		
	method llover(){ 
		nivelDeAgradecimiento += 5
		toni.plantasSembradas().forEach( {planta => planta.regada()} )
		self.cambiarImgPachamama()
	}
	
	method estaAgradecida(){
		return (nivelDeAgradecimiento >= 10)
	}
	
	method cambiarImgPachamama(){
		if (self.estaAgradecida()) {image = "pachamama-agradecida.png"}
			else { image = "pachamama-triste.png" 
				self.pudrirPlantasInjerto()
			}
	}
	
	method pudrirPlantasInjerto(){
		toni.plantasSembradas().map({a=>a =='un/a  Tomaco'}).forEach( {planta => planta.pudrirTomaco()} )				
	}
	method agradecimiento(){
		if (not self.estaAgradecida()) self.nivelDeAgradecimiento(10) else self.llover()
		
	}
	
}

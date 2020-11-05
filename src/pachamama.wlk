import wollok.game.*
import plantas.*
import mercados.*
import toni.*

object pachamama {
	var property nivelDeAgradecimiento = 10
	var property image = "pachamama-agradecida.png"
	
	method fumigar(){
		nivelDeAgradecimiento = 0
		self.cambiarImgPachamama()
	}
	
	method llover(){ 
		nivelDeAgradecimiento += 5
		self.cambiarImgPachamama()
	}
	
	method estaAgradecida(){
		return (nivelDeAgradecimiento >= 10)
	}
	
	method cambiarImgPachamama(){
		if (self.estaAgradecida()) {image = "pachamama-agradecida.png"}
			else { image = "pachamama-triste.png" }
	}
}

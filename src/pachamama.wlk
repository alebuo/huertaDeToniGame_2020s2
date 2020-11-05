import wollok.game.*
import plantas.*
import mercados.*
import toni.*

object pachamama {
	var property nivelDeAgradecimiento = 10
	var property imagen = "pachamama-agradecida.png"
	
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
		if (self.estaAgradecida()) {imagen = "pachamama-agradecida.png"}
			else { imagen = "pachamama-triste.png" }
	}
}

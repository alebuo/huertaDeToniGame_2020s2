import wollok.game.*
import plantas.*
import mercados.*
import toni.*

object pachamama {
	var property image = "pachamama-agradecida.png"
		
	// FUMIGAR Y LLOVER PRODUCEN EFECTOS EN EL CAMPO?
	method fumigar(){ image = "pachamama-triste.png" }
	method llover(){ image = "pachamama-agradecida.png" }
}

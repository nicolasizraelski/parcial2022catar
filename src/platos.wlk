import cocineros.*
import torneo.*
class Plato { 
	var calorias = 0
	var azucar = 0
	method cantAzucar () = azucar
	method esBonito()
	method calorias () = 100 + 3 * self.cantAzucar()
}

class Entrada inherits Plato {
	override method cantAzucar () = 0
	override method esBonito() = true
}

class Principal inherits Plato {
	var bonito
	override method esBonito() = bonito
}

class Postre inherits Plato {
	const cantColores = 0
	override method cantAzucar() = 120
	override method esBonito() = cantColores > 3
}

const postreli = new Postre(cantColores = 4) 
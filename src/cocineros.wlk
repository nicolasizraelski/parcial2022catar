import platos.*

class Cocinero {
	method catar(plato) = {}
	method cocinar() = {}
}

class Pastelero inherits Cocinero {
	const dulzorDeseado = 200
	
	override method catar (plato) = 10.max(5 * plato.cantAzucar() / dulzorDeseado)
	
	override method cocinar () = new Postre(cantColores = dulzorDeseado / 50)
}



class Chef inherits Cocinero {
	const caloriasDeseadas = 200
	
	method cumpleExpectativas (plato) = plato.esBonito() && plato.calorias() < caloriasDeseadas
	
	override method catar (plato) = if (self.cumpleExpectativas(plato)) 10 else 0
	
	override method cocinar () = new Principal(azucar = caloriasDeseadas, bonito = true)
	
}

class SousChef inherits Chef {
	
	override method catar (plato) {
		var calificacion
		if(self.cumpleExpectativas(plato)){
			calificacion = super(plato)
		}else{
			calificacion = 6.max(plato.calorias() / 100)
		}
		
		return calificacion
	}
	
	override method cocinar () = new Entrada()
}










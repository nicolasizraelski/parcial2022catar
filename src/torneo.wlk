import cocineros.*

class Torneo {
	
	var catadores = #{new Pastelero(dulzorDeseado = 500),  new Pastelero(dulzorDeseado = 100)}
	var cocineros = [new Pastelero(dulzorDeseado = 200), new Chef(caloriasDeseadas = 600)]
	
	method calificarPlato (plato) {
		const puntajesIndividuales = catadores.map({ catador => catador.catar(plato)})
		
		return puntajesIndividuales.sum()
	}
	
	method obtenerGanador () {
		
		if(catadores.size() == 0 || cocineros.size() == 0 ) throw new DomainException(message="Faltan competidores o catadores")
		
		const puntajesTotales = cocineros.map({ unCocinero => self.calificarPlato( unCocinero.cocinar()) })
		const puntajeMaximo = puntajesTotales.max()
			
		return cocineros.find({cocinero => self.calificarPlato(cocinero.cocinar()) ==  puntajeMaximo})
	}
}

const torneito = new Torneo()

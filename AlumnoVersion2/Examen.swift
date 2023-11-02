//
//  Examen.swift
//  AlumnoVersion2
//
//  Created by Anna Ruiz on 02/11/2023.
//
import Foundation


class Examen {

    var nombre: String
    var totalPreguntas: Int
    var totalAcertadas: Int
    var notaFinal: Float!
    
    
    
    init(nombre: String, totalPreguntas: Int, totalAcertadas: Int){
    self.nombre = nombre
    self.totalPreguntas = totalPreguntas
    self.totalAcertadas = totalAcertadas
    
    self.notaFinal = calcularNotaFinal()
}

func calcularNotaFinal() -> Float {
    return Float(totalAcertadas) / Float(totalPreguntas) * 10
}
   
func toString()->String{
    return "Nombre: \(totalPreguntas)\n Total Preguntas: \(totalPreguntas)\n Total Acertadas: \(totalAcertadas)\n Nota Final: \(String(notaFinal))"
}

}


//
//  ObtenerExamen.swift
//  AlumnoVersion2
//
//  Created by Anna Ruiz on 02/11/2023.
//

import Foundation

protocol ObtenerExamen {
    func obtener(dato: Examen)
    
    func eliminar(posicion: Int)
    
    func modificar(posicion: Int, nuevoExamen: Examen)
    
}

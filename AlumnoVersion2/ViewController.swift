//
//  ViewController.swift
//  AlumnoVersion2
//
//  Created by Anna Ruiz on 02/11/2023.
//

import UIKit

class ViewController: UIViewController, ObtenerExamen, UITableViewDelegate, UITableViewDataSource{
  
    
   
    
    @IBOutlet weak var tablaExamenes: UITableView!
    var listaExamenes: [Examen]!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        listaExamenes = [] //inicializamos la lista
        
        
        tablaExamenes.delegate = self
        tablaExamenes.dataSource = self
        
    }
    //MEtodos necesarios del prrotocolo
    func eliminar(posicion: Int) {
        listaExamenes.remove(at: posicion)
        tablaExamenes.reloadData()
    }
    
    func modificar(posicion: Int, nuevoExamen: Examen) {
        listaExamenes[posicion] = nuevoExamen
        tablaExamenes.reloadData()
    }

   
    //Dos metodos q implementamos ya que los necesita el delegate/datasource
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        listaExamenes.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let celda = tableView.dequeueReusableCell(withIdentifier: "CELDA", for: indexPath) as! CeldaTableViewCell //Se uusa para luego poder rellenar la celda
        
        let examen = listaExamenes[indexPath.row]
        celda.lbNombre.text = examen.nombre
        celda.lbNota.text = String(examen.notaFinal)
        
        return celda
    }
    

    //Implementamos la funcion del protocolo
    func obtener(dato: Examen) {
        listaExamenes.append(dato)//Q añade el examen q recibimos a la lista
        tablaExamenes.reloadData()
    }
    
    //Implementamos el prepare para
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "CREAR" {
            let destino = segue.destination as! CrearExamenViewController
            destino.delegate = self
        }
        
        if  segue.identifier == "MODIFICAR" {
            let destino = segue.destination as! ModificarViewController
            destino.examen = listaExamenes [tablaExamenes.indexPathForSelectedRow!.row]
            destino.posicion = tablaExamenes.indexPathForSelectedRow!.row
            
            destino.delegate = self
        }
        
        
    }
    
}


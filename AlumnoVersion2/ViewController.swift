//
//  ViewController.swift
//  AlumnoVersion2
//
//  Created by Anna Ruiz on 02/11/2023.
//

import UIKit

class ViewController: UIViewController, ObtenerExamen{
    @IBOutlet weak var txtIndice: UITextField!
    var listaExamenes: [Examen]!
    
    @IBOutlet weak var lbResultado: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        listaExamenes = [] //inicializamos la lista
        
    }

   
    @IBAction func btnVerExamen(_ sender: Any) {
        
        let indice = txtIndice.text!
        
        if !indice.isEmpty && Int(indice)! >= 1 && Int(indice)! <= listaExamenes.count {
            lbResultado.text = listaExamenes[Int(indice)! - 1].toString()
        }else{
            lbResultado.text = "Error en el indice"
            
        }
        
    }
    
    

    //Implementamos la funcion del protocolo
    func obtener(dato: Examen) {
        listaExamenes.append(dato)//Q añade el examen q recibimos a la lista
    }
    
    //Implementamos el prepare para
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "CREAR" {
            let destino = segue.destination as! CrearExamenViewController
            destino.delegate = self
        }
    }
    
}


//
//  ModificarViewController.swift
//  AlumnoVersion2
//
//  Created by Anna Ruiz on 09/11/2023.
//

import UIKit

class ModificarViewController: UIViewController {


    @IBOutlet weak var txtNumPreguntas: UITextField!
    @IBOutlet weak var txtNumAciertos: UITextField!
    @IBOutlet weak var txtNombre: UITextField!
    
    var examen: Examen!
    var posicion: Int!
    var delegate: ObtenerExamen!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        //CArgamos la info del objeto
        txtNombre.text = examen.nombre
        txtNumPreguntas.text = String(examen.totalPreguntas)
        txtNumAciertos.text = String(examen.totalAcertadas)
    }
    

    @IBAction func btnModificar(_ sender: Any) {
        delegate.eliminar(posicion: posicion)
        self.dismiss(animated: true, completion: nil)
        
    }
    @IBAction func btnEliminar(_ sender: Any) {
        let nuevoExamen = Examen(nombre: txtNombre.text!, totalPreguntas: Int(txtNumPreguntas.text!)!, totalAcertadas: Int(txtNumAciertos.text!)!)
        
        delegate.modificar(posicion: posicion, nuevoExamen: nuevoExamen)
        
        self.dismiss(animated: true, completion: nil)
    }
  

}

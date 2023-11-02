//
//  CrearExamenViewController.swift
//  AlumnoVersion2
//
//  Created by Anna Ruiz on 02/11/2023.
//

import UIKit

class CrearExamenViewController: UIViewController {

    @IBOutlet weak var txtNombre: UITextField!
    
    @IBOutlet weak var txtTotalAcertadas: UITextField!
    @IBOutlet weak var txtTotalPreguntas: UITextField!
    var delegate: ObtenerExamen? //Sirve para saber q ventana es la q va a recibir la info
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    

    @IBAction func btnCrearExamen(_ sender: Any) {
        //recuperamos la info de las casillas
        let nombre = txtNombre.text!
        let totalP = txtTotalPreguntas.text!
        let totalA = txtTotalAcertadas.text!
        
        if nombre.isEmpty || totalP.isEmpty || totalA.isEmpty{
            //ventana de aviso
            let alert = UIAlertController(title: "Error", message: "Faltan datos", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Ok", style: .destructive, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }else{
            //si es correcta creamos un obj examen
            let examen = Examen(nombre: nombre, totalPreguntas: Int(totalP)!, totalAcertadas: Int(totalA)!)
            //y lo devolvemos
            delegate?.obtener(dato: examen)
            self.dismiss(animated: true, completion: nil)
        }
        
        
        
    }
    

}

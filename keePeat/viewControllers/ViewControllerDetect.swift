//
//  ViewControllerDetect.swift
//  keePeat
//
//  Created by Irene Truchado Mazzoli on 06/01/22.
//

import UIKit
import CoreML

class ViewControllerDetect: UIViewController, UIImagePickerControllerDelegate & UINavigationControllerDelegate {

    @IBOutlet weak var imgViewFoto: UIImageView!
    
    @IBOutlet weak var btnProcess: UIButton!

    @IBOutlet weak var btnDelete: UIButton!

    @IBOutlet weak var view1: UIView!
    @IBOutlet weak var view2: UIView!

    var classification: String!
    var probability: String = "0"

    override func viewDidLoad() {
        super.viewDidLoad()

        // deshabilitamos el botón de procesar
        btnProcess.isOpaque = true
        btnProcess.isEnabled = false

        // inicializar las vistas
        view1.alpha = 1 // info visible
        view2.alpha = 0 // foto no visible
    }
    
    // metodo para subir una foto
    @IBAction func uploadPhoto(_ sender: UIButton) {
        let prompt = UIAlertController(title: "Sube tu imagen",
                                       message: "",
                                       preferredStyle: .actionSheet)

        let picker = UIImagePickerController()
        picker.delegate = self

        
        let camerAction = UIAlertAction(title: "Cámara", style: .default) { _ in
            guard UIImagePickerController.isSourceTypeAvailable(UIImagePickerController.SourceType.camera) else {
                let alert = UIAlertController(title: "Error", message: "Cámara no detectada en este dispositivo", preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
                self.present(alert, animated: true, completion: nil)
                return
          }
          picker.sourceType = .camera
          picker.allowsEditing = true
          self.present(picker, animated: true)
        }

        let libraryAction = UIAlertAction(title: "Librería", style: .default) { _ in
          picker.sourceType = .photoLibrary
          picker.allowsEditing = true
          self.present(picker, animated: true)
        }

        let cancelAction = UIAlertAction(title: "Cancelar",
                                         style: .cancel,
                                         handler: nil)

        prompt.addAction(camerAction)
        prompt.addAction(libraryAction)
        prompt.addAction(cancelAction)

        present(prompt, animated: true) {
          // Prevent closing the prompt by touch up outside the prompt.
          prompt.view.superview?.subviews[0].isUserInteractionEnabled = false
        }
    }
    
    // hace algo con la imagen elegida por el usuario
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
        // es responsabilidad del delegado quitar la vista del Picker Controller
        picker.dismiss(animated: true, completion: nil)
        guard let image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage else {
            return
        }
        
        // carga la imagen en la vista
        imgViewFoto.image = image
        
        // guarda la imagen en la base de datos
        if let pngRepresentation = image.pngData() {
                UserDefaults.standard.set(pngRepresentation, forKey: "img")
        }
        
        // permitimos pulsar el boton de procesar
        btnProcess.isOpaque = false
        btnProcess.isEnabled = true
        
        // cambiamos las vistas
        view1.alpha = 0 // info no visible
        view2.alpha = 1 // foto visible
    }
    
    // hace algo si el usuario cancela el subir la foto
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        
        // es responsabilidad del programa quitar la vista del picker controller
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func deletePhoto(_ sender: UIButton) {
        imgViewFoto.image = nil
        
        // ya no permitimos pulsar el botón de procesar
        btnProcess.isOpaque = true
        btnProcess.isEnabled = false
        
        // inicializar las vistas
        view1.alpha = 1 // info visible
        view2.alpha = 0 // foto no visible
    }
    
    
    @IBAction func analyzePhoto(_ sender: UIButton) {
        guard let buffer = imgViewFoto.image?.resize(size: CGSize(width: 224, height: 224))?
                .getCVPixelBuffer() else {
            return
        }

        do {
            let config = MLModelConfiguration()
            let model = try turberaClasificador(configuration: config)
            let input = turberaClasificadorInput(image: buffer)

            let output = try model.prediction(input: input)
            
            classification = output.classLabel
            probability = String(format: "%.0f", output.classLabelProbs["turbera"]!*100)
            
        }
        catch {
            print(error.localizedDescription)
        }

    }
    
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        let viewResults = segue.destination as! ViewControllerResults
        
        // Pass the selected object to the new view controller.
        viewResults.classified = classification
        viewResults.probability = probability
    }
}

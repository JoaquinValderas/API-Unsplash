//
//  showPhoto.swift
//  JoaquinCustodio
//
//  Created by Joaquin Custodio  on 22/2/22.
//

import UIKit

class showPhoto:UIViewController {
    
    // UIElements
    @IBOutlet weak var imageViewPhoto: UIImageView!
    @IBOutlet weak var lblUsername: UILabel!
    @IBOutlet weak var lblLikes: UILabel!
    @IBOutlet weak var imagenPerfil: UIImageView!
    @IBOutlet weak var atras: UIButton!
    
    // Variables que recibiran la información del SecondViewController
    var regular:String = ""
    var medium:String = ""
    var username:String = ""
    var likes:Int = 0
   
    override func viewDidLoad() {

        //Diseño de la imagen
        imageViewPhoto.contentMode = .scaleAspectFill
        imagenPerfil.contentMode = .scaleAspectFill
        imageViewPhoto.layer.cornerRadius = 10
        imagenPerfil.roundedImage()
        // Convertir un Int a una String
        let str:String = String(describing: likes)
  
        // Convertir url a imagen
        var photo = UIImage()
        let url = URL(string:regular)
        if let data = try? Data(contentsOf: url!){
            let image: UIImage = UIImage(data: data)!
            photo = image
        }
        var photoProfile = UIImage()
        let urlMedium = URL(string: medium)
        if let dataMedium = try? Data(contentsOf:urlMedium!){
            let imageprofile: UIImage = UIImage(data: dataMedium)!
            photoProfile = imageprofile
        }
        
        //Asignar valores a las labels
        lblUsername.text = username
        lblLikes.text = str
        imageViewPhoto.image = photo
        imagenPerfil.image = photoProfile
    }
   
    // Volver atrás
    @IBAction func pressReturn(_ sender: Any) {
        // Cambiar color de la letra al clickar
        atras.tintColor = .black
        //Volver
        self.dismiss(animated: true, completion: nil)
    }
}

// Diseño del la imagen
extension UIImageView{
    func roundedImage(){
        self.layer.cornerRadius = self.frame.size.width / 2.1
        self.layer.borderColor = UIColor.darkGray.cgColor
        self.layer.masksToBounds = true
        self.layer.borderWidth = 1.2
    }
}

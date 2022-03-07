
//import Foundation
//import UIKit
//
////
//// Usamos Decodable para recivir datos en JSON
//// Usamos Identifiable para poder mostrarlo en una lista o iterar
////
//
//struct StructGallery: Decodable {
//    let id:String
//    let created_at:String
//}
//
//class UnsplashData: ObservableObject {
//    
//    
//    // Published sireve para cada vez que haya una actualización
//    // la varibale gallery cambie en el interface del usuario
//    @Published var gallery:[StructGallery] = []
//    
//    init(){
//        loadData()
//    }
//    
//    func loadData(){
//        // Creamos una costante y le asignamos la key que nos da unsplash
//        let key = "Oxx_KOPbF4idC_UsYaq72O9SQOzAs8S9NfClVKn022E"
//        // La constante url es la llamada a la API, donde le estmaos diciendo que busque fotos de flowers
//        // y que nos decargue un máximo de 30 fotos y le pasaremos nuestra key
//        let url = "https://api.unsplash.com/search/photos/random/?query=flowers&count=30&client_id=\(key)"
//        // Accedemos a los datos
//        let session = URLSession(configuration: .default)
//        
//        session.dataTask(with: URL(string:url)!){ (data, response, error) in
//            guard let data = data else{
//                print("Error en dataTask")
//                return
//            }
//            // Recibir datos del JSON y descodificar
//            do{
//                let JSON = try JSONDecoder().decode([StructGallery].self, from: data)
//                print(JSON)
//                //Añadimos las fotos recibidas a la array gallery
//                for photo in JSON{
//                    DispatchQueue.main.async {
//                        self.gallery.append(photo)
//                    }
//                }
//            }catch{
//                print(String(describing: error))
//                print("--------------------")
//                print(error.localizedDescription)
//            }
//        }.resume() // Ejecutara todo el código, sin el no se realiza la petición
//    }
//}

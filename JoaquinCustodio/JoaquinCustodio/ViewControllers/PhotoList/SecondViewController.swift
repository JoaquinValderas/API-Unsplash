//
//  secondViewController.swift
//  JoaquinCustodio
//
//  Created by Joaquin Custodio  on 15/2/22.
//

import UIKit

class SecondViewController: UIViewController{
  
    @Published var results = [Results]()
    
    var current_page: Int = 1
    var total_pages:Int = 30
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        Setup()
        fetchData(page: current_page)
    }
    
    func Setup(){
        collectionView.dataSource = self
        collectionView.delegate = self
        
        collectionView.backgroundColor = .clear
    }
    
    // Petición a la API
    func fetchData(page:Int){
        let mypage = String(current_page)
        // Creamos una costante y le asignamos la key que nos da unsplash
        let key = "Oxx_KOPbF4idC_UsYaq72O9SQOzAs8S9NfClVKn022E"
        // La constante url es la llamada a la API, donde le estmaos diciendo que busque fotos de flowers
        let url = "https://api.unsplash.com/search/photos/?page=\(mypage)&per_page=50&&query=flowers&client_id=\(key)"
        let URL = URL(string: url)

        guard URL != nil else {
            print("Error with the url")
            return
        }
        
        let urlSession = URLSession.shared
        urlSession.dataTask(with: URL!) { data, response, error in
            
            if error == nil && data != nil {
                let decoder = JSONDecoder()
                
                do{
                    let JSON = try decoder.decode(Unknown.self,from: data!)
                    self.results.append(contentsOf: JSON.results)
                }catch{
                    print("Error jsson", error)
                }
                
                DispatchQueue.main.async {
                    self.collectionView.reloadData()
                }
            }
        }.resume()
    }
    
    // Scorll vertifcal infinito, recarga las imagenes
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath){
        if current_page < total_pages && indexPath.row == results.count - 1{
            current_page += 1
            fetchData(page: current_page)
        }
    }
}

//MARK: Funciones de la CollectionView


extension SecondViewController: UICollectionViewDataSource, UICollectionViewDelegate{
            
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return results.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "customCell", for: indexPath) as?
        CustomCollectionViewCell {

        // Insertar imagen en la cell
        let link = results[indexPath.row].urls.regular
        cell.imageView.downloaded(from: link!)
        
        //Diseño imagen
        cell.layer.cornerRadius = 15
        cell.clipsToBounds = true
        cell.imageView.contentMode = .scaleAspectFill
        
        return cell
        }
    return UICollectionViewCell()
    }
    
    // Pasa la información al otro viewController
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath){
        let mainSotoryboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = mainSotoryboard.instantiateViewController(withIdentifier: "IDshowPhoto") as! showPhoto
        vc.username = results[indexPath.row].user.username!
        vc.regular = results[indexPath.row].urls.regular!
        vc.likes = results[indexPath.row].likes!
        vc.medium = results[indexPath.row].user.profile_image.medium!

        self.present(vc, animated: true, completion: nil)
    }
}

//MARK: Función para cargar una Imagen des de un link

extension UIImageView {
    func downloaded(from url: URL, contentMode mode: ContentMode = .scaleAspectFit) {
        contentMode = mode
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard
                let httpURLResponse = response as? HTTPURLResponse, httpURLResponse.statusCode == 200,
                let mimeType = response?.mimeType, mimeType.hasPrefix("image"),
                let data = data, error == nil,
                let image = UIImage(data: data)
                else { return }
            DispatchQueue.main.async() { [weak self] in
                self?.image = image
            }
        }.resume()
    }
    func downloaded(from link: String, contentMode mode: ContentMode = .scaleAspectFit) {
        guard let url = URL(string: link) else { return }
        downloaded(from: url, contentMode: mode)
    }
}
    
    

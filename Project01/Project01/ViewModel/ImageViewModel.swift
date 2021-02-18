//
//  ImageViewModel.swift
//  Project01
//
//  Created by meister on 2021/02/18.
//

import SwiftUI

class ImageViewModel: ObservableObject {
    @Published var images: [ImageModel] = []
    
    init() {
        fetchData()
    }
    
    func fetchData() {
        let key = "AIToJUk7L86F5FA7OCZa3-UAlUn35h15lsOgQUl1GmY"
        let url = "https://api.unsplash.com/photos/random/?count=10&client_id=\(key)"
        
        let session = URLSession(configuration: .default)
        
        session.dataTask(with: URL(string: url)!) { data, res, _ in
            guard let data = data else { return }
            
            let response = res as! HTTPURLResponse
            
            if response.statusCode == 404 {
                print("API Error")
            }
            
            do {
                
                let decodeData = try JSONDecoder().decode([ImageModel].self, from: data)
                
                DispatchQueue.main.async {
                    self.images = decodeData
                }
                
            } catch {
                
                print(error.localizedDescription)
            }
        }
        .resume()
    }
}

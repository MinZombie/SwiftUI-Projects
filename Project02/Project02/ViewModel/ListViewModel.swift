
import SwiftUI
import CoreData

class ListViewModel: ObservableObject {
    
    // MARK: - PROPERTIES
    
    @Published var pokemonList: [Pokemon] = []
    let url = URL(string: "https://pokeapi.co/api/v2/pokemon?limit=151")
    
    
    // MARK: - SAVE JSON TO CORE DATA
    
    func saveData(context: NSManagedObjectContext) {
        
        pokemonList.forEach { data in
            
            let entity = ListCoreData(context: context)
            entity.name = data.name
            entity.url = data.url
        }
        
        do {
            
            try context.save()
            
        } catch {
            
            print(error.localizedDescription)
        }
    }
    
    // MARK: - FETCH DATA FROM JSON
    
    func fetchData(context: NSManagedObjectContext) {
        
        let session = URLSession(configuration: .default)
        
        session.dataTask(with: url!) { data, res, _ in
            
            guard let data = data else { return }
            
            let response = res as! HTTPURLResponse
            if response.statusCode == 404 {
                print("API Error")
            }
            
            do {
                
                let decodeData = try JSONDecoder().decode(List.self, from: data)
                
                DispatchQueue.main.async {
                    self.pokemonList = decodeData.results
                    self.saveData(context: context)
                }
                
            } catch {
                
                print(error.localizedDescription)
            }
        }
        .resume()
    }

}

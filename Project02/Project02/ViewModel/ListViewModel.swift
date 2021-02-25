
import SwiftUI

class ListViewModel: ObservableObject {
    
    // MARK: - PROPERTIES
    
    @Published var pokemonList: [Pokemon] = []
    let url = URL(string: "https://pokeapi.co/api/v2/pokemon?limit=10")
    
    init() {
        fetchData()
    }
    
    // MARK: - FETCH DATA FUNCTION
    
    func fetchData() {
        
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
                }
                print("List View Model")
                
            } catch {
                
                print(error.localizedDescription)
            }
        }
        .resume()
    }
    
    deinit {
        print("deinit ListViewModel")
    }
}

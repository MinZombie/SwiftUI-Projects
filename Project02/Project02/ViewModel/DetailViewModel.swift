import SwiftUI

class DetailViewModel: ObservableObject {
    
    // MARK: - PROPERTIES
    @Published var detailPokemon: Detail = Detail(sprites: Other(other: OfficialArtwork(officialArtwork: FrontDefault(frontDefault: ""))), stats: [Stat](),  types: [Type](), weight: 0, height: 0)
    
    // MARK: - FETCH DATA DETAIL
    
    
    
    func fetchData(url: String) {
        
        let session = URLSession(configuration: .default)
        
        session.dataTask(with: URL(string: url)!) { data, res, _ in
            
            guard let data = data else { return }
            
            let response = res as! HTTPURLResponse
            
            if response.statusCode == 404 {
                
                print("API Error")
            }
            
            do {
                
                let decodeData = try JSONDecoder().decode(Detail.self, from: data)
                
                DispatchQueue.main.async {
                    self.detailPokemon = decodeData
                }
            } catch {
                
                print(error.localizedDescription)
                
            }
        }
        .resume()
    }
    
    func typeTextBackground(type: String) -> Color {
        switch type {
        case "grass" : return Color(#colorLiteral(red: 0.471265614, green: 0.784588635, blue: 0.3150882423, alpha: 1))
        case "poison" : return Color(#colorLiteral(red: 0.6261323094, green: 0.2494845986, blue: 0.6272977591, alpha: 1))
        case "fire" : return Color(#colorLiteral(red: 0.9428585768, green: 0.5012893677, blue: 0.1904644072, alpha: 1))
        case "flying" : return Color(#colorLiteral(red: 0.6588853002, green: 0.5630264282, blue: 0.9427680373, alpha: 1))
        case "water" : return Color(#colorLiteral(red: 0.4084630311, green: 0.5657778978, blue: 0.9425247312, alpha: 1))
        case "bug" : return Color(#colorLiteral(red: 0.6581466794, green: 0.7204855084, blue: 0.1236475185, alpha: 1))
        case "normal" : return Color(#colorLiteral(red: 0.6589974761, green: 0.6586616039, blue: 0.4707189202, alpha: 1))
        case "electric" : return Color(#colorLiteral(red: 0.973626554, green: 0.8168898225, blue: 0.1849175394, alpha: 1))
        case "ground" : return Color(#colorLiteral(red: 0.8799741268, green: 0.7515483499, blue: 0.4084975123, alpha: 1))
        case "fairy" : return Color(#colorLiteral(red: 0.9342713952, green: 0.5987599492, blue: 0.6726956964, alpha: 1))
        case "fighting" : return Color(#colorLiteral(red: 0.7532711029, green: 0.1878149509, blue: 0.1549391747, alpha: 1))
        case "phychic" : return Color(#colorLiteral(red: 0.971283257, green: 0.3446650505, blue: 0.5333607197, alpha: 1))
        case "rock" : return Color(#colorLiteral(red: 0.7233570218, green: 0.6271917224, blue: 0.2194005847, alpha: 1))
        case "steel" : return Color(#colorLiteral(red: 0.7201581001, green: 0.7230183482, blue: 0.8168042898, alpha: 1))
        case "ice" : return Color(#colorLiteral(red: 0.595136106, green: 0.848013103, blue: 0.8483485579, alpha: 1))
        case "ghost" : return Color(#colorLiteral(red: 0.4409302771, green: 0.3463557959, blue: 0.5947214961, alpha: 1))
        case "dragon" : return Color(#colorLiteral(red: 0.4396144748, green: 0.2190206647, blue: 0.9715978503, alpha: 1))
        default : return Color(#colorLiteral(red: 0.4396144748, green: 0.2190206647, blue: 0.9715978503, alpha: 1))
        }
    }
    
}

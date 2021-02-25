
import SwiftUI

struct Home: View {
    // MARK: - PROPERTIES
    @StateObject var listData = ListViewModel()
    
    var columns = Array(repeating: GridItem(.flexible()), count: 5)
    
    // MARK: - BODY
    var body: some View {
        NavigationView {
            
//            if pokemonlist.isEmpty {
//                Spacer()
//                ProgressView()
//                Spacer()
//            } else {
                ScrollView {
                    LazyVGrid(columns: columns) {
                        ForEach(0..<listData.pokemonList.count, id: \.self) { index in
                            NavigationLink(destination: DetailView(pokemonData: listData.pokemonList[index])) {
                                
                                Image("\(index + 1)")
                                    .resizable()
                                    .aspectRatio(1/1, contentMode: .fit)
                                    .shadow(color: Color.black.opacity(0.5), radius: 10, x: 0, y: 0)

                            }
                            .navigationTitle("Pokedex")
                            .navigationBarTitleDisplayMode(.inline)
                        }
                    }
                }
                .background(Color(#colorLiteral(red: 0.8902376294, green: 0.8797798753, blue: 1, alpha: 1)))
                .edgesIgnoringSafeArea(.bottom)
//            }
        }
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}

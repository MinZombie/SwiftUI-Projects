
import SwiftUI

struct Home: View {
    // MARK: - PROPERTIES
    @StateObject var listData = ListViewModel()
    @Environment(\.managedObjectContext) var context
    @FetchRequest(entity: ListCoreData.entity(), sortDescriptors: [NSSortDescriptor(keyPath: \ListCoreData.name, ascending: true)]) var results: FetchedResults<ListCoreData>
    
    var columns = Array(repeating: GridItem(.flexible()), count: 5)
    
    // MARK: - BODY
    var body: some View {
        
            
            VStack {
                
                if results.isEmpty {
                    if listData.pokemonList.isEmpty {
                        
                        ProgressView()
                            .onAppear {
                                listData.fetchData(context: context)
                            }
                        
                    } else {
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
                    }
                }
                else {
                    
                    ScrollView {
                        LazyVGrid(columns: columns) {
                            ForEach(0..<results.count, id: \.self) { index in
                                NavigationLink(destination: DetailView(fetchedCoreData: results[index])) {
                                    
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
                    
                }
            }
        
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}

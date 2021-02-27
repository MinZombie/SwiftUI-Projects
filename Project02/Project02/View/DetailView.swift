// TO DO : Swipe back gesture, Redesign(image position, text, background color(gradient) ...), stats animation

import SwiftUI
import SDWebImageSwiftUI

struct DetailView: View {
    // MARK: - PROPERTIES
    @StateObject var detailData = DetailViewModel()
    
    var pokemonData: Pokemon?
    var fetchedCoreData: ListCoreData?
    let screen = UIScreen.main.bounds

    // MARK: - BODY
    var body: some View {
        
            ZStack {

                VStack {
                    Spacer()
                    self.image
                    
                    self.pokemonDescription
                    Spacer()
                    Spacer()
                }
            }
            .padding(.horizontal)
            .background(detailData.detailPokemon.types.isEmpty ? Color.black : detailData.typeTextBackground(type: detailData.detailPokemon.types[0].type.name))
            .edgesIgnoringSafeArea(.all)

        
        .onAppear {
            detailData.fetchData(url: pokemonData == nil ? fetchedCoreData!.url! : pokemonData!.url)
        }
    }
    
    // Image
    var image: some View {
        
            WebImage(url: URL(string: detailData.detailPokemon.sprites.other.officialArtwork.frontDefault))
                .resizable()
                .scaledToFit()
                .frame(width: screen.width / 2, height: screen.height / 4)
                .offset(x: 0, y: 40)
                .zIndex(2)
    }
    
    // Description
    var pokemonDescription: some View {
        VStack(spacing: 24) {
            Text("\(pokemonData == nil ? fetchedCoreData!.name! : pokemonData!.name)")
                .font(.system(size: 40, weight: .semibold, design: .monospaced))

            HStack {
                
                // Weight
                VStack(spacing: 6) {
                    Text("\(detailData.detailPokemon.weight)")
                        .fontWeight(.bold)
                    Text("Weight")
                }
                Spacer()
                // Type
                
                // Types Image later
                ForEach(detailData.detailPokemon.types, id: \.type.name) { types in
                    HStack {
                        Text("\(types.type.name)")
                            .padding()
                            .background(detailData.typeTextBackground(type: types.type.name))
                            .cornerRadius(16)
                    }
                }
                
                Spacer()
                // Height
                VStack(spacing: 6) {
                    Text("\(detailData.detailPokemon.height)")
                        .fontWeight(.bold)
                    Text("Height")
                }
            }
            // Stats
            VStack{
                ForEach(detailData.detailPokemon.stats, id: \.stat.name) { stats in
                    HStack {
                        Text("\(stats.stat.name)")
                        Text("\(stats.baseStat)")
                    }
                }
            }
        }
        .padding()
        .background(Color.white)
        .cornerRadius(20)
    }
}



//struct DetailView_Previews: PreviewProvider {
//    static var previews: some View {
//        DetailView()
//    }
//}

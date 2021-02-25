
import SwiftUI

// MARK: - LIST MODEL
struct List: Decodable {
    var results: [Pokemon]
}

struct Pokemon: Decodable {
    var name: String
    var url: String
}

// MARK: - DETAIL MODEL
struct Detail: Decodable {
    var sprites: Other
    var stats: [Stat]
    var types: [Type]
    var weight: Int
    var height: Int
}

// Image
struct Other: Decodable {
    var other: OfficialArtwork
}

struct OfficialArtwork: Decodable {
    var officialArtwork: FrontDefault

    enum CodingKeys: String, CodingKey {
        case officialArtwork = "official-artwork"
    }
}

struct FrontDefault: Decodable {
    var frontDefault: String
    
    enum CodingKeys: String, CodingKey {
        case frontDefault = "front_default"
    }
}

// STAT
struct Stat: Decodable {
    var baseStat: Int
    var stat: StatName
    
    enum CodingKeys: String, CodingKey {
        case baseStat = "base_stat"
        case stat
    }
}

struct StatName: Decodable {
    var name: String
}

// TYPE
struct Type: Decodable {
    var type: TypeName
}

struct TypeName: Decodable {
    var name: String
}

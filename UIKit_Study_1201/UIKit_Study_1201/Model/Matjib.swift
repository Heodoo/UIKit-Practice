import Foundation

struct Matjib : Decodable, Identifiable {
    var id : String
    var name : String
    var latitude : Double
    var longitude : Double
    var url : String
    var image : String
    var star : Double
}

var matjibs : [Matjib] = loadJson("matjib.json")



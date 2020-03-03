import UIKit

struct Root: Decodable {
    let newsCells: [NewsCellStruct]
}

struct NewsCellStruct: Decodable {
    var id: Int
    var title:String
    var image:String
    var text: String
    var date:String
}

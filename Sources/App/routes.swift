import Routing
import Vapor


/// Register your application's routes here.
///
/// [Learn More →](https://docs.vapor.codes/3.0/getting-started/structure/#routesswift)
public func routes(_ router: Router) throws {
    // Basic "Hello, world!" example
    router.get("hello") { req in
        return "Hello, world!"
    }
    
    router.get("hello","dhingra") { req in
        return "Hello, Dhingra!"
    }
    
    router.get("hello", String.parameter) { req -> String in
        let name = try req.parameters.next(String.self)
        return "Hello \(name)"
    }
    
//The method shown in video is deprecated, refer author's note below the video
    
    router.post(InfoData.self, at: "info/string") { req, data -> String in
        return "Hello \(data.name)!"
    }
    
    
    router.post(InfoData.self, at: "info/json") { req, data -> InfoResponse in
        return InfoResponse(request: data)
    }
    
//Challenge time!
    router.get("date") { req -> String in
        let date = Date()
        let formatter = DateFormatter()
        
        formatter.dateFormat="dd.MM.yyyy"
        let result = formatter.string(from: date)
        
        return result
    }
    
    router.get("counter", Int.parameter) { req -> CountJSON in
        let count = try req.parameters.next(Int.self)
        return CountJSON(count: count)
    }
    
}

    struct InfoData: Content {
        let name: String
    }

    struct InfoResponse : Content {
        let request: InfoData
    }

    struct CountJSON: Content {
        let count: Int
    }





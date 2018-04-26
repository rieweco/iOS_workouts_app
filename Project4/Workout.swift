
import Foundation

struct Workout {
    let id: UUID
    let name: String
    let date: Date
    let duration: Int
    let calories: Int
    let isHighIntensity: Bool
}

extension Workout {
    func toDictionary() -> JsonDictionary {
        return [
            "id": self.id.uuidString,
            "name": self.name,
            "date": self.date.timeIntervalSince1970,
            "duration": self.duration,
            "calories": self.calories,
            "intensity": self.isHighIntensity
        ]
    }
    
    static func createFrom(dict: JsonDictionary) -> Workout? {
        guard
            let idString = dict["id"] as? String,
            let id = UUID(uuidString: idString),
            let name = dict["name"] as? String,
            let timeInterval = dict["date"] as? TimeInterval,
            let duration = dict["duration"] as? Int,
            let calories = dict["calories"] as? Int,
            let isHighIntensity = dict["intensity"] as? Bool
        else {
            return nil
        }
        let date = Date(timeIntervalSince1970: timeInterval)
        return Workout(id: id, name: name, date: date, duration: duration, calories: calories, isHighIntensity: isHighIntensity)
    }
}

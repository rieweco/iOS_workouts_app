
import Foundation

protocol WorkoutListModelDelegate: class {
    func dataRefreshed()
}

protocol WorkoutListModelInterface {
    weak var delegate: WorkoutListModelDelegate? { get set }
    var count: Int { get }
    func workout(atIndex index: Int) -> Workout?
    func save(workout: Workout)
    func sort(with method: WorkoutSortOption)
}

enum WorkoutSortOption {
    case dateAscendingSort, dateDescendingSort, caloriesBurnedSort, durationSort
}

class WorkoutListModel: WorkoutListModelInterface {
    
    weak var delegate: WorkoutListModelDelegate?
    
    private var workouts = [Workout]()
    private let persistence: WorkoutPersistenceInterface?
    private var sortMethod: WorkoutSortOption
    
    init() {
        self.persistence = ApplicationSession.sharedInstance.persistence
        workouts = self.persistence?.savedWorkouts ?? []
        sortMethod = .dateDescendingSort
        delegate?.dataRefreshed()
    }
    
    var count: Int {
        return workouts.count
    }
    
    func workout(atIndex index: Int) -> Workout? {
        return workouts.element(at: index)
    }
    
    func save(workout: Workout) {
        workouts.append(workout)
        persistence?.save(workout: workout)
        delegate?.dataRefreshed()
    }
    
    func sort(with method: WorkoutSortOption) {
        self.sortMethod = method
        switch method {
        case .dateAscendingSort:
            workouts.sort { $0.date < $1.date }
        case .caloriesBurnedSort:
            workouts.sort { $0.calories > $1.calories }
        case .durationSort:
            workouts.sort { $0.duration > $1.duration }
        default:
            workouts.sort { $0.date > $1.date }
        }
        delegate?.dataRefreshed()
    }

    
}



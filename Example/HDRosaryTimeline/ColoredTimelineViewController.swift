import UIKit
import HDRosaryTimeline

class ColoredTimelineViewController: HDRosaryTimelineViewController {
    private let viewModel = MealData()
    
    init()
    {
        super.init(borderColor: .white,
                   backGroundColor: .black)
        self.title = "Invert color of the first."
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.dataSource = self.viewModel
    }

    override func isInvert(section: Int) -> Bool {
        return section == 0
    }
}

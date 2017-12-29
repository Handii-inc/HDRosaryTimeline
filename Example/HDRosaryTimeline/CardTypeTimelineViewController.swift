import UIKit
import HDRosaryTimeline

class CardTypeTimelineViewController : HDRosaryTimelineViewController {
    private let viewModel = MealData()
    
    init()
    {
        super.init(nibName: nil, bundle: nil)
        self.title = "Basic style."
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.dataSource = self.viewModel
    }
}

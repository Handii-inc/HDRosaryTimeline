import Foundation

class MiddleOfLastSection: CellPosition {
    required init()
    {
    }
    
    func cell(_ view: CellView) {
        view.layout(on: self)
    }
    
    func height(_ measure: CellViewSizeManager) -> CGFloat {
        return measure.height(of: self)
    }    
}

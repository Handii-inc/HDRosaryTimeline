import Foundation

class Bottom: SectionPosition, CellPosition {
    required init()
    {
    }
    
    func section(_ view: SectionView) {
        view.layout(on: self)
    }

    func cell(_ view: CellView) {
        view.layout(on: self)
    }
    
    func height(_ measure: CellViewSizeManager) -> CGFloat {
        return measure.height(of: self)
    }
}

import Foundation

protocol CellPosition: class {
    init()
    func cell(_ view: CellView)
    func height(_ measure: CellViewSizeManager) -> CGFloat
}

func createPosition(of indexPath: IndexPath, in data: HDRosaryTimelineViewDataSource) -> CellPosition?
{
    let numberOfSections = data.getNumberOfSections()
    if !(indexPath.section < numberOfSections) {
        return nil
    }

    let numberOfItems = data.getNumberOfItems(in: indexPath.section)
    if !(indexPath.row < numberOfItems) {
        return nil
    }
    
    if (indexPath.section == (numberOfSections - 1)) {
        if numberOfItems == 1 {
            return SingleOfLastSection()
        }
        
        return indexPath.row == 0
            ? TopOfLastSection()
            : indexPath.row == (numberOfItems - 1)
                ? BottomOfLastSection()
                : MiddleOfLastSection() as CellPosition
    }
    
    if numberOfItems == 1 {
        return Single()
    }
    
    return indexPath.row == 0
        ? Top()
        : indexPath.row == (numberOfItems - 1)
            ? Bottom()
            : Middle() as CellPosition
}


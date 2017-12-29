import Foundation

protocol SectionPosition: class {
    func section(_ view : SectionView)
}

func createPosition(of section: Int, in data: HDRosaryTimelineViewDataSource) -> SectionPosition?
{
    if !(section < data.getNumberOfSections()) {
        return nil
    }
    
    return section == 0
        ? Top()
        : (section == (data.getNumberOfSections() - 1))
        ? Bottom()
        : Middle() as SectionPosition
}

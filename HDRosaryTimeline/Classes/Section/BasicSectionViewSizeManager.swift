import Foundation

class BasicSectionViewSizeManager: SectionViewSizeManager {
    public var gapFromLeft: CGFloat { get { return 20 } }
    public var ratioOfDot: CGFloat { get { return 0.5 } }
    public var thickness: CGFloat { get { return 2 } }
    public var titleFontSize: CGFloat { get { return 13 } }
}

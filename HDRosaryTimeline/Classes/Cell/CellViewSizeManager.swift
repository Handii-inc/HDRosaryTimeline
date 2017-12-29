import Foundation

protocol CellViewSizeManager: class {
    var gapFromLeft: CGFloat { get }
    var gapFromRight: CGFloat { get }
    var gapFromLine: CGFloat { get }
    var gapFromSection: CGFloat { get }
    var gapFromLeftEdgeOfCard: CGFloat { get }
    var gapFromRightEdgeOfCard: CGFloat { get }
    var thickness: CGFloat { get }
    var fontSize: CGFloat { get }
    var detailFontSize: CGFloat { get }
    
    func height(of _ : Single) -> CGFloat
    func height(of _ : Top) -> CGFloat
    func height(of _ : Middle) -> CGFloat
    func height(of _ : Bottom) -> CGFloat
    func height(of _ : SingleOfLastSection) -> CGFloat
    func height(of _ : TopOfLastSection) -> CGFloat
    func height(of _ : MiddleOfLastSection) -> CGFloat
    func height(of _ : BottomOfLastSection) -> CGFloat
}

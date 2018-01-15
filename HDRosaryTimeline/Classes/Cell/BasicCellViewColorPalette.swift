import Foundation

class BasicCellViewColorPalette: CellViewColorPalette {
    private let backGroundColor: UIColor
    private let borderColor: UIColor
    private let cardColor: UIColor
    private let textColor: UIColor
    private let detailTextColor: UIColor
    
    init(backGroundColor: UIColor,
         borderColor: UIColor,
         cardColor: UIColor,
         textColor: UIColor,
         detailTextColor: UIColor)
    {
        self.backGroundColor = backGroundColor
        self.borderColor = borderColor
        self.cardColor = cardColor
        self.textColor = textColor
        self.detailTextColor = detailTextColor
    }
    
    //MARK:- CellViewColorPalette
    func coloring(cell: UIView) {
        cell.backgroundColor = self.backGroundColor
    }
    
    func coloring(textLabel: UILabel, with font: UIFont) {
        let attributes: [NSAttributedStringKey : Any] = [
            .foregroundColor : self.textColor,
            .font : font
        ]
        textLabel.attributedText = NSAttributedString(string: textLabel.text ?? "",
                                                      attributes: attributes)
        return
    }
    
    func coloring(detailTextLabel: UILabel, with font: UIFont) {
        let attributes: [NSAttributedStringKey : Any] = [
            .foregroundColor : self.detailTextColor,
            .font : font
        ]
        detailTextLabel.attributedText = NSAttributedString(string: detailTextLabel.text ?? "",
                                                            attributes: attributes)
        return
    }
    
    func coloring(line layer: CALayer) {
        layer.backgroundColor = self.borderColor.cgColor
        return
    }
    
    func coloring(card layer: CALayer) {
        layer.backgroundColor = self.cardColor.cgColor
        layer.borderColor = self.borderColor.cgColor
        return
    }
}

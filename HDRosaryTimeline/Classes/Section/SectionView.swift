import Foundation

protocol SectionView: class {
    func layout(on _ : Top)
    func layout(on _ : Middle)
    func layout(on _ : Bottom)
}

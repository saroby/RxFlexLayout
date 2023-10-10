# RxFlexLayout

```swift
dependencies: [
    .package(url: "https://github.com/saroby/RxFlexLayout", .branch(from: "main"))
]
```

## Usage

### Quick Start

```swift
import RxFlexLayout
import PinLayout
import RxSwift
import RxCocoa

class ViewController: UIViewController {

    let flexView = UIView()

    let label = UILabel()

    let textRelay = BehavierRelay<String?>(value: "RxFlexLayout")

    var disposeBag = DisposeBag()
        
    override func viewDidLoad() {
        super.viewDidLoad()

        view.addSubView(flexView)

        flexView.flex.define { flex in
            flex.addItem(label)
        }

        textRelay
            .bind(to: label.rx.text(layoutView: flexView, sizeToFit: true))
            .disposed(by: disposeBag)
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        self.layout()
    }

    private func layout() {
        self.flexView.pin.all()
        self.flexView.flex.layout()
    }

}
```

## License

RxFlexLayout is released under the MIT license. See LICENSE for details.

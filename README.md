# Placid iOS SDK

Generate on-brand social media images automatically with [Placid](https://placid.app).

## Requirements

- iOS 13.0

## Installation

### Swift Package Manager

To integrate the Placid SDK into your Xcode project using [Swift Package Manager](https://swift.org/package-manager/), specify it in the `dependencies` of your `Package.swift`:

```swift
// swift-tools-version:5.3
import PackageDescription
...
dependencies: [
    .package(url: "https://github.com/placidapp/placid-ios.git", .upToNextMajor(from: "0.0.9"))
]
...
```

:warning: The SDK has dependencies on binary frameworks, so you have to use a version higher than 5.3 of your Swift Tools 

### CocoaPods

To integrate Placid into your Xcode project using [CocoaPods](https://cocoapods.org), specify it in your `Podfile`:

```ruby
pod 'Placid'
```


### Carthage

To integrate Placid into your Xcode project using [Carthage](https://github.com/Carthage/Carthage), specify it in your `Cartfile`:

```ogdl
binary "https://raw.githubusercontent.com/placidapp/placid-ios/master/Placid.json"
```

### Manually

If you prefer to integrate Placid manually instead of using a Dependency Manager, [download the latest Placid.xcframwork](https://github.com/placid/ios-sdk/releases/latest/download/Placid.xcframework.zip) and add it to your project. 

## Usage

### Configuration

Configure the Placid SDK in your `AppDelegate` by providing the URL to your mobile templates package downloaded from the Placid Webapp.


```swift
func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
    do {
	    var debug = false    
	    #if DEBUG
	    debug = true
	    #endif
        
        try PlacidSDK.configure(withLicenseKey: "your-placid-license-key", templateURL: Bundle.main.url(forResource: "templates", withExtension: "placid"), debug: false)
    } catch {
        print(error.localizedDescription)
    }
}
```

### Retrieving Templates

Templates can be retrieved via their unique identifier (as found in the placid web app). If the template is not found, this method will return nil.

```swift
let template = PlacidSDK.template(withIdentifier: "template-identifier")
```

### Preload Templates

For faster rendering it is recommended to preload a template as soon as it is accessed.

```swift
template.preload()
```

### Modify data

Templates can be customized using their specific layers.

:warning: The same layer name as in the web-editor has to be used, otherwise the layer will be ignored. 

#### Text

```swift
let textLayer = template.textLayer(named: "title")
textLayer.text = "A new title"
textLayer.textColor = UIColor.red
```

#### Images

```swift
let image = UIImage(named: "avatar")!
let imageLayer = template.imageLayer(named: "img-title")
imageLayer.image = image
```

#### Rectangles

```swift
let rectangleLayer = template.rectangleLayer(named: "rect")
rectangleLayer.backgroundColor = UIColor.red
rectangleLayer.borderColor = UIColor.blue
```

#### Browser Frames

```swift
let browserFrameLayer = template.browserFrameLayer(named: "browser")
browserFrameLayer.url = browserURL
```

### General Properties

These properties are supported by all layer types.

```swift
let layer = template.textLayer(named: "title")
layer.isHidden = false
layer.origin = .zero
layer.size = CGSize(width: 100, height: 50)
```

The mobile SDK supports the same layers and properties as the [API](https://placid.app/docs/2.0/rest/layers). So have a look for the full set of supported functions and properties.

### Render Images
Once all data is added to the specific template, it can be rendered to a native image.

```swift
template.render(completion: { [weak self] image in
	// use the image here
})
```

Or via *async* function:

```swift
let image = await template.render()
```

## Support

For bug reports, please create a new Issue right here on Github. Otherwise have a look at our [Help section](https://placid.app/help)

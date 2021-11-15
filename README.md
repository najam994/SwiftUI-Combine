# SwiftUI-Combine

Repository is public, 
1) Just download it.
2) Open 'SwiftUICombine.xcodeproj' file into Xcode
3) Try to run it, wait for some time so that SPM can install dependencies.


Notes:
1) Network layer and ViewModels has intermediate layer named as 'Service', this service is being mocked in unit tests for testing of ViewModels.
2) Business Logic falls under ViewModels, so those runs actual code upon running unit tests.
3) To cause events on ViewModels, ViewControllers are also being mocked, so that we can mock user actions and gestures at user side.
4) Project itself is in UIKit but SwiftUI views are being used for user interface.
5) upon request a user architecture diagram can also be provided.
6) To see task distribution please check Projects section under same repo.
  

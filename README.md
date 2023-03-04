Create simple swipe button to do something.

![video_2023-03-04_15-53-44](https://user-images.githubusercontent.com/101868225/222897026-7a1db6b2-d916-4c64-823d-38fa16d396da.gif)

Installation
Add to pubspec.yaml:
    swipe_to_achieve: <last-version>

import:
    "import package:swipe_to_achieve/swipe_to_achieve.dart"

Add to your code:
    SwipeToAchieve(
          width: 150.0,
          title: 'Swipe to achievement',
          textStyle: const TextStyle(
            fontSize: 15.0,
            fontWeight: FontWeight.bold,
          ),
          achievedBackgroundColor: Colors.amber,
          startBackgroundColor: Colors.cyan,
          startCircleColor: Colors.redAccent,
          circleRadius: 100.0,
          achievedCircleColor: Colors.greenAccent,
          onWhenEnd: (v) => print('Uzbekistan'),
        ),

onWhenReverse is optional.
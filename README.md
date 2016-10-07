# Space Travel

![](http://i.imgur.com/VnpPsFO.jpg)

Your mission.. should you choose to accept it is to build an iOS app that simulates space travel.

These instructions won't be structured in a do this, do this next format. We're going to make this more like the realz worldz (not that show on MTV).

It's your choice how you organize your files.

Create an enum called `Speed` where it's Raw Value is of type `Double`. The Various cases and their respective raw values are as follows:

* none = 0
* slow = 50
* medium = 150
* fast = 1000
* lightSpeed = 1000000

Create an `init` function for this `Speed` enum where the name of the first argument in the `init` function is `spaceSpeed` of type `Double`. I recommend `switch`ing on the `spaceSpeed` parameter where the various cases represent rages. Hint: We want to assign a value to `self` within these various cases (the value being an instance of the enum).

* if speed falls between 0 -> 49, it should be `.none`
* if speed falls between 50 -> 149, `.slow`
* if speed falls between 150 -> 999, `.medium`
* if speed falls between 1000 -> 999999, `.fast`
* default case should be `.lightspeed`

Create a read-only computed property of type `Bool`. It returns `true` if `self` is traveling at `.lightSpeed`, every other case should return `false`.

Create a function called `isFaster(than:)` which takes in one parameter named `speed` of type `Speed` which returns a `Bool`. It should check to see if `self` (current instance of the `Speed` enum which would be calling on this function) is faster than the `Speed` instance passed into this function as an argument. Hint: `rawValue`.

---

Create an enum called `Weather`. It should just have the following cases:

* cold
* warm
* hot
* superDuperHot

---

Create another enum called `Planet`

It should be backed by an `Int` raw value.

The raw value for `mercury` should be 1, venus 2.. and so on.

The various cases are as follows:
* mercury
* venus
* earth
* mars
* jupiter
* saturn
* uranus
* neptune

This enum should have a read-only computed property called `hasLife` of type `Bool`. If the current instance is `.earth` or `.mars` it should return `true` and return `false` in every other scenario.

This enum should have another read-only computed property called `weather` of type `Weather`. If the current instance is `.earth` it should return back `.warm`. For all the other planets, you should google them and see what their temp. is and decide on those cases from your research.

---

# Space Ship Time!

Create a new class called `SpaceShip`. It should have the following stored properties:

`name` of type `String`  
`speed` of type `Speed` with a default value of `.none`  
`currentPlanet` of type `Planet`

It should have the following read-only computed property:  
`description` of type `String` which will return back a `String` value (any that you like!). Meaning, come up with a cool description to return back.

The `init` function should take in a `name` and `planet` and assign those values to the stored properties.

Create a function called `timeTravel()` which returns back a `Bool`. If the speed of the ship is travling at lightSpeed (hint: call on the camTimeTravel computed property on speed) then it should return `true`.

Create a function called `isFaster(than:)` which takes in one argument.


<a href='https://learn.co/lessons/TimeTravelLab' data-visibility='hidden'>View this lesson on Learn.co</a>

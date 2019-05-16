What has been done?

* Introduced constraints

The project was quite old and did not take into account notch devices so constraints helped with this.

* Changed cake list to be a uiviewcontroller rather than a uitableviewcontroller

The table in a tableviewcontroller pinned automatically to the superview which was a problem with newer notch devices
note: to retain the pull to refresh of the original code I had to add this in my UIViewController subclass as it's not
available in Interface Builder

* Renamed classes to reflect my understanding of the project - e.g. CakeListViewController as opposed to MasterViewController

* Introduced contracts for the view and the view model

The project is now MVVM with a contract for both the view (CakeListViewController) and the View Model (CakeListViewModel)

* Added a mock view and tested the communication between the view model and the view

Tests that the view is called in the correct manner

* Added tests to test the cake model

Testing that a Cake can be instantiated correctly.

* Added mock data for testing

used a copy of the remote data for testing which can be changed as necessary and does not rely on an asynchronous call.

* Fixed initial crash bug

The cell identifier was being referenced incorrectly.

* Added a default cake image for neatness

When images dont load from the given URL instead of a blank square a default icon is shown.

* Constrained the cell height for neatness

Originally the rows of the table were of mixed height and this made the Cake List look too odd for comfort.

--8<--- ORIGINAL TEXT --->8--

Coding Test (fictitious)


***
NOTE: PLEASE DO NOT USE THIRD PARTY LIBRARIES. However, feel free to state which third party libraries you might have used.
***

Here you'll find the code for a simple mobile app to browse cakes. 

Unfortunately, the developer who wrote this code is no longer employed by the company as we had some concerns over his ability. 

The project compiles but the app crashes as soon as it runs. The app loads a JSON feed containing a repeated list of cakes, with title, image and description from a URL, then displays the contents of the feed in a scrollable list. 

We would like you to fix the crash bug, ensure the functionality of the app works as expected (all images display correctly on the table, all text is readable) and performs smoothly (ideally, this should be done without third party libraries). You should also refactor, optimise and improve the code where appropriate to use platform best practises. 

Please note that we are not looking for perfection, but rather for a clean and pragmatic solution. This should include refactoring but shouldn’t be over engineered. The test can be completed in 2-3 hours; howerever, this is a not a limit. Feel free to spend more time on it if you wish.

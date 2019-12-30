using Toybox.WatchUi;
using Toybox.Graphics;
using Toybox.System;
using Toybox.Lang;
using Toybox.Application;
using Toybox.Time.Gregorian;

class MainView extends WatchUi.WatchFace {

	private var lowPowerConfigured = false; 
	private var lowPower = false; 

    function initialize() {
        WatchFace.initialize();
//        
//        var logoLayer = new DateTimeLayer({:locX => 0, :locY => 0});
//        addLayer(logoLayer);
    }

    // Load your resources here
    function onLayout(dc) {
        setLayout(Rez.Layouts.WatchFace(dc));
    }

    // Called when this View is brought to the foreground. Restore
    // the state of this View and prepare it to be shown. This includes
    // loading resources into memory.
    function onShow() {
    }

    // Update the view
    function onUpdate(dc) {
    	if (lowPower && !lowPowerConfigured) {
        	setLayout(Rez.Layouts.WatchFaceLowPower(dc));
    		lowPowerConfigured = true;
    	} else if (!lowPower && lowPowerConfigured) {
        	setLayout(Rez.Layouts.WatchFace(dc));
    		lowPowerConfigured = false;
    	}
        // Get the current time and format it correctly
//        var timeFormat = "$1$:$2$:$3$";
//        var clockTime = System.getClockTime();
//        var hours = clockTime.hour;
//        if (!System.getDeviceSettings().is24Hour) {
//            if (hours > 12) {
//                hours = hours - 12;
//            }
//        } else {
//            if (Application.getApp().getProperty("UseMilitaryFormat")) {
//                timeFormat = "$1$$2$";
//                hours = hours.format("%02d");
//            }
//        }
//        
//        var timeString = Lang.format("$1$:$2$", [hours, clockTime.min.format("%02d")]);
//        var secondsString = Lang.format("$1$", []);

        // Update the view
        var now = Gregorian.info(Time.now(), Time.FORMAT_SHORT);
        var nowMed = Gregorian.info(Time.now(), Time.FORMAT_MEDIUM);
        
        View.findDrawableById("WeekdayLabel").setText(nowMed.day_of_week);
        View.findDrawableById("DateLabel").setText(
        	Lang.format("$1$-$2$-$3$",
        		[
        			now.day.format("%02d"),
        			now.month.format("%02d"),
        			now.year.format("%d"),
    			]
			)
        );
        View.findDrawableById("TimeLabel").setText(Lang.format("$1$:$2$", [now.hour.format("%02d"), now.min.format("%02d")]));
        var secondsLabel = View.findDrawableById("SecondsLabel");
        if (secondsLabel) {
        	secondsLabel.setText(now.sec.format("%02d"));
        }
        
        // view.setColor(Application.getApp().getProperty("ForegroundColor"));
//        view.setX(200);

//		dc.drawText(0, 0, Graphics.FONT_MEDIUM, "TheMakers", Graphics.TEXT_JUSTIFY_LEFT);
//		var TheMakersLogo = new Rez.Drawables.TheMakersLogo();
//    	TheMakersLogo.draw( dc );
    	
        // Call the parent onUpdate function to redraw the layout
        View.onUpdate(dc);
    }

    // Called when this View is removed from the screen. Save the
    // state of this View here. This includes freeing resources from
    // memory.
    function onHide() {
    }

    // The user has just looked at their watch. Timers and animations may be started here.
    function onExitSleep() {
        // setLayout(Rez.Layouts.WatchFace(dc));
        
        lowPower = false;
    }

    // Terminate any active timers and prepare for slow updates.
    function onEnterSleep() {
        // setLayout(Rez.Layouts.WatchFaceLowPower(dc));
        lowPower = true;
    }

}

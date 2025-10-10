module automatic_bike::automatic_bike {
    use std::string::String;

    public struct AutomaticBike has key, store{
        start_bike: bool,
        curent_gear: u8,
        accelerate: u8,
    }

    public fun new_bike(): AutomaticBike {
        AutomaticBike {
            start_bike: false,
            curent_gear: 1,
            accelerate: 0,
        }
    }

    public fun turn_on_bike(auto_bike: &mut AutomaticBike) {
        if(!auto_bike.start_bike) {
            auto_bike.start_bike = true;
        };
        true;
    }

    public fun turn_off_bike(auto_bike: &mut AutomaticBike) {
        auto_bike.start_bike = false;
    }
}

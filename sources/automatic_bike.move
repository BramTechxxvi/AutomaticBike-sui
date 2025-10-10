module automatic_bike::automatic_bike {
    use std::string::String;

    public struct AutomaticBike has key, store{
        is_on: bool,
        curent_gear: u8,
        accelerate: u8,
    }

    public fun new_bike(): AutomaticBike {
        AutomaticBike {
            is_on: false,
            curent_gear: 0,
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

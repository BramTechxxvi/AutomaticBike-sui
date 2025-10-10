module automatic_bike::automatic_bike {
    use std::string::String;

    public struct AutomaticBike has key, store{
        is_on: bool,
        current_gear: u8,
        accelerate: u8,
    }

    public fun new_bike(): AutomaticBike {
        AutomaticBike {
            is_on: false,
            current_gear: 0,
            accelerate: 0,
        }
    }

    public fun turn_on_bike(auto_bike: &mut AutomaticBike) {
        if(!auto_bike.is_on) {
            auto_bike.is_on = true;
            auto_bike.current_gear = 1;
        };
    }

    public fun turn_off_bike(auto_bike: &mut AutomaticBike) {
        auto_bike.is_on = false;
        auto_bike.accelerate = 0;
        auto_bike.current_gear = 0;
    }
}

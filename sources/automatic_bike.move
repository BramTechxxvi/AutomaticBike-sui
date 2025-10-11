module automatic_bike::automatic_bike {
    use std::string::String;

    public struct AutomaticBike has key, store{
        switch_on: bool,
        current_gear: u8,
        accelerate: u8,
    }

    public fun new_bike(): AutomaticBike {
        AutomaticBike {
            switch_on: false,
            current_gear: 0,
            accelerate: 0,
        }
    }

    public fun turn_on_bike(auto_bike: &mut AutomaticBike) {
        if(!auto_bike.switch_on) {
            auto_bike.is_on = true;
            auto_bike.current_gear = 1;
        };
        true
    }

    public fun turn_off_bike(auto_bike: &mut AutomaticBike) {
        if(auto_bike.switch_on) {
            auto_bike.is_on = false;
            auto_bike.accelerate = 0;
            auto_bike.current_gear = 0;
        };
        false
    }

    public fun accelerate_bike(auto_bike: &mut AutomaticBike, speed: u8) {
        if(!auto_bike.is_on) {
            return;
        };
        if(auto_bike.is_on) {
            auto_bike.accelerate = speed;
            if(speed >= 0 && speed <= 20) {
                auto_bike.current_gear = 1;
            } else if(speed > 20 && speed <= 30) {
                auto_bike.current_gear = 2;
            } else if(speed > 30 && speed <= 40) {
                auto_bike.current_gear = 3;
            } else if(speed > 40 && speed <= 50) {
                auto_bike.current_gear = 4;
            } else {
                auto_bike.current_gear = 5;
            };
        };
    }
}

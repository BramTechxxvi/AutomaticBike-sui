module automatic_bike::automatic_bike {
    use std::string::String;

    public struct AutomaticBike has drop {
        switch_on: bool,
        current_gear: u8,
        current_speed: u8,
    }

    public fun new_bike(): AutomaticBike {
        AutomaticBike {
            switch_on: false,
            current_gear: 0,
            current_speed: 0,
        }
    }

    public fun turn_on_bike(auto_bike: &mut AutomaticBike) {
        if(!auto_bike.switch_on) {
            auto_bike.switch_on = true;
        };
        true
    }

    public fun turn_off_bike(auto_bike: &mut AutomaticBike) {
        if(auto_bike.switch_on) {
            auto_bike.switch_on = false;
            auto_bike.current_speed = 0;
            auto_bike.current_gear = 0;
        };
        false
    }

    public fun is_on(auto_bike: &AutomaticBike): bool {
        auto_bike.switch_on
    }

    public fun change_gear(auto_bike: &mut AutomaticBike, gear: u8) {
        if(!auto_bike.switch_on) {
            return;
        };
        if(gear < 1 || gear > 4) {
            abort 1;
        };
        auto_bike.current_gear = gear;
    }

    public fun current_gear(auto_bike: &AutomaticBike): u8 {
        auto_bike.current_gear
    }
    public fun accelerate_bike(auto_bike: &mut AutomaticBike) {
        if(auto_bike.switch_on) {
            if(auto_bike.current_gear == 1) {
                auto_bike.current_speed = auto_bike.current_speed + 1;
            } else if(auto_bike.current_gear == 2) {
                auto_bike.current_speed = auto_bike.current_speed + 2;
            } else if(auto_bike.current_gear == 3) {
                auto_bike.current_speed = auto_bike.current_speed + 3;
            } else {
                auto_bike.current_speed = auto_bike.current_speed + 4;
            };
        };
        update_gear(auto_bike);
    }

    public fun get_current_speed(auto_bike: &AutomaticBike): u8 {
        auto_bike.current_speed
    }

    public fun update_gear(auto_bike: &mut AutomaticBike) {
        if(auto_bike.current_speed <= 20) {
            auto_bike.current_gear = 1;
        } else if(auto_bike.current_speed >= 21 && auto_bike.current_speed <= 30) {
            auto_bike.current_gear = 2;
        } else if(auto_bike.current_speed >= 31 && auto_bike.current_speed <= 40) {
            auto_bike.current_gear = 3;
        } else {
            auto_bike.current_gear = 4;
        };
    }

    public fun decelerate_bike(auto_bike: &mut AutomaticBike) {
        if(auto_bike.current_speed == 0) {
            return;
        };
        if(auto_bike.switch_on) {
            if(auto_bike.current_gear == 1) {
                auto_bike.current_speed = auto_bike.current_speed - 1;
            } else if(auto_bike.current_gear == 2) {
                auto_bike.current_speed = auto_bike.current_speed - 2;
            } else if(auto_bike.current_gear == 3) {
                auto_bike.current_speed = auto_bike.current_speed - 3;
            } else {
                auto_bike.current_speed = auto_bike.current_speed - 4;
            };
        };
        update_gear(auto_bike);
    }
}
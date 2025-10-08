module automatic_bike::automatic_bike {
    use std::string::String;

    public struct Bike {
        start_bike: bool,
        curent_gear: u8,
        accelerate: u8,
    }

    public fun new_bike(): Bike {
        Bike {
            start_bike: false,
            curent_gear: 0,
            accelerate: 0,
        }
    }
}

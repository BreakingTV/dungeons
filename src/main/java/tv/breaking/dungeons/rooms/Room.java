package tv.breaking.dungeons.rooms;

import org.bukkit.Location;

enum Type {
    DEFAULT,
    START,
    SHOP,
    SPECIAL ,
    END,
}

public class Room {
    int doors = 1;

    public void setDoors(int doors) {
        if (doors > 4 || doors < 1) {
            throw new IllegalArgumentException();
        } else this.doors = doors;
    }

    public int getDoors() {
        return doors;
    }


    public void createRoom(Location location) {

    }
}

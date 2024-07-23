package tv.breaking.dungeons.rooms;

interface GeneratorInterface {
    public void createRoom(Room room);
    public void deleteRoom(Room room);
    public void getRoom(Room room);
}



public class Generator implements GeneratorInterface {

    @Override
    public void createRoom(Room room) {
        System.out.println(room);
    }

    @Override
    public void deleteRoom(Room room) {

    }

    @Override
    public void getRoom(Room room) {
    }

}
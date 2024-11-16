package model.writer;
import model.registry.HumanFriends;

public interface Writable {
    boolean save(HumanFriends registry);
    Object read();
}

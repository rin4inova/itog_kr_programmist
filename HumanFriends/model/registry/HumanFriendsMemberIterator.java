package model.registry;
import java.util.Iterator;
import java.util.List;

import model.member.HumanFriendsItem;

public class HumanFriendsMemberIterator<HF extends HumanFriendsItem> implements Iterator<HF> {
    private int index;
    private List<HF> members;

    public HumanFriendsMemberIterator(List<HF> members) {
        this.members = members;
    }

    @Override
    public boolean hasNext() {
        return index < members.size();
    }

    @Override
    public HF next() {
        return members.get(index++);
    }

}

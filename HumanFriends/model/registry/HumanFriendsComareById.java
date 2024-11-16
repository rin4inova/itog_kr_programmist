package model.registry;

import java.util.Comparator;
import model.member.HumanFriendsItem;

public class HumanFriendsComareById<HF extends HumanFriendsItem> implements Comparator<HF> {
    @Override
    public int compare(HF f1, HF f2) {
        return f1.getId().compareTo(f2.getId());
    }
}

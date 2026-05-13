package fr.ubdx.net.model;

import java.util.ArrayList;
import java.util.List;

public class SushiStorage {
    private static SushiStorage instance;
    private List<Sushi> sushis;

    private SushiStorage() {
        sushis = new ArrayList<>();
        // Mock data
        sushis.add(new Sushi("1", "Maki Saumon", "Maki classique au saumon", 4.50));
        sushis.add(new Sushi("2", "Nigiri Thon", "Nigiri au thon rouge", 5.50));
    }

    public static SushiStorage getInstance() {
        if (instance == null) {
            instance = new SushiStorage();
        }
        return instance;
    }

    public List<Sushi> getSushis() {
        return sushis;
    }

    public void addSushi(Sushi s) {
        sushis.add(s);
    }

    public void removeSushi(String id) {
        sushis.removeIf(s -> s.getId().equals(id));
    }
}

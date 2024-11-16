package model;


import java.util.HashMap;
import java.util.Map;


public class Animals {
    private Integer animalId;
    private String description;
    private Map<Integer, String> animals = new HashMap<>();

    public Animals() {
        animals.put(1, "Pets");
        animals.put(2, "PackAnimals");
    }

    public String printAnimalTypes(){
        StringBuilder sb = new StringBuilder();
        sb.append("Animals: \n");
        for (Map.Entry<Integer, String> entry : animals.entrySet()) {
            sb.append("id: ").append(entry.getKey()).append(", description: ").append(entry.getValue()).append("\n");
        }
        return sb.toString();
    }

    public void addNewAnimalType(String description) {
        int maxKey = -1;
        for(int key: animals.keySet()) {
            if (key > maxKey) {
                maxKey = key;
            }
        }
        animals.put(maxKey + 1, description);
    }

    public void removeAnimalType(String description) {
        int keyToRemove = -1;
        for(int key: animals.keySet()) {
            if(animals.get(key).equals(description)) {
                keyToRemove = key;
            }
        }

        if(keyToRemove == -1) {
            System.out.println("There is no specified animal type");
        } else {
            animals.remove(keyToRemove);
        }
    }

    public Integer getIdByDescription(String prompt) {
        int id = -1;
        for(Map.Entry<Integer, String> entry: animals.entrySet()) {
            if(entry.getValue().equals(prompt)) {
                id = entry.getKey();
                break;
            }
        }
        return id;
    }

    public String getDescriptionByID(Integer id) {
        String description = animals.get(id);
        return description;
    }

}

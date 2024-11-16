package model;

import java.util.HashMap;
import java.util.Map;

public abstract class PackAnimals {
    private Map<Integer, String> packAnimals = new HashMap<>();
    private Integer id;
    private String description;
    private Integer animalId;
    private String animalDescription;
    private static final String petType = "PackAnimals";

    public PackAnimals() {
        packAnimals.put(1, "Horses");
        packAnimals.put(2, "Camels");
        packAnimals.put(3, "Donkeys");
    }

    public String printPackAnimals(){
        StringBuilder sb = new StringBuilder();
        Animals animals = new Animals();
        animalId = animals.getIdByDescription(petType);
        animalDescription = animals.getDescriptionByID(animalId);

        sb.append("Pack animals: \n");
        for (Map.Entry<Integer, String> entry : packAnimals.entrySet()) {

            sb.append("id: ").append(entry.getKey()).append(", description: ").append(entry.getValue()).append(", ")
                    .append("animalId: ").append(animalId).append(", description: ").append(animalDescription).append("\n");
        }
        return sb.toString();
    }

    public void addNewPackAnimalType(String description) {
        int maxKey = -1;
        for(int key: packAnimals.keySet()) {
            if (key > maxKey) {
                maxKey = key;
            }
        }
        packAnimals.put(maxKey + 1, description);
    }

    public void removePackAnimalType(String description) {
        Integer keyToRemove = null;
        for(Map.Entry<Integer, String> entry : packAnimals.entrySet()) {
            if(entry.getValue().equals(description)) {
                keyToRemove = entry.getKey();
                break;
            }
        }

        if(keyToRemove == null) {
            throw new IllegalArgumentException("There is no specified pack animal type");
        } else {
            packAnimals.remove(keyToRemove);
        }
    }

    public Integer getID(String description) {
        int id = -1;
        for(Map.Entry<Integer, String> entry : packAnimals.entrySet()) {
            if(entry.getValue().equals(description)) {
                id = entry.getKey();
                break;
            }
        }
        return id;
    }

    public String getDescriptionByID(Integer id) {
        return packAnimals.get(id);
    }

    public Map<Integer, String> getPackAnimalsList() {
        return packAnimals;
    }

    public String printPackAnimalTypes() {
        StringBuilder sb = new StringBuilder();

        for (int i = 0; i < packAnimals.size(); i++) {
            if (i < packAnimals.size() -1 ) {
                sb.append(packAnimals.get(i+1)).append(", ");
            } else {
                sb.append(packAnimals.get(i+1));
            }
        }

        return sb.toString();
    }

    public String getPetType () {
        return petType;
    }
}